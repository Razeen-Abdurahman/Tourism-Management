# Generated by Django 3.2.16 on 2022-11-21 05:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Tourism', '0008_auto_20221118_1222'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gallery',
            name='USERID',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='Tourism.user'),
        ),
    ]