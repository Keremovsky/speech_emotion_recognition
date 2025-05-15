from rest_framework_simplejwt.tokens import RefreshToken

from PIL import Image
from io import BytesIO
import base64
import os


def get_tokens(user):
    refresh = RefreshToken.for_user(user)
    return {"access": str(refresh.access_token), "refresh": str(refresh)}


def generate_base64_m4a_from_file():
    path = os.path.join(os.path.dirname(__file__), "assets/lisan-al-gaib.m4a")
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")


def generate_base64_image():
    image = Image.new("RGB", (100, 100), color="blue")
    buffered = BytesIO()
    image.save(buffered, format="JPEG")
    return base64.b64encode(buffered.getvalue()).decode("utf-8")
