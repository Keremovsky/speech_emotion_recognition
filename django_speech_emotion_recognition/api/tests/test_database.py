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

        # create 25 ChallengeHistory entries
        for i in range(25):
            ChallengeHistory.objects.create(
                user=self.user,
                challenge=self.dummy_challenge,
                emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
                score=80 + i,
                challenge_date=timezone.now() - timedelta(days=i),
            )

        # one history for testing by id
        self.dummy_history = ChallengeHistory.objects.create(
            user=self.user,
            challenge=self.dummy_challenge,
            emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
            score=50,
        )

        self.challenge_history_count = ChallengeHistory.objects.count()

        self.token = get_tokens(self.user)["access"]
        self.auth_headers = {"HTTP_AUTHORIZATION": f"Bearer {self.token}"}

    # test READ from challenge history
    def test_challenge_history_pre_read(self):
        url = reverse("challenge-histories-pre")
        res = self.client.get(url, **self.auth_headers)

        # check if request is successful
        self.assertEqual(res.status_code, 200)
        # control total number of challenge histories fetched
        self.assertEqual(len(res.data), 20)

    # test WRITE from challenge history
    def test_challenge_history_write(self):
        url = reverse("try-challenge", kwargs={"id": self.dummy_challenge.id})

        base64_audio = generate_base64_m4a_from_file()
        data = {"recording": base64_audio}

        res = self.client.post(url, data=data, format="json", **self.auth_headers)

        # check if request is successful
        self.assertEqual(res.status_code, 201)
        # control if total count of challenge history object is increased by one
        self.assertEqual(
            ChallengeHistory.objects.count(), self.challenge_history_count + 1
        )

        history = ChallengeHistory.objects.first()

        # make sure that the one user who requested and history's user is same
        self.assertEqual(history.user, self.user)
        # same, check challenge
        self.assertEqual(history.challenge, self.dummy_challenge)
        # control if user recording is saved
        self.assertIsNotNone(history.user_recording)
        # control if score saved correctly
        self.assertGreaterEqual(history.score, 0.0)

    # test DELETE from challenge history
    def test_challenge_history_delete(self):
        url = reverse(
            "challenge-histories-detail", kwargs={"pk": self.dummy_history.id}
        )
        res = self.client.delete(url, **self.auth_headers)

        # check if request is successful
        self.assertEqual(res.status_code, 204)
        # control if challenge history deleted
        self.assertFalse(
            ChallengeHistory.objects.filter(pk=self.dummy_history.id).exists()
        )

    # test UPDATE from user
    def test_profile_update(self):
        url = reverse("edit-profile")

        base64_image = generate_base64_image()
        data = {
            "username": "new_username",
            "profile_pic": base64_image,
        }

        res = self.client.put(url, data=data, format="json", **self.auth_headers)

        # check if request is successful
        self.assertEqual(res.status_code, 201)

        self.user.refresh_from_db()
        # control if username changed
        self.assertEqual(self.user.username, "new_username")
        # control if profile pic uploaded without any problem
        self.assertIn("profile_pics/", self.user.profile_pic.name)
