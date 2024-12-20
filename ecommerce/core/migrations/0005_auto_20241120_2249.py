# Generated by Django 3.2.25 on 2024-11-20 17:19

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_category_cimg'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='img',
        ),
        migrations.AddField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='products/images/'),
        ),
        migrations.AlterField(
            model_name='category',
            name='category_name',
            field=models.CharField(default='Uncategorized', max_length=200),
        ),
        migrations.AlterField(
            model_name='category',
            name='cimg',
            field=models.ImageField(blank=True, null=True, upload_to='category/'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='phone',
            field=models.CharField(max_length=15, null=True, validators=[django.core.validators.RegexValidator('^\\+?1?\\d{9,15}$', 'Phone number must be in a valid format.')]),
        ),
    ]
