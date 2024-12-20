from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from accounts.models import CustomUser
from django.contrib.auth import get_user_model
from django.contrib.auth import logout
from core.models import Product, Category  
from core.forms import ProductForm 
from django.urls import reverse
from django.contrib import messages

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
