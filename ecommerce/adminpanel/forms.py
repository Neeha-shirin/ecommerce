from django import forms
from orderpayment.models import MyOrders,  Address
from core. models import Product


class OrderForm(forms.ModelForm):
    class Meta:
        model = MyOrders
        fields = ['product', 'address', 'total', 'payment_method', 'is_paid', 'status']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # You can customize form fields here if necessary
        self.fields['product'].queryset = Product.objects.all()  # Example of limiting the product choices
        self.fields['address'].queryset = Address.objects.all()  # Example for limiting addresses
