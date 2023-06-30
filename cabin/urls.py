"""URL configurations for Cabin app"""

from pipsplace.urls import path
from . import views

urlpatterns = [path("", views.homepage, name="cabin_index")]
