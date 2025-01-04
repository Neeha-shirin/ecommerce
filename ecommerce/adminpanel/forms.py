from django import forms
from orderpayment.models import MyOrders,  Address
from core. models import Product


class OrderForm(forms.ModelForm):
    class Meta:
        model = MyOrders
        fields = [ 'status']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # You can customize form fields here if necessary

from core.models import Banner


class BannerForm(forms.ModelForm):
    class Meta:
        model = Banner
        fields = ['title', 'description', 'image']
