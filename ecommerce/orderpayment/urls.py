from django.urls import path
from . import views



urlpatterns = [
    path('checkout/', views.checkout, name='checkout'),  # Checkout page
    path('add-address/', views.add_address, name='add_address'),  # Add address
    path('delete_address/<int:address_id>/', views.delete_address, name='delete_address'),


    path('order_confirmation/<int:order_id>/', views.order_confirmation, name='order_confirmation'),
    path('stripe-payment/<int:order_id>/<int:total_price>/', views.handle_stripe_payment, name='stripe_payment'),  # Stripe payment handler
    path('order_items/', views.order_items, name='order_items'),
    
    path('cancel-order/<int:order_id>/', views.cancel_order, name='cancel_order'),
    path('order_details/<int:order_id>/', views.order_details, name='order_details')
     
   
]
