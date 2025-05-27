from rest_framework.test import APITestCase
from django.contrib.auth import get_user_model
from django.urls import reverse
from datetime import timedelta
from django.utils import timezone

from api.models import ChallengeHistory, Challenge
from django_speech_emotion_backend.secrets import test_user_data
from .util import (
    get_tokens,
    generate_base64_image,
    generate_base64_m4a_from_file,
)


class TestDatabase(APITestCase):
    def setUp(self):
        User = get_user_model()
        self.user = User.objects.create_user(
            email=test_user_data["email"],
            username="test_user",
            password=test_user_data["password"],
        )

        self.dummy_challenge = Challenge.objects.create(
            title="Try Me",
            description="description",
            sentence="sentence",
            emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
            level=0,
        )

        for i in range(25):
            ChallengeHistory.objects.create(
                user=self.user,
                challenge=self.dummy_challenge,
                emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
                score=80 + i,
                challenge_date=timezone.now() - timedelta(days=i),
            )

        self.dummy_history = ChallengeHistory.objects.create(
            user=self.user,
            challenge=self.dummy_challenge,
            emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
            score=50,
        )

        self.challenge_history_count = ChallengeHistory.objects.count()

        self.token = get_tokens(self.user)["access"]
        self.auth_headers = {"HTTP_AUTHORIZATION": f"Bearer {self.token}"}

    def test_challenge_history_pre_read(self):
        url = reverse("challenge-histories-pre")
        res = self.client.get(url, **self.auth_headers)

        self.assertEqual(res.status_code, 200)
        self.assertEqual(len(res.data), 20)

    def test_challenge_history_write(self):
        url = reverse("try-challenge", kwargs={"id": self.dummy_challenge.id})

        base64_audio = generate_base64_m4a_from_file()
        data = {"recording": base64_audio}

        res = self.client.post(url, data=data, format="json", **self.auth_headers)

        self.assertEqual(res.status_code, 201)
        self.assertEqual(
            ChallengeHistory.objects.count(), self.challenge_history_count + 1
        )

        history = ChallengeHistory.objects.first()

        self.assertEqual(history.user, self.user)
        self.assertEqual(history.challenge, self.dummy_challenge)
        self.assertIsNotNone(history.user_recording)
        self.assertGreaterEqual(history.score, 0.0)

    def test_challenge_history_delete(self):
        url = reverse(
            "challenge-histories-detail", kwargs={"pk": self.dummy_history.id}
        )
        res = self.client.delete(url, **self.auth_headers)

        self.assertEqual(res.status_code, 204)
        self.assertFalse(
            ChallengeHistory.objects.filter(pk=self.dummy_history.id).exists()
        )

    def test_profile_update(self):
        url = reverse("edit-profile")

        base64_image = generate_base64_image()
        data = {
            "username": "new_username",
            "profile_pic": base64_image,
        }

        res = self.client.put(url, data=data, format="json", **self.auth_headers)

        self.assertEqual(res.status_code, 201)

        self.user.refresh_from_db()
        self.assertEqual(self.user.username, "new_username")
        self.assertIn("profile_pics/", self.user.profile_pic.name)
