from rest_framework import serializers
from .models import User, Challenge, ChallengeHistory
from rest_framework_simplejwt.serializers import (
    TokenObtainPairSerializer,
    TokenRefreshSerializer,
)
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import authenticate

import base64


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
    recording = serializers.SerializerMethodField()

    class Meta:
        model = Challenge
        fields = ["recording"]

    def get_recording(self, obj):
        if obj.recording:
            with obj.recording.open("rb") as f:
                return base64.b64encode(f.read()).decode("utf-8")
        return None


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
    challenge_emotions = serializers.ListField(
        source="challenge.emotions", read_only=True
    )

    class Meta:
        model = ChallengeHistory
        fields = [
            "challenge_description",
            "challenge_sentence",
            "challenge_level",
            "challenge_average",
            "challenge_emotions",
            "emotions",
            "score",
        ]


class ResultModelSerializer(serializers.ModelSerializer):
    score = serializers.FloatField()
    average_score = serializers.FloatField(source="challenge.average")
    challenge_emotions = serializers.ListField(
        source="challenge.emotions", child=serializers.FloatField(), read_only=True
    )
    emotions = serializers.ListField(child=serializers.FloatField(), read_only=True)

    class Meta:
        model = ChallengeHistory
        fields = [
            "score",
            "average_score",
            "challenge_emotions",
            "emotions",
        ]


class TokenObtainPairSerializer(TokenObtainPairSerializer):
    username_field = User.EMAIL_FIELD

    def validate(self, attrs):
        email = attrs.get("email")
        password = attrs.get("password")

        user = authenticate(
            request=self.context.get("request"),
            username=email,
            password=password,
        )

        if not user:
            raise serializers.ValidationError("Invalid credentials")

        data = super().validate({"email": email, "password": password})
        data["username"] = user.username
        data["email"] = user.email
        data["profile_pic"] = user.profile_pic.url
        data["register_day"] = user.date_joined
        return data

    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token["email"] = user.email
        return token


class CustomTokenRefreshSerializer(TokenRefreshSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        refresh = RefreshToken(attrs["refresh"])
        user = User.objects.get(id=refresh["user_id"])

        data["username"] = user.username
        data["email"] = user.email
        data["profile_pic"] = user.profile_pic.url
        data["register_day"] = user.date_joined

        return data


class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True, min_length=8)

    class Meta:
        model = User
        fields = ("email", "username", "password")

    def create(self, validated_data):
        user = User.objects.create_user(
            email=validated_data["email"],
            username=validated_data["username"],
            password=validated_data["password"],
        )
        return user


class EditProfileSerializer(serializers.ModelSerializer):
    profile_pic = serializers.ImageField(required=False)

    class Meta:
        model = User
        fields = ("username", "profile_pic")
