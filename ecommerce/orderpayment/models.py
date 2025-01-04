from django.db import models
from django.contrib.auth.models import AbstractUser
from core. models import Product
from django.utils.timezone import now



# Custom user model
class CustomUser(AbstractUser):
    # Add any custom fields if needed
    pass


# Address model
from django.conf import settings

class Address(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    # other fields...
 
 
     
    full_name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15)
    address_line = models.TextField()
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    zip_code = models.CharField(max_length=10)
    country = models.CharField(max_length=50)

    def __str__(self):
        return f"{self.full_name} - {self.city}"


# Order model

class MyOrders(models.Model):
    ORDER_STATUS_CHOICES = (
        ('Pending', 'Pending'),
        ('Shipped', 'Shipped'),
        ('Delivered', 'Delivered'),
        ('Cancelled', 'Cancelled'),
        ('Returned', 'Returned'),
    )

    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    address = models.ForeignKey('Address', on_delete=models.SET_NULL, null=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    ordered_date = models.DateTimeField(default=now)
    payment_method = models.CharField(
        max_length=20,
        choices=(('Stripe', 'Stripe'), ('COD', 'Cash on Delivery')),
        default='COD'
    )
    is_paid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=20,
        choices=ORDER_STATUS_CHOICES,
        default='Pending'
    )

    def __str__(self):
        return f"Order {self.id} - {self.user}"


class Payments(models.Model):
    order = models.OneToOneField(MyOrders, on_delete=models.CASCADE)
    payment_id = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_status = models.CharField(max_length=50, choices=(('Pending', 'Pending'), ('Succeeded', 'Succeeded'), ('Failed', 'Failed')))
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Payment {self.payment_id} for Order {self.order.id}"



