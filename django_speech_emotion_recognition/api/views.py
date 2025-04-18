from rest_framework import viewsets
from .models import User, Challenge, ChallengeHistory
from rest_framework.decorators import action
from rest_framework.response import Response
from .serializers import (
    UserSerializer,
    ChallengeSerializer,
    PreChallengeSerializer,
    RecordingChallengeSerializer,
    ChallengeHistorySerializer,
    PreChallengeHistorySerializer,
    PostChallengeHistorySerializer,
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
        if self.action in ["pre", "random_pre"]:
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

    @action(detail=True, methods=["get"])
    def recording(self, request, pk=None):
        challenge = self.get_object()
        serializer = self.get_serializer(challenge)
        return Response(serializer.data)


class ChallengeHistoryViewSet(viewsets.ModelViewSet):
    queryset = ChallengeHistory.objects.all()
    http_method_names = ["get"]

    def get_serializer_class(self):
        if self.action == "pre":
            return PreChallengeHistorySerializer
        elif self.action == "rest":
            return PostChallengeHistorySerializer
        return ChallengeHistorySerializer

    @action(detail=False, methods=["get"])
    def pre(self, request):
        user = request.user
        challenge_histories = ChallengeHistory.objects.filter(user=user)
        serializer = self.get_serializer(challenge_histories, many=True)
        return Response(serializer.data)

    @action(detail=True, methods=["get"])
    def rest(self, request, pk=None):
        challenge = self.get_object()
        serializer = self.get_serializer(challenge)
        return Response(serializer.data)
