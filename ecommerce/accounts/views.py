from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.conf import settings
from django.core.mail import send_mail
from django.utils.crypto import get_random_string
from django.utils.timezone import now, timedelta
from .models import CustomUser 
from .forms import SignupForm
from django.utils import timezone
from datetime import timedelta
from django.contrib.auth.forms import SetPasswordForm
from django.shortcuts import get_object_or_404
from django.utils.http import urlsafe_base64_decode
from django.contrib.auth.models import User
from django.contrib.auth.forms import PasswordResetForm
from django.contrib.auth.models import User
from django.contrib.auth.tokens import default_token_generator
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
import logging
from django.shortcuts import  get_object_or_404
from django.contrib.auth.tokens import default_token_generator
from .forms import ResetPasswordForm  
import random
import datetime



def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, "Login successful!")
            return redirect('index')
        else:
            messages.error(request, "Invalid username or password.")
    return render(request, 'accounts/login.html')

def user_logout(request):
    logout(request)
    return redirect('/')  


def generate_otp():
    return str(random.randint(100000, 999999))

def send_otp_email(user_email, otp):
    subject = 'Your OTP Verification Code'
    message = f'Your OTP verification code is {otp}. Please enter this code to verify your email.'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [user_email]
    send_mail(subject, message, email_from, recipient_list)




def user_register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        phone_field = request.POST.get('phone_field')
        first_name = request.POST.get('first_name') 
        last_name = request.POST.get('last_name')    
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

       
        if password != confirm_password:
            messages.error(request, "Passwords do not match.")
            return render(request, 'accounts/register.html')

     
        if CustomUser.objects.filter(username=username).exists():
            messages.error(request, "Username already taken.")
            return render(request, 'accounts/register.html')

       
        if CustomUser.objects.filter(email=email).exists():
            messages.error(request, "Email already registered.")
            return render(request, 'accounts/register.html')

        try:
           
            otp = random.randint(1000, 9999)
            request.session['otp'] = otp
            request.session['otp_expiry'] = (timezone.now() + timedelta(minutes=10)).isoformat()

           
            send_mail(
                'Verify your email',
                f'Your OTP for verification is {otp}',
                settings.EMAIL_HOST_USER,
                [email],
                fail_silently=False
            )

           
            request.session['user_data'] = {
                'username': username,
                'first_name': first_name,  
                'last_name': last_name,   
                'phone_field': phone_field,
                'email': email,
                'password': password,
            }

            messages.success(request, "OTP has been sent to your email for verification.")
            return redirect('verify')
        except Exception as e:
            messages.error(request, "There was an error sending the OTP. Please try again.")
            return render(request, 'accounts/register.html')

    return render(request, 'accounts/register.html')




logger = logging.getLogger(__name__)
def verify(request):
    if request.method == 'POST':
        entered_otp = request.POST.get('otp')
        stored_otp = request.session.get('otp')
        otp_expiry_str = request.session.get('otp_expiry')

        otp_expiry = timezone.datetime.fromisoformat(otp_expiry_str)

        if timezone.now() > otp_expiry:
            messages.error(request, "OTP has expired. Please register again.")
            return redirect('user_register')

        if str(stored_otp) == entered_otp:
            user_data = request.session.get('user_data')

            
            logger.debug(f"User data in session: {user_data}")

            if user_data:
                try:
                    user = CustomUser.objects.create_user(
                        email=user_data['email'],
                        username=user_data['username'],
                        password=user_data['password'],
                        first_name=user_data['first_name'],
                        last_name=user_data['last_name'],
                        phone_number=user_data['phone_field'],  
                    )
                    user.is_active = True
                    user.save()

                    request.session.flush()

                    messages.success(request, "OTP verified successfully! You can now log in.")
                    return redirect('user_login')
                except KeyError as e:
                    
                    logger.error(f"KeyError: {str(e)} - missing field in user_data")
                    messages.error(request, f"Missing data: {str(e)}. Please register again.")
                    return redirect('user_register')
            else:
                messages.error(request, "User data not found. Please register again.")
                return redirect('user_register')
        else:
            messages.error(request, "Invalid OTP. Please try again.")

    return render(request, 'accounts/verify.html')

def password_reset_request(request):
    if request.method == 'POST':
        form = PasswordResetForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            associated_users = User.objects.filter(email=email)
            if associated_users.exists():
                for user in associated_users:
                    subject = "Password Reset Requested"
                    email_template_name = "accounts/password_reset_email.html"
                    context = {
                        "email": user.email,
                        "domain": request.META['HTTP_HOST'], 
                        "site_name": "Website",
                        "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                        "token": default_token_generator.make_token(user),
                        "protocol": "http",
                    }
                    email_content = render_to_string(email_template_name, context)
                    send_mail(
                        subject,
                        email_content,
                        settings.EMAIL_HOST_USER,
                        [user.email],
                        fail_silently=False,
                    )
                messages.success(request, "A password reset link has been sent to your email.")
                return redirect('login')
            else:
                messages.error(request, "No user is associated with this email.")
    else:
        form = PasswordResetForm()
    return render(request, 'accounts/password_reset.html', {'form': form})




def password_reset_confirm(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = get_object_or_404(CustomUser, pk=uid)
        print(f"Decoded User ID: {uid}, User: {user}")  
    except (TypeError, ValueError, OverflowError, CustomUser.DoesNotExist) as e:
        print(f"Error fetching user: {e}")  
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        if request.method == 'POST':
            form = ResetPasswordForm(request.POST)
            if form.is_valid():
                form.save(user)  
                messages.success(request, "Your password has been successfully reset!")
                return redirect('login')
            else:
                print("Form is invalid:", form.errors)  
        else:
            form = ResetPasswordForm()
        return render(request, 'accounts/password_reset_confirm.html', {'form': form})
    else:
        print("Invalid or expired token")  
        messages.error(request, "The reset link is invalid or has expired.")
        return redirect('password_reset')




def password_reset_done(request):
    return render(request, 'accounts/password_reset_done.html')

def password_reset_complete(request):
    return render(request, 'accounts/password_reset_complete.html')


def profile(request):
    if request.user.is_superuser:
        return redirect('user_login')
    

   
    data = CustomUser.objects.get(id=request.user.id)

    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        phone_number = request.POST.get('phone_number') 
       
 
        CustomUser.objects.filter(id=data.id).update(
            first_name=fname,
            last_name=lname,
            phone_number=phone_number
        )

        messages.success(request, "Profile updated")
        return redirect('profile')

    return render(request, 'accounts/profile.html', {'data': data})
