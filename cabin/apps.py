"""appconfigs for the cabin app in pipsplace project"""

from django.apps import AppConfig


class CabinConfig(AppConfig):
    """AppConfig for the Cabin App"""

    default_auto_field = "django.db.models.BigAutoField"
    name = "cabin"
