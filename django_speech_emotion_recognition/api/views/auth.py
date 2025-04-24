from rest_framework import viewsets, status
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework.decorators import APIView
from rest_framework.response import Response

from ..models import User
from ..serializers import (
    UserSerializer,
    TokenObtainPairSerializer,
    CustomTokenRefreshSerializer,
    RegisterSerializer,
)


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
