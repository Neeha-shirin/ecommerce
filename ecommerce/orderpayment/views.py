# checkout/views.py
from django.shortcuts import render, redirect, get_object_or_404
from .models import Address, Order
from .forms import AddressForm
from django.conf import settings
from core.models import CustomUser  # Import CustomUser


def checkout(request):
    user_email = request.user.email
    user_instance = CustomUser.objects.get(email=user_email)
    addresses = Address.objects.filter(user__email=user_instance)  # Filter by CustomUser
    if request.method == 'POST':
        address_id = request.POST.get('address')
        amount = float(request.POST.get('amount')) * 100  # Convert to paisa
        selected_address = get_object_or_404(Address, id=address_id, user=user)

        # Create Razorpay Order
        razorpay_order = razorpay_client.order.create({
            "amount": amount,
            "currency": "INR",
            "payment_capture": "1"
        })

        # Create Order in Database
        order = Order.objects.create(
            user=user,  # Reference CustomUser
            address=selected_address,
            razorpay_order_id=razorpay_order['id'],
            amount=amount / 100
        )

        return render(request, 'orderpayment/payment.html', {
            'order': order,
            'razorpay_order_id': razorpay_order['id'],
            'razorpay_key': settings.RAZORPAY_KEY_ID,
            'amount': amount
        })

    return render(request, 'orderpayment/checkout.html', {'addresses': addresses})


from django.shortcuts import render, redirect
from .forms import AddressForm
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden

from accounts.models import CustomUser  # Replace `yourapp` with the app containing `CustomUser`

def add_address(request):
    if request.method == 'POST':
        form = AddressForm(request.POST)
        if form.is_valid():
            address = form.save(commit=False)
            address.user = CustomUser.objects.get(id=request.user.id)  # Explicitly fetch CustomUser
            address.save()
            return redirect('checkout')
    else:
        form = AddressForm()
    
    return render(request, 'orderpayment/add_address.html', {'form': form})
