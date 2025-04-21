from rest_framework import viewsets, status
from rest_framework.decorators import action, APIView
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import User, Challenge, ChallengeHistory
from .serializers import (
    UserSerializer,
    ChallengeSerializer,
    PreChallengeSerializer,
    RecordingChallengeSerializer,
    ChallengeHistorySerializer,
    PreChallengeHistorySerializer,
    PostChallengeHistorySerializer,
    ResultModelSerializer,
    TokenObtainPairSerializer,
)
import random


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    http_method_names = ["get", "post", "update", "delete"]


class ChallengeViewSet(viewsets.ModelViewSet):
    queryset = Challenge.objects.all()
    http_method_names = ["get"]

    def get_serializer_class(self):
        if self.action in ["pre", "random_pre", "popular_pre"]:
            return PreChallengeSerializer
        elif self.action == "recording":
            return RecordingChallengeSerializer
        return ChallengeSerializer

    @action(detail=True, methods=["get"])
    def pre(self, request, pk=None):
        challenge = self.get_object()
        serializer = self.get_serializer(challenge)
        return Response(serializer.data)

    @action(detail=False, methods=["get"], url_path="pre/random")
    def random_pre(self, request):
        count = Challenge.objects.count()
        random_ids = random.sample(range(1, count + 1), min(20, count))
        queryset = Challenge.objects.filter(id__in=random_ids)
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


class ChallengeHistoryViewSet(viewsets.ModelViewSet):
    queryset = ChallengeHistory.objects.all()
    http_method_names = ["get", "post", "delete"]

    def get_serializer_class(self):
        if self.action == "pre":
            return PreChallengeHistorySerializer
        elif self.action == "rest":
            return PostChallengeHistorySerializer
        elif self.action == "get_history_score":
            return ResultModelSerializer
        return ChallengeHistorySerializer

    @action(detail=False, methods=["get"])
    def pre(self, request):
        user = request.user
        challenge_histories = ChallengeHistory.objects.filter(user=user).order_by(
            "-challenge_date"
        )[:20]
        serializer = self.get_serializer(challenge_histories, many=True)
        return Response(serializer.data)

    @action(detail=True, methods=["get"])
    def rest(self, request, pk=None):
        challenge_history = self.get_object()
        serializer = self.get_serializer(challenge_history)
        return Response(serializer.data)

    @action(detail=True, methods=["get"])
    def get_history_scores(self, request, pk=None):
        user = request.user
        challenge_history = self.get_object()

        challenge = challenge_history.challenge

        challenge_histories = ChallengeHistory.objects.filter(
            user=user, challenge=challenge
        ).order_by("-challenge_date")

        serializer = self.get_serializer(challenge_histories, many=True)

        return Response(serializer.data)


class TryChallengeView(APIView):
    def post(self, request, id):
        serializer = RecordingChallengeSerializer(data=request.data)

        if serializer.is_valid():
            user = request.user
            challenge = get_object_or_404(Challenge, id=id)

            # AI emotion detection will fill this
            emotions = {}
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


class LoginView(TokenObtainPairView):
    serializer_class = TokenObtainPairSerializer
