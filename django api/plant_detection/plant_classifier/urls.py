from django.urls import path
from .views import home,predict

urlpatterns = [
    path('', home, name='home'),  # This line maps the root URL to the home view
    path('predict/',predict, name='predict_api'),
]
