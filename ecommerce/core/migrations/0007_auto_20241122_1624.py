# Generated by Django 3.2.25 on 2024-11-22 10:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_auto_20241121_2308'),
    ]

    operations = [
        migrations.RenameField(
            model_name='product',
            old_name='image',
            new_name='img',
        ),
        migrations.RemoveField(
            model_name='category',
            name='cimg',
        ),
    ]
