from rest_framework import viewsets, status
from rest_framework.decorators import action, APIView
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from ..models import Challenge, ChallengeHistory
from ..serializers import (
    ChallengeSerializer,
    PreChallengeSerializer,
    RecordingChallengeSerializer,
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
        serializer = RecordingChallengeSerializer(data=request.data)

        if serializer.is_valid():
            user = request.user
            challenge = get_object_or_404(Challenge, id=id)

            # AI emotion detection will fill this
            emotions = [0, 87.0, 5.0, 1.0, 0, 15.0, 0]
            # score will be calculated based on selected algorithm
            score = 100.0

            new_challenge_history = ChallengeHistory(
                user=user,
                challenge=challenge,
                score=score,
                emotions=emotions,
                user_recording=serializer.validated_data.get("user_recording"),
            )
            new_challenge_history.save()

            challenge.try_count += 1
            challenge.save()

            serializer = ResultModelSerializer(new_challenge_history)

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
