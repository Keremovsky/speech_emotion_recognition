from rest_framework import viewsets, status
from rest_framework.decorators import action, APIView
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication
from django.core.files import File
from django.core.files.base import ContentFile

from pydub import AudioSegment
import tempfile
import os
import base64

from ..util.similarity_calculation import balanced_js_similarity
from ..models import Challenge, ChallengeHistory
from ..serializers import (
    ChallengeSerializer,
    PreChallengeSerializer,
    RecordingChallengeSerializer,
    UploadedRecordingChallengeSerializer,
    ResultModelSerializer,
)


class ChallengeViewSet(viewsets.ModelViewSet):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    queryset = Challenge.objects.all()
    http_method_names = ["get"]

    def get_serializer_class(self):
        if self.action in ["pre", "random_pre", "popular_pre"]:
            return PreChallengeSerializer
        elif self.action == "recording":
            return RecordingChallengeSerializer
        elif self.action == "get_history_scores":
            return ResultModelSerializer
        return ChallengeSerializer

    @action(detail=True, methods=["get"])
    def pre(self, request, pk=None):
        challenge = self.get_object()
        serializer = self.get_serializer(challenge)
        return Response(serializer.data)

    @action(detail=False, methods=["get"], url_path="pre/random")
    def random_pre(self, request):
        queryset = Challenge.objects.order_by("?")[:20]
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=["get"], url_path="pre/popular")
    def popular_pre(self, request):
        queryset = Challenge.objects.order_by("-try_count")[:10]
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @action(detail=True, methods=["get"])
    def recording(self, request, pk=None):
        challenge = self.get_object()
        serializer = self.get_serializer(challenge)
        return Response(serializer.data)

    @action(detail=True, methods=["get"])
    def get_history_scores(self, request, pk=None):
        user = request.user
        challenge = self.get_object()

        challenge_histories = ChallengeHistory.objects.filter(
            user=user, challenge=challenge
        ).order_by("-challenge_date")

        serializer = self.get_serializer(challenge_histories, many=True)

        return Response(serializer.data)


class TryChallengeView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request, id):
        serializer = UploadedRecordingChallengeSerializer(data=request.data)

        if serializer.is_valid():
            user = request.user
            challenge = get_object_or_404(Challenge, id=id)

            base64_audio = serializer.validated_data.get("recording")
            audio_data = base64.b64decode(base64_audio)
            m4a_file = ContentFile(audio_data, name="input.m4a")

            audio = AudioSegment.from_file(m4a_file, format="m4a")

            with tempfile.NamedTemporaryFile(suffix=".wav", delete=False) as tmp_wav:
                audio.export(tmp_wav.name, format="wav")
                tmp_wav.seek(0)
                wav_django_file = File(tmp_wav, name=os.path.basename(tmp_wav.name))

                # Save ChallengeHistory with converted .wav file
                # emotions = predict_emotions_from_wav(tmp_wav.name)
                emotions = [0.13, 0, 0.01, 0, 0.85, 0, 0.1, 0]
                score = balanced_js_similarity(challenge.emotions, emotions)

                new_challenge_history = ChallengeHistory(
                    user=user,
                    challenge=challenge,
                    score=score,
                    emotions=emotions,
                    user_recording=wav_django_file,
                )
                new_challenge_history.save()

                challenge.average = (
                    challenge.average * challenge.try_count + score
                ) / (challenge.try_count + 1)
                challenge.try_count += 1

                challenge.save()

                os.unlink(tmp_wav.name)

            serializer = ResultModelSerializer(new_challenge_history)

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
