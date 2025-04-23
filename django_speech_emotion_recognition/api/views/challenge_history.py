from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from ..models import ChallengeHistory
from ..serializers import (
    ChallengeHistorySerializer,
    PreChallengeHistorySerializer,
    PostChallengeHistorySerializer,
)


class ChallengeHistoryViewSet(viewsets.ModelViewSet):
    queryset = ChallengeHistory.objects.all()
    http_method_names = ["get", "post", "delete"]

    def get_serializer_class(self):
        if self.action == "pre":
            return PreChallengeHistorySerializer
        elif self.action == "rest":
            return PostChallengeHistorySerializer
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
