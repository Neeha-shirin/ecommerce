# Generated by Django 3.2.25 on 2024-12-24 19:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0019_order_stripe_payment_intent_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='razorpay_order_id',
        ),
        migrations.RemoveField(
            model_name='order',
            name='razorpay_payment_id',
        ),
        migrations.RemoveField(
            model_name='order',
            name='razorpay_signature',
        ),
    ]
