from rest_framework import viewsets
from rest_framework_simplejwt.views import TokenObtainPairView

from ..models import User
from ..serializers import (
    UserSerializer,
    TokenObtainPairSerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    http_method_names = ["get", "post", "update", "delete"]


class LoginView(TokenObtainPairView):
    serializer_class = TokenObtainPairSerializer
