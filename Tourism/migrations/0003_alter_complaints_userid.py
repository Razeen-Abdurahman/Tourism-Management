# Generated by Django 3.2.16 on 2022-10-27 08:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Tourism', '0002_auto_20221027_1316'),
    ]

    operations = [
        migrations.AlterField(
            model_name='complaints',
            name='USERID',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='Tourism.user'),
        ),
    ]