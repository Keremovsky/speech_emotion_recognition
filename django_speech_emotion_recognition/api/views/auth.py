from rest_framework import viewsets, status
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework.decorators import APIView
from rest_framework.response import Response
from django.core.mail import send_mail
from django.conf import settings

from ..models import User, PasswordResetCode
from ..serializers import (
    UserSerializer,
    TokenObtainPairSerializer,
    CustomTokenRefreshSerializer,
    RegisterSerializer,
)

import random


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    http_method_names = ["get", "post", "update", "delete"]


class LoginView(TokenObtainPairView):
    serializer_class = TokenObtainPairSerializer


class CustomTokenRefreshView(TokenRefreshView):
    serializer_class = CustomTokenRefreshSerializer


class RegisterView(APIView):
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(
                status=status.HTTP_201_CREATED,
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class SendResetPINView(APIView):
    def post(self, request):
        email = request.data.get("email")

        if not email:
            return Response({"error": "Email is required"}, status=400)

        user = User.objects.get(email=email)

        if not user:
            return Response({"error": "No user"}, status=400)

        PasswordResetCode.objects.filter(email=email).delete()

        pin = f"{random.randint(1000, 9999)}"
        PasswordResetCode.objects.create(email=email, pin=pin)

        title = "Your password reset PIN"
        message = f"Your 4-digit password reset PIN is: {pin}"
        from_email = settings.EMAIL_HOST_USER
        sent_to = [email]
        send_mail(
            subject=title,
            message=message,
            from_email=from_email,
            recipient_list=sent_to,
            fail_silently=False,
        )

        return Response({"message": "PIN sent to email"}, status=200)


class VerifyResetPINView(APIView):
    def post(self, request):
        email = request.data.get("email")
        pin = request.data.get("pin")

        try:
            reset_obj = PasswordResetCode.objects.filter(email=email, pin=pin).latest(
                "created_at"
            )
            if reset_obj.is_valid():
                return Response({"message": "PIN is valid"}, status=200)
            else:
                return Response({"error": "PIN expired"}, status=400)
        except PasswordResetCode.DoesNotExist:
            return Response({"error": "Invalid PIN or email"}, status=400)


class ResetPasswordView(APIView):
    def post(self, request):
        email = request.data.get("email")
        pin = request.data.get("pin")
        new_password = request.data.get("new_password")

        if not (email and pin and new_password):
            return Response({"error": "Missing data"}, status=400)

        try:
            reset_obj = PasswordResetCode.objects.filter(email=email, pin=pin).latest(
                "created_at"
            )
            if not reset_obj.is_valid():
                return Response({"error": "PIN expired"}, status=400)
        except PasswordResetCode.DoesNotExist:
            return Response({"error": "Invalid PIN"}, status=400)

        try:
            user = User.objects.get(email=email)
            user.set_password(new_password)
            user.save()
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=400)

        return Response({"message": "Password reset successful"}, status=200)
