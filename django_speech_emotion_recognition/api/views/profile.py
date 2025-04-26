from rest_framework.decorators import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from ..serializers import EditProfileSerializer


class EditProfileView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def put(self, request):
        data = request.data.copy()

        if data.get("username") is None:
            data.pop("username")

        if data.get("profile_pic") is None:
            data.pop("profile_pic")

        user = request.user
        serializer = EditProfileSerializer(user, data=data, partial=True)

        if serializer.is_valid():
            updated_user = serializer.save()

            return Response(
                {
                    "username": updated_user.username,
                    "profile_pic": updated_user.profile_pic.url
                    if updated_user.profile_pic
                    else None,
                },
                status=status.HTTP_201_CREATED,
            )

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteAccountView(APIView):
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request):
        user = request.user

        user.delete()

        return Response(
            status=status.HTTP_201_CREATED,
        )
