from rest_framework.response import Response
from rest_framework.decorators import api_view


# Create your views here.
@api_view(["GET"])
def hello(request):
    return Response({"message": "Hello from API!"})


@api_view(["GET"])
def bye(request):
    return Response({"message": "Goodbye from API!"})
