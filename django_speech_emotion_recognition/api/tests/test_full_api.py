from rest_framework.test import APITestCase
from django.urls import reverse
from django.contrib.auth import get_user_model
from rest_framework_simplejwt.tokens import RefreshToken
from api.models import Challenge, ChallengeHistory
from django.core.files.uploadedfile import SimpleUploadedFile

User = get_user_model()


def get_tokens(user):
    refresh = RefreshToken.for_user(user)
    return {"access": str(refresh.access_token), "refresh": str(refresh)}


class TestFullAPI(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            username="testuser", email="test@example.com", password="testpass123"
        )
        self.token = get_tokens(self.user)["access"]
        self.headers = {"HTTP_AUTHORIZATION": f"Bearer {self.token}"}

        self.challenge = Challenge.objects.create(
            title="Test Challenge",
            description="This is a test challenge.",
            sentence="Test sentence for challenge.",
            level=1,
            average=0.0,
            try_count=0,
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
        data = {"email": "test@example.com", "password": "testpass123"}
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
        res = self.client.post(url, {"email": "test@example.com"})
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
        challenge = self.challenge
        url = reverse("try-challenge", args=[challenge.id])
        dummy_audio = SimpleUploadedFile(
            "test.mp3", b"file_content", content_type="audio/mpeg"
        )
        res = self.client.post(url, {"user_recording": dummy_audio}, **self.headers)
        self.assertEqual(res.status_code, 201)

    def test_challenge_histories_list(self):
        url = reverse("challenge-histories-list")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)

    def test_challenge_history_pre(self):
        url = reverse("challenge-histories-pre")
        res = self.client.get(url, **self.headers)
        self.assertEqual(res.status_code, 200)
