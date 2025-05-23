from rest_framework.test import APITestCase
from django.urls import reverse
from django.contrib.auth import get_user_model


from api.models import Challenge
from django_speech_emotion_backend.secrets import test_user_data
from .util import (
    get_tokens,
    generate_base64_m4a_from_file,
)

User = get_user_model()


class TestModelAPI(APITestCase):
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

    def test_try_challenge(self):
        url = reverse("try-challenge", kwargs={"id": self.challenge.id})

        base64_audio = generate_base64_m4a_from_file()
        data = {"recording": base64_audio}

        res = self.client.post(url, data=data, format="json", **self.headers)
        self.assertEqual(res.status_code, 201)
