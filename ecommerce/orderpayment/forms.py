# checkout/forms.py
from django import forms
from .models import Address

class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = ['full_name', 'phone_number', 'address_line', 'city', 'state', 'zip_code', 'country']
