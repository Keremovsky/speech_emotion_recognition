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


class PreChallengeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Challenge
        fields = ["id", "title", "sentence", "description", "level"]


class RecordingChallengeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Challenge
        fields = ["recording"]


class ChallengeHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ChallengeHistory
        fields = "__all__"


class PreChallengeHistorySerializer(serializers.ModelSerializer):
    challenge_title = serializers.CharField(source="challenge.title", read_only=True)

    class Meta:
        model = ChallengeHistory
        fields = [
            "id",
            "challenge_title",
            "score",
        ]


class PostChallengeHistorySerializer(serializers.ModelSerializer):
    challenge_description = serializers.CharField(
        source="challenge.description", read_only=True
    )
    challenge_sentence = serializers.CharField(
        source="challenge.sentence", read_only=True
    )
    challenge_level = serializers.IntegerField(source="challenge.level", read_only=True)
    challenge_average = serializers.FloatField(
        source="challenge.average", read_only=True
    )
    challenge_recording = serializers.FileField(
        source="challenge.recording", read_only=True
    )
    challenge_emotions = serializers.FileField(
        source="challenge.emotions", read_only=True
    )

    class Meta:
        model = ChallengeHistory
        fields = [
            "challenge_description",
            "challenge_sentence",
            "challenge_level",
            "challenge_average",
            "challenge_recording",
            "challenge_emotions",
            "emotions",
        ]


class ResultModelSerializer(serializers.ModelSerializer):
    score = serializers.FloatField()
    average_score = serializers.FloatField(source="challenge.average")
    challenge_emotions = serializers.JSONField(source="challenge.emotions")
    emotions = serializers.JSONField()

    class Meta:
        model = ChallengeHistory
        fields = [
            "score",
            "average_score",
            "challenge_emotions",
            "emotions",
        ]
