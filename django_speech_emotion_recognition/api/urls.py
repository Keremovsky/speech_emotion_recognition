from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import UserViewSet, ChallengeViewSet, ChallengeHistoryViewSet

router = DefaultRouter()
router.register("users", UserViewSet)
router.register("challenges", ChallengeViewSet)
router.register("challenge-histories", ChallengeHistoryViewSet)

urlpatterns = [path("", include(router.urls))]
