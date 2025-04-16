from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import UserViewSet, ChallengeViewSet, CHallengeHistoryViewSet

router = DefaultRouter()
router.register("users", UserViewSet)
router.register("challenges", ChallengeViewSet)
router.register("challenge-histories", CHallengeHistoryViewSet)


urlpatterns = [path("", include(router.urls))]
