from django.shortcuts import render, redirect, get_object_or_404
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
from core.models import Product
from django.contrib.auth.decorators import login_required 

from .models import Address, MyOrders, Payments
from .forms import AddressForm
from core.models import Order
from django.http import HttpResponseForbidden

import stripe

stripe.api_key = settings.STRIPE_SECRET_KEY  # Initialize Stripe API Key
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.contrib import messages
from django.http import JsonResponse



stripe.api_key = settings.STRIPE_SECRET_KEY  # Stripe API Key Initialization


@login_required
def checkout(request):
    """
    Handles the checkout process: fetching cart items, calculating total price, 
    selecting address, and initiating payment or order placement.
    """
    # Fetch the user's active cart
    try:
        cart = Order.objects.get(user=request.user, ordered=False)
    except Order.DoesNotExist:
        # Pass a message if the cart does not exist
        messages.warning(request, "Your cart is empty. Please add items before proceeding to checkout.")
        return redirect('orderlist')  # Redirect to the cart page

    # Fetch items in the cart
    items = cart.items.all()

    # Check if the cart is empty
    if not items.exists():
        messages.warning(request, "Your cart is empty. Please add items before proceeding to checkout.")
        return redirect('orderlist')  # Redirect to the cart page if empty

    # Calculate the total price (convert to cents for Stripe)
    total_price = int(cart.get_total_price() * 100)

    # Fetch the user's most recent addresses (up to 3)
    addresses = Address.objects.filter(user=request.user).order_by('-id')[:3]

    # Ensure the user has at least one address
    if not addresses.exists():
        messages.warning(request, "Please add an address before proceeding to checkout.")
        return redirect('add_address')

    if request.method == "POST":
        # Retrieve selected payment method and address
        payment_method = request.POST.get('payment_method')
        address_id = request.POST.get('address_id')

        # Validate the address selection
        if not address_id:
            messages.warning(request, "Please select an address to proceed.")
            return redirect('checkout')

        selected_address = get_object_or_404(Address, id=address_id, user=request.user)

        # Create a new order
        order = MyOrders.objects.create(
            user=request.user,
            address=selected_address,
            total=cart.get_total_price(),
            payment_method=payment_method,
            is_paid=False
        )

        # Handle payment methods
        if payment_method == 'STRIPE':
            return redirect('stripe_payment', order_id=order.id, total_price=total_price)

        elif payment_method == 'COD':
            # Complete the order for COD
            order.is_paid = False
            order.save()
            cart.items.all().delete()  # Clear the cart
            messages.success(request, "Your order has been placed successfully with Cash on Delivery.")
            return redirect('order_confirmation', order_id=order.id)

        else:
            messages.error(request, "Invalid payment method. Please try again.")
            return redirect('checkout')

    return render(request, 'orderpayment/checkout.html', {
        'total_price': total_price / 100,
        'addresses': addresses,
        'items': items,
        'cart': cart,
    })




@login_required
def handle_stripe_payment(request, order_id, total_price):
    """
    Handles Stripe payment intent creation and redirects to Stripe payment page.
    """
    try:
        # Fetch the order
        order = get_object_or_404(MyOrders, id=order_id)

        # Create a payment intent with Stripe
        payment_intent = stripe.PaymentIntent.create(
            amount=total_price,
            currency='INR',
            metadata={'order_id': order.id}
        )

        # Save payment details
        Payments.objects.create(
            order=order,
            payment_id=payment_intent['id'],
            amount=total_price / 100,
            payment_status='Pending'
        )

        return render(request, 'orderpayment/stripe_payment.html', {
            'client_secret': payment_intent['client_secret'],
            'amount': total_price / 100,
            'order_id': order.id,
            'stripe_publishable_key': settings.STRIPE_PUBLISHABLE_KEY
        })
    except Exception as e:
        messages.error(request, f"Error creating payment intent: {str(e)}")
        return redirect('checkout')




@login_required
def order_confirmation(request, order_id):
    """
    Displays order confirmation and checks payment status for Stripe orders.
    """
    order = get_object_or_404(MyOrders, id=order_id)

    if order.payment_method == 'Stripe' and not order.is_paid:
        try:
            payment = Payments.objects.get(order=order)
            payment_intent = stripe.PaymentIntent.retrieve(payment.payment_id)

            if payment_intent.status == 'succeeded':
                order.is_paid = True
                payment.payment_status = 'Succeeded'
                order.save()
                payment.save()
                messages.success(request, "Payment succeeded!")
            else:
                messages.warning(request, "Payment not completed. Please try again.")
        except Exception as e:
            messages.error(request, f"Error verifying payment status: {str(e)}")

    return render(request, 'orderpayment/order_confirmation.html', {'order': order})





                                                                                                                

@login_required
def add_address(request):
    """
    Handles adding a new address for the user.
    """
    if request.method == 'POST':
        form = AddressForm(request.POST)
        if form.is_valid():
            address = form.save(commit=False)
            address.user = request.user
            address.save()
            messages.success(request, "Address added successfully.")
            return redirect('checkout')
    else:
        form = AddressForm()

    return render(request, 'orderpayment/add_address.html', {'form': form})

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import redirect
from .models import Address

@csrf_exempt
def delete_address(request, address_id):
    if request.method == "POST":
        try:
            address = Address.objects.get(id=address_id, user=request.user)
            address.delete()
            return JsonResponse({'success': True, 'message': "Address deleted successfully!"}, status=200)
        except Address.DoesNotExist:
            return JsonResponse({'error': 'Address not found'}, status=404)
    return JsonResponse({'error': 'Invalid request'}, status=400)



@login_required
def order_items(request):
    # Fetch orders sorted by the latest order first
    orders = MyOrders.objects.filter(user=request.user).select_related('product').order_by('-ordered_date')
    return render(request, 'orderpayment/order_items.html', {'orders': orders})



def order_details(request, order_id):
   
    order = get_object_or_404(MyOrders, id=order_id, user=request.user)
    order_status_choices = MyOrders.ORDER_STATUS_CHOICES 

    return render(request, "orderpayment/order_details.html", {
        'order': order,
        'order_status_choices': order_status_choices,
       
    })


def cancel_order(request, order_id):
    try:
        order = MyOrders.objects.get(id=order_id)
        print(f"Order found: {order}")
    except Order.DoesNotExist:
        print(f"No order found with ID {order_id}")
        return redirect('order_items')  # Handle as per your logic

    # If found, update status
    if order.status != 'Cancelled':
        order.status = 'Cancelled'
        order.save()

    return redirect('order_items')  # Or any other page you want to redirect to
