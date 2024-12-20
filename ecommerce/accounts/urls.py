from django.urls import path
from accounts import views  
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('user_login/', views.user_login, name="user_login"),
    path('user_register/', views.user_register, name="user_register"),
    path('user_logout/', views.user_logout, name="user_logout"),
    path('verify/', views.verify, name='verify'),
    path('password_reset/', auth_views.PasswordResetView.as_view(template_name='accounts/password_reset.html'), name='password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='accounts/password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='accounts/password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='accounts/password_reset_complete.html'), name='password_reset_complete'),
     path('profile/',views.profile, name="profile"),
    
    
]
