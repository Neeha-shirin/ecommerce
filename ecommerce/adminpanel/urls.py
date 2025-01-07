from django.urls import path
from . import views

app_name = 'adminpanel'

urlpatterns = [
    path('', views.admin_dashboard, name='admin_dashboard'),
    path('usermanagement/', views.user_management, name='user_management'),
    path('activate-user/<int:user_id>/', views.activate_user, name='activate_user'),
    path('deactivate-user/<int:user_id>/', views.deactivate_user, name='deactivate_user'),
    path('logout/', views.logout_view, name='logout'),
    path('productdashboard/', views.product_dashboard, name='product_dashboard'),
    path('productdashboard/add/', views.add_product, name='add_product'),
    path('productdashboard/edit/<int:product_id>/', views.edit_product, name='edit_product'),
    path('productdashboard/delete/<int:product_id>/', views.delete_product, name='delete_product'),
    path('profile/', views.profile, name='profile'),
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    path('categories/', views.category_list, name='category_list'),
    path('categories/add/', views.add_category, name='add_category'),
    path('categories/edit/<int:pk>/', views.edit_category, name='edit_category'),
    path('categories/delete/<int:pk>/', views.delete_category, name='delete_category'),


    
    

    path('orders/', views.order_list, name='order_list'),  # List all orders
    path('orders/add/', views.add_order, name='add_order'),  # Add a new order
    path('orders/edit/<int:order_id>/', views.edit_order, name='edit_order'),  # Edit an existing order
    path('admin/custom-banner/', views.custom_banner_admin, name='custom_banner_admin'),
    path('admin/edit-banner/<int:banner_id>/', views.edit_banner, name='edit_banner'),
   

]