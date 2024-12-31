from django.contrib import admin
from core.models import *

from .models import Category



admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Wishlist)
admin.site.register(Coupon)



