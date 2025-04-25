from rest_framework.routers import DefaultRouter
from django.urls import path, include

from .views.auth import (
    UserViewSet,
    LoginView,
    CustomTokenRefreshView,
    RegisterView,
    SendResetPINView,
    VerifyResetPINView,
    ResetPasswordView,
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
    path("auth/register/", RegisterView.as_view(), name="register"),
    path("auth/token/refresh/", CustomTokenRefreshView.as_view(), name="token_refresh"),
    path("auth/reset-mail/", SendResetPINView.as_view(), name="reset-mail"),
    path("auth/reset-pin/", VerifyResetPINView.as_view(), name="reset-pin"),
    path("auth/reset-password/", ResetPasswordView.as_view(), name="reset_password"),
]
