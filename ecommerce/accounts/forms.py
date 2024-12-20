from django import forms
from .models import CustomUser

class SignupForm(forms.ModelForm):
    password1 = forms.CharField(widget=forms.PasswordInput, label="Password")
    password2 = forms.CharField(widget=forms.PasswordInput, label="Confirm Password")

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'phone_number', 'first_name', 'last_name'] 
    def clean(self):
        cleaned_data = super().clean()
        password1 = cleaned_data.get('password1')
        password2 = cleaned_data.get('password2')

       
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords do not match.")
        
   
        if not password1:
            raise forms.ValidationError("Password cannot be empty.")

        return cleaned_data

    def save(self, commit=True):
        user = super().save(commit=False)

        user.set_password(self.cleaned_data['password1'])

        if commit:
            user.save()
        return user



class ResetPasswordForm(forms.Form):
    new_password1 = forms.CharField(
        widget=forms.PasswordInput, 
        label="New Password"
    )
    new_password2 = forms.CharField(
        widget=forms.PasswordInput, 
        label="Confirm New Password"
    )

    def clean(self):
        cleaned_data = super().clean()
        new_password1 = cleaned_data.get('new_password1')
        new_password2 = cleaned_data.get('new_password2')

        if new_password1 and new_password2 and new_password1 != new_password2:
            raise forms.ValidationError("Passwords do not match.")
        
        if not new_password1:
            raise forms.ValidationError("Password cannot be empty.")
        
        return cleaned_data

    def save(self, user):
        user.set_password(self.cleaned_data['new_password1'])
        user.save()
