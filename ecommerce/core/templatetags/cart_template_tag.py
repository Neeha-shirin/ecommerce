from django import template
from core.models import Order

register = template.Library()  # Corrected "Library" with uppercase L

@register.filter
def cart_item_count(user):
    if user.is_authenticated:
        qs = Order.objects.filter(user=user, ordered=False)
        if qs.exists():
            return qs[0].items.count()
        return 0
@register.filter
def mul(value, arg):
    """Multiply the value by the given argument."""
    try:
        return value * arg
    except (TypeError, ValueError):
        return 0