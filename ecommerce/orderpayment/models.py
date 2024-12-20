from django.db import models
from django.contrib.auth.models import AbstractUser

# Custom user model
class CustomUser(AbstractUser):
    # Add any custom fields if needed
    pass


# Address model
class Address(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='addresses')  
 
     
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
class Order(models.Model):
    user = models.ForeignKey(
        CustomUser,
        on_delete=models.CASCADE,
        related_name='orders'  # Unique related_name for Order reverse relationship
    )
    address = models.ForeignKey(Address, on_delete=models.CASCADE)
    razorpay_order_id = models.CharField(max_length=100, blank=True, null=True)
    razorpay_payment_id = models.CharField(max_length=100, blank=True, null=True)
    amount = models.FloatField()
    is_paid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Order {self.id} - User {self.user.username}"
