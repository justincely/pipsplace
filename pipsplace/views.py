"""views config for pipsplace project """

from django.shortcuts import render


def home(request):
    """Renders simple homepage"""
    return render(request, "index.html")
