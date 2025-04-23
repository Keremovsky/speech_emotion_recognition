from rest_framework.routers import DefaultRouter
from django.urls import path, include
from rest_framework_simplejwt.views import TokenRefreshView

from .views.auth import (
    UserViewSet,
    LoginView,
)
from .views.challenge import (
    ChallengeViewSet,
    TryChallengeView,
)
from .views.challenge_history import ChallengeHistoryViewSet

router = DefaultRouter()
router.register("users", UserViewSet)
router.register("challenges", ChallengeViewSet)
router.register("challenge-histories", ChallengeHistoryViewSet)

urlpatterns = [
    path("", include(router.urls)),
    path("try-challenge/<str:id>/", TryChallengeView.as_view(), name="try-challenge"),
    path("auth/login/", LoginView.as_view(), name="login"),
    path("auth/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
]
