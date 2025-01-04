from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from core.models import Category, Product, Order, OrderItem,Wishlist
from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponseNotFound
from . models import Banner
from django.http import HttpResponseForbidden


# Home Page
def index(request):
    categories = Category.objects.filter(is_available=True)
    products = Product.objects.all()
    banners = Banner.objects.all()  # Fetch all banners from the database
    
    context = {
        'banners': banners,
        'products': products,
        'categories': categories,
    }
    
    return render(request, 'core/index.html', context)


# Order List / Cart View
@login_required(login_url='user_login')
def orderlist(request):
    # Prevent superusers from accessing this page
    if request.user.is_superuser:
         return redirect('user_login')
    
    try:
        order = Order.objects.get(user=request.user, ordered=False)
        return render(request, 'core/orderlist.html', {'order': order})
    except Order.DoesNotExist:
        return render(request, 'core/orderlist.html', {'message': "Your cart is empty"})


# Products in a Category

def product_view(request, category_id):
    category = get_object_or_404(Category, id=category_id)
    products = Product.objects.filter(category=category)
    return render(request, 'core/product.html', {'products': products, 'category': category})


# Product Details



def product_details(request, pk):
    # Fetch the main product based on the pk (primary key)
    product = get_object_or_404(Product, id=pk)
    
    # Fetch similar products (all products except the current one, you can modify the filtering logic as needed)
    similar_products = Product.objects.exclude(id=pk)[:6]  # Adjust the number of similar products
    
    # Pass both the main product and the similar products to the template
    return render(request, 'core/product_details.html', {
        'product': product, 
        'products': similar_products  # Now similar products are passed correctly
    })



# Add to  cart

@login_required(login_url='user_login')
def add_to_cart(request, pk):
    product = get_object_or_404(Product, pk=pk)

    # Ensure the user is authenticated
    if not request.user.is_authenticated:
        messages.error(request, "You need to log in to add items to your cart.")
        return redirect('login')

    # Create or retrieve order item
    order_item, created = OrderItem.objects.get_or_create(
        product=product,
        user=request.user,
        ordered=False
    )

    # Retrieve active order or create one
    order_qs = Order.objects.filter(user=request.user, ordered=False)
    if order_qs.exists():
        order = order_qs.first()
        if order.items.filter(product__pk=product.pk).exists():
            order_item.quantity += 1
            order_item.save()
            messages.info(request, "Increased the item quantity.")
        else:
            order.items.add(order_item)
            messages.info(request, "Added item to your cart.")
    else:
        order = Order.objects.create(user=request.user, ordered_date=timezone.now())
        order.items.add(order_item)
        messages.info(request, "Added item to your cart.")

    # Check if the cart is empty
    if not order.items.exists():
        messages.error(request, "Your cart is empty! Please add items to proceed.")
        return redirect('current_page')  # Replace 'current_page' with the name of the current page's URL

    return redirect('orderlist')  # Replace 'orderlist' with your desired URL for the order summary or checkout page


# Remove Item from Cart
@login_required
def remove_item_from_cart(request, item_id):
    order = Order.objects.filter(user=request.user, ordered=False).first()
    if not order:
        messages.error(request, "No active cart found.")
        return redirect('orderlist')

    order_item = get_object_or_404(OrderItem, id=item_id)
    order.items.remove(order_item)
    order_item.delete()

    messages.info(request, "Item removed from your cart.")
    return redirect('orderlist')


# Checkout Page


def update_item_quantity(request, item_id, action):
    # First, check if the user has an active order, or get their cart order
    try:
        # Get the active order (assuming it exists)
        order = Order.objects.get(user=request.user, ordered=False)
    except Order.DoesNotExist:
        messages.error(request, "You do not have an active order.")
        return redirect('orderlist')  # Redirect to the cart or order list page

    # Get the order item
    order_item = get_object_or_404(OrderItem, id=item_id, order=order)  # Make sure it's tied to the order

    # Perform the action based on the action type (increase or decrease)
    if action == "increment":
        order_item.quantity += 1
        order_item.save()
        messages.success(request, "Increased item quantity.")
    
    elif action == "decrement":
        if order_item.quantity > 1:
            order_item.quantity -= 1
            order_item.save()
            messages.success(request, "Decreased item quantity.")
        else:
            # Optionally delete the order item when quantity reaches 0
            order_item.delete()
            messages.success(request, "Removed item from cart.")

    else:
        messages.error(request, "Invalid action.")
        return redirect('orderlist')

    # Redirect to the correct page (cart or order list)
    return redirect('orderlist')  # Ensure 'orderlist' is correctly defined in your URLs


@login_required(login_url='user_login')
def wishlist(request):
    wishlist = Wishlist.objects.filter(user=request.user)
    return render(request,'core/wishlist.html',{'wishlist':wishlist})

@login_required(login_url='user_login')
def add_to_wishlist(request,pid):

    if request.user.is_superuser:
        return redirect('user_login')
    product = get_object_or_404(Product,id=pid)
    
    wishlist,created = Wishlist.objects.get_or_create(user=request.user,product=product)
    if created:
        messages.success(request,'product added to wishlist')
    else:
        messages.info(request, 'Product is already in your wishlist.')

    return redirect('wishlist')

@login_required(login_url='user_login')
def remove_from_wishlist(request, product_id):
    # Ensure the user has a wishlist
    wishlist_item = Wishlist.objects.filter(user=request.user, id=product_id).first()

    if not wishlist_item:
        messages.error(request, "This product is not in your wishlist.")
        return redirect('wishlist')

    # Delete the wishlist item
    wishlist_item.delete()

    messages.info(request, "Item removed from your wishlist.")
    return redirect('wishlist')



from datetime import datetime
from django.shortcuts import render
from .models import Product  # Ensure you import the Product model

from django.shortcuts import render
from .models import Product
from datetime import datetime

def search(request):
    query = request.GET.get('q', '')
    products = Product.objects.filter(name__icontains=query) if query else Product.objects.all()
    return render(request, 'core/search.html', {'products': products, 'query': query, 'year': datetime.now().year})
def contact(request):
    return render(request, 'core/contact.html')

