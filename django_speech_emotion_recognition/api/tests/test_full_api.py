from rest_framework.test import APITestCase
from django.urls import reverse
from django.contrib.auth import get_user_model
from django.core.files.uploadedfile import SimpleUploadedFile


from api.models import Challenge, ChallengeHistory
from django_speech_emotion_backend.secrets import test_user_data
from .util import (
    get_tokens,
    generate_base64_m4a_from_file,
)

User = get_user_model()


class TestFullAPI(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            email=test_user_data["email"],
            username="test_user",
            password=test_user_data["password"],
        )

        self.token = get_tokens(self.user)["access"]
        self.headers = {"HTTP_AUTHORIZATION": f"Bearer {self.token}"}

        self.challenge = Challenge.objects.create(
            title="Test Challenge",
            description="This is a test challenge.",
            sentence="Test sentence for challenge.",
            emotions=[0.07, 0.0, 0.0, 0.0, 0.91, 0.0, 0.01, 0.0],
            level=1,
        )

        self.challenge_history = ChallengeHistory.objects.create(
            user=self.user,
            challenge=self.challenge,
            score=80.0,
            user_recording=SimpleUploadedFile(
                "test_recording.wav", b"dummy content", content_type="audio/wav"
            ),
        )

    def test_register(self):
        url = reverse("register")
        data = {
            "username": "newuser",
            "email": "new@example.com",
            "password": "testpass123",
        }
        res = self.client.post(url, data)
        self.assertEqual(res.status_code, 201)

    def test_login(self):
        url = reverse("login")
        data = {
            "email": test_user_data["email"],
            "password": test_user_data["password"],
        }
        res = self.client.post(url, data)
        self.assertEqual(res.status_code, 200)
        self.assertIn("access", res.data)

    def test_token_refresh(self):
        refresh = get_tokens(self.user)["refresh"]
        url = reverse("token-refresh")
        res = self.client.post(url, {"refresh": refresh})
        self.assertEqual(res.status_code, 200)

    def test_send_reset_pin(self):
        url = reverse("reset-mail")
        res = self.client.post(url, {"email": test_user_data["email"]})
        self.assertEqual(res.status_code, 200)

    def test_verify_reset_pin_invalid(self):
        url = reverse("reset-pin")
        res = self.client.post(url, {"email": "wrong@example.com", "pin": "0000"})
        self.assertEqual(res.status_code, 400)

    def test_reset_password_invalid(self):
        url = reverse("reset-password")
        res = self.client.post(
            url, {"email": "test@example.com", "pin": "0000", "new_password": "123456"}
        )
        self.assertEqual(res.status_code, 400)

    def test_delete_account(self):
        url = reverse("delete-account")
        res = self.client.delete(url, **self.headers)
        self.assertEqual(res.status_code, 201)

    def test_challenges_list(self):
        url = reverse("challenges-list")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)

    def test_challenge_random_pre(self):
        url = reverse("challenges-random-pre")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)

    def test_challenge_popular_pre(self):
        url = reverse("challenges-popular-pre")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)

    def test_try_challenge(self):
        url = reverse("try-challenge", kwargs={"id": self.challenge.id})

        base64_audio = generate_base64_m4a_from_file()
        data = {"recording": base64_audio}

        res = self.client.post(url, data=data, format="json", **self.headers)
        self.assertEqual(res.status_code, 201)

    def test_challenge_histories_list(self):
        url = reverse("challenge-histories-list")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)

    def test_challenge_history_pre(self):
        url = reverse("challenge-histories-pre")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)
