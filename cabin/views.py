"""Views of the cabin app in pipsplace project"""
from django.shortcuts import render


# Create your views here.
def homepage(request):
    """Simple render of the cabin/index.html page"""
    return render(request, "cabin/index.html")
