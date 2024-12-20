# checkout/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.checkout, name='checkout'),
    path('add-address/', views.add_address, name='add_address'),
]
