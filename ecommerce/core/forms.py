from django import forms
from core.models import *
from django_countries.fields import CountryField
from django_countries.widgets import CountrySelectWidget


class ProductForm(forms.ModelForm):

    class Meta:
        model=Product
        fields='__all__'
        widgets ={
            'name':forms.TextInput(attrs={'class':'form-control'}),
            'category':forms.Select(attrs={'class':'form-control'}),
            'desc':forms.Textarea(attrs={'class':'form-control'}),
            'price':forms.NumberInput(attrs={'class':'form-control'}),
            'product_available_count':forms.NumberInput(attrs={'class':'form-control'}),
            'img':forms.FileInput(attrs={'class':'form-control'}),
        }
class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'  # Include all fields from the Category model
        widgets = {
            'category_name': forms.TextInput(attrs={'class': 'form-control'}),
            'category_image':forms.FileInput(attrs={'class':'form-control'}),
        }



