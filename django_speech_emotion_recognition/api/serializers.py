from rest_framework import serializers
from .models import User, Challenge, ChallengeHistory


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"


class ChallengeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Challenge
        fields = "__all__"


class ChallengeHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ChallengeHistory
        fields = "__all__"
