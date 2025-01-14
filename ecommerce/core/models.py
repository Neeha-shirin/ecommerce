from django.db import models

from django.contrib.auth.models import User
from django.conf import settings
from accounts.models import CustomUser


class Category(models.Model):
    category_name = models.CharField(max_length=100, null=True, blank=True)
    category_image = models.ImageField(upload_to='categories/', null=True, blank=True)
    is_available = models.BooleanField(default=True)

    def __str__(self):
        return self.category_name 


class Product(models.Model):
    name = models.CharField(max_length=100, null=True, blank=True)
    category = models.ForeignKey('Category', on_delete=models.CASCADE)
    desc = models.TextField()
    price = models.FloatField(default=0.0)
    product_available_count = models.IntegerField(default=0)
    img = models.ImageField(upload_to='products/images/', blank=True, null=True)

    def __str__(self):
        return self.name or "Unnamed Product"


class OrderItem(models.Model):
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, 
        on_delete=models.CASCADE, 
        null=True, blank=True
    )  # Ensure nullable users
    ordered = models.BooleanField(default=False)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)  # Enforcing non-negative values

    def __str__(self):
        return f"{self.quantity} of {self.product.name}"

    def get_total_item_price(self):
        return self.quantity * self.product.price

    def get_final_price(self):
        return self.get_total_item_price()


class Order(models.Model):
   
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    
    items = models.ManyToManyField(OrderItem)
    start_date = models.DateTimeField(auto_now_add=True)
    ordered_date = models.DateTimeField(null=True, blank=True)
    ordered = models.BooleanField(default=False)
    order_id = models.CharField(max_length=100, unique=True, default=None, blank=True, null=True)
    datetime_of_payment = models.DateTimeField(auto_now_add=True)
    stripe_payment_intent_id = models.CharField(max_length=255, blank=True, null=True)
    order_delivered = models.BooleanField(default=False)
    order_received = models.BooleanField(default=False)

    

    def save(self, *args, **kwargs):
        # Generate order ID if it doesn't exist
        if not self.order_id and self.datetime_of_payment:
            self.order_id = f"PAY2ME{self.datetime_of_payment.strftime('%Y%m%dODR')}{self.pk or ''}"
        super().save(*args, **kwargs)

    def __str__(self):
        return self.user.username

    def get_total_price(self):
        return sum(item.get_final_price() for item in self.items.all())

    def get_total_count(self):
        return sum(item.quantity for item in self.items.all())



class Wishlist(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('user', 'product') 


class Banner(models.Model):
    title = models.CharField(max_length=255,blank=True,null=True)
    description = models.TextField(blank=True,null=True)
    image = models.ImageField(upload_to='banners/', blank=True, null=True)

    def __str__(self):
        return self.title

