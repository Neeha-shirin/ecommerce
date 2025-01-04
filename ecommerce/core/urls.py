from django.urls import path
from core import views

urlpatterns = [
    path('', views.index, name='index'),
    path('category/<int:category_id>/', views.product_view, name='product'),
    path('product_details/<int:pk>/', views.product_details, name='product_details'),
    path('add_to_cart/<pk>/', views.add_to_cart, name='add_to_cart'),
    
    
    path('orderlist/', views.orderlist, name='orderlist'), 
    path('update_quantity/<int:item_id>/<str:action>/', views.update_item_quantity, name='update_item_quantity'),
    path('remove_item/<int:item_id>/', views.remove_item_from_cart, name='remove_item_from_cart'),
    path('wishlist/',views.wishlist,name='wishlist'),
    path('add_wishlist/<int:pid>/',views.add_to_wishlist,name='add_wishlist'),
    path('remove_from_wishlist/<int:product_id>/', views.remove_from_wishlist, name='remove_from_wishlist'),
    path('contact/', views.contact, name='contact'),
    
    path('search/', views.search, name='search'),
]

   









     

    #path('add_item/<int:pk>/', views.add_item, name='add_item'),
    #path('remove_item/<int:pk>/', views.remove_item, name='remove_item'),