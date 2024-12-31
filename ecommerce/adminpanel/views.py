from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from accounts.models import CustomUser
from django.contrib.auth import get_user_model
from django.contrib.auth import logout
from core.models import Product, Category  
from core.forms import ProductForm,CouponForm 
from. forms import OrderForm
from django.urls import reverse
from django.contrib import messages
from core .models  import Coupon

def admin_required(user):
    return user.is_staff  

@login_required
@user_passes_test(admin_required)
def admin_dashboard(request):
    return render(request, 'adminpanel/admindashboard.html')

User = get_user_model()

def user_management(request):
    users = CustomUser.objects.all()
    return render(request, 'adminpanel/usermanagement.html', {'users': users})

def activate_user(request, user_id):
    user = get_object_or_404(CustomUser, id=user_id)
    user.is_active = True
    user.save()
    return redirect('adminpanel:usermanagement')

def deactivate_user(request, user_id):
    user = get_object_or_404(CustomUser, id=user_id)
    user.is_active = False
    user.save()
    return redirect('adminpanel:usermanagement')

def logout_view(request):
    return redirect('adminpanel:admindashboard')  

def product_dashboard(request):
    products = Product.objects.all()
    return render(request, 'adminpanel/productdashboard.html', {'products': products})

def add_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)  # Handle file uploads
        if form.is_valid():
            form.save()  # Save the new product
            return redirect('adminpanel:product_dashboard')  # Redirect to product dashboard after saving
    else:
        form = ProductForm()  # Create an empty form for GET requests

    return render(request, 'adminpanel/addproduct.html', {'form': form})  # Render the add product form

def edit_product(request, product_id):
    product = get_object_or_404(Product, id=product_id)  # Get the product by ID

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)  # Bind the form to the product instance
        if form.is_valid():
            form.save()  # Save the updated product data
            return redirect('adminpanel:product_dashboard')  # Redirect to the product dashboard after saving
    else:
        form = ProductForm(instance=product)  # Populate the form with existing product data

    return render(request, 'adminpanel/editproduct.html', {'form': form, 'product': product})  # Render the edit template

def delete_product(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == 'POST':
        product.delete()  # Delete the product
        messages.success(request, 'Product deleted successfully.')  # Add a success message
        return redirect('adminpanel:product_dashboard')  # Redirect to the product dashboard
    return render(request, 'adminpanel/deleteproduct.html', {'product': product})  # Render a confirmation page if not POST

def profile(request):
    return render(request, 'adminpanel/profile.html', {'user': request.user})

def edit_profile(request):
    user = request.user

    if request.method == 'POST':
        user.username = request.POST.get('username')
        user.email = request.POST.get('email')
        if 'phone_number' in request.POST:  # Check if the field exists
            user.phone_number = request.POST.get('phone_number')  # Assuming you have this field
        user.save()
        messages.success(request, 'Profile updated successfully!')
        return redirect('adminpanel:profile')

    return render(request, 'adminpanel/editprofile.html', {'user': user})

def category_list(request):
    categories = Category.objects.all()
    return render(request, 'adminpanel/categorylist.html', {'categories': categories})

def add_category(request):
    if request.method == 'POST':
        category_name = request.POST.get('category_name')  # Get category name from form
        category_image = request.FILES.get('category_image')  # Get uploaded image file

        if category_name:
            # Create a new Category instance
            Category.objects.create(
                category_name=category_name,
                category_image=category_image  # Save image if provided
            )
            messages.success(request, 'Category added successfully.')
            return redirect('adminpanel:category_list')
    
    return render(request, 'adminpanel/addcategory.html')
from django.core.files.storage import FileSystemStorage

def edit_category(request, pk):
    category = get_object_or_404(Category, pk=pk)

    if request.method == 'POST':
        category_name = request.POST.get('category_name')
        category_image = request.FILES.get('category_image')  # Get uploaded image

        if category_name:
            category.category_name = category_name  # Update name
        if category_image:
            category.category_image = category_image  # Update image
        category.save()  # Save changes
        return redirect('adminpanel:category_list')

    return render(request, 'adminpanel/editcategory.html', {'category': category})

def delete_category(request, pk):
    category = get_object_or_404(Category, pk=pk)
    if request.method == 'POST':
        category.delete()
        return redirect('adminpanel:category_list')
    return render(request, 'adminpanel/deletecategory.html', {'category': category})


#coupon

from django.shortcuts import render, redirect
from core .forms import CouponForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test

# Check if the user is an admin
def admin_required(user):
    return user.is_superuser

# Coupon List view
@login_required
@user_passes_test(admin_required)
def coupon_list(request):
    coupons = Coupon.objects.all()  # Retrieve all coupons from the database
    return render(request, 'adminpanel/coupon_list.html', {'coupons': coupons})

# Add Coupon view
@login_required
@user_passes_test(admin_required)
def add_coupon(request):
    if request.method == 'POST':
        form = CouponForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Coupon added successfully!")
            return redirect('adminpanel:coupon_list')  # Redirect to the coupon list page
    else:
        form = CouponForm()

    return render(request, 'adminpanel/add_coupon.html', {'form': form})

# Edit Coupon view
@login_required
@user_passes_test(admin_required)
def edit_coupon(request, coupon_id):
    coupon = Coupon.objects.get(id=coupon_id)
    if request.method == 'POST':
        form = CouponForm(request.POST, instance=coupon)
        if form.is_valid():
            form.save()
            messages.success(request, "Coupon updated successfully!")
            return redirect('adminpanel:coupon_list')  # Redirect to the coupon list page
    else:
        form = CouponForm(instance=coupon)

    return render(request, 'adminpanel/edit_coupon.html', {'form': form, 'coupon': coupon})

# Delete Coupon view
@login_required
@user_passes_test(admin_required)
def delete_coupon(request, coupon_id):
    coupon = Coupon.objects.get(id=coupon_id)
    coupon.delete()
    messages.success(request, "Coupon deleted successfully!")
    return redirect('adminpanel:coupon_list')



from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib import messages
from orderpayment.models import MyOrders
# Create this form for CRUD
 # Assumes a custom permission for admin users

# List Orders
@login_required
@user_passes_test(admin_required)
def order_list(request):
    orders = MyOrders.objects.all()  # Fetch all orders
    return render(request, 'adminpanel/order_list.html', {'orders': orders})

# Add Order
@login_required
@user_passes_test(admin_required)
def add_order(request):
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Order added successfully!")
            return redirect('adminpanel:order_list')
    else:
        form = OrderForm()
    return render(request, 'adminpanel/add_edit_order.html', {'form': form, 'title': 'Add Order'})

# Edit Order
@login_required
@user_passes_test(admin_required)
def edit_order(request, order_id):
    order = get_object_or_404(MyOrders, id=order_id)
    if request.method == 'POST':
        form = OrderForm(request.POST, instance=order)
        if form.is_valid():
            form.save()
            messages.success(request, "Order updated successfully!")
            return redirect('adminpanel:order_list')
    else:
        form = OrderForm(instance=order)
    return render(request, 'adminpanel/add_edit_order.html', {'form': form, 'title': 'Edit Order'})

# Delete Order
@login_required
@user_passes_test(admin_required)
def delete_order(request, order_id):
    order = get_object_or_404(MyOrders, id=order_id)
    if request.method == 'POST':
        order.delete()
        messages.success(request, "Order deleted successfully!")
        return redirect('adminpanel:order_list')
    return render(request, 'adminpanel/confirm_delete_order.html', {'order': order})
