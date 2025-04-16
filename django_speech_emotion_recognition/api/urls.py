from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import hello, bye

router = DefaultRouter()

urlpatterns = [path("hello/", hello), path("bye/", bye)]
