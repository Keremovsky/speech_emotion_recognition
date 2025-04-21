from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator, MaxValueValidator

import os
from datetime import datetime


class User(AbstractUser):
    username = models.CharField(max_length=100, unique=False)
    email = models.EmailField(unique=True)
    profile_pic = models.ImageField(upload_to="profile_pics/", null=True, blank=True)
    register_date = models.DateTimeField(auto_now_add=True)

    EMAIL_FIELD = "email"
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username"]

    def __str__(self):
        return self.email


class Challenge(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    sentence = models.TextField()
    level = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(2)])
    average = models.FloatField(default=0.0)
    recording = models.FileField(
        upload_to="challenge_recordings/", null=True, blank=True
    )
    emotions = models.JSONField(null=True, blank=True)
    try_count = models.IntegerField(default=0)

    def __str__(self):
        return self.title


def user_recording_upload_path(instance, filename):
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    base, ext = os.path.splitext(filename)
    return f"user_recordings/user_{instance.user.id}/{base}_{timestamp}{ext}"


class ChallengeHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="history")
    challenge = models.ForeignKey(
        Challenge, on_delete=models.CASCADE, related_name="history"
    )
    challenge_date = models.DateTimeField(auto_now_add=True)
    user_recording = models.FileField(upload_to=user_recording_upload_path)
    emotions = models.JSONField(null=True, blank=True)
    score = models.FloatField()

    def __str__(self):
        return f"{self.user.name} - {self.challenge.title}"
