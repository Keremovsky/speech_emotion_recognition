from rest_framework import viewsets
from .models import User, Challenge, ChallengeHistory
from .serializers import (
    UserSerializer,
    ChallengeSerializer,
    ChallengeHistorySerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class ChallengeViewSet(viewsets.ModelViewSet):
    queryset = Challenge.objects.all()
    serializer_class = ChallengeSerializer


class CHallengeHistoryViewSet(viewsets.ModelViewSet):
    queryset = ChallengeHistory.objects.all()
    serializer_class = ChallengeHistorySerializer
