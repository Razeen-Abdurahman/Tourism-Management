from django.db import models

# Create your models here.
class login(models.Model):
    Username = models.CharField(max_length=200)
    Password = models.CharField(max_length=200)
    usertype = models.CharField(max_length=200)

class travelers(models.Model):
    TRAVELID = models.ForeignKey(login,default=1,on_delete=models.CASCADE)
    Name     = models.CharField(max_length=200)
    Place    = models.CharField(max_length=200)
    Post     = models.CharField(max_length=200)
    Pin      = models.IntegerField()
    Email    = models.CharField(max_length=200)
    Photo    = models.CharField(max_length=200)
    PhoneNo  = models.IntegerField()

class Place(models.Model):
    Name    = models.CharField(max_length=200)
    Image   = models.CharField(max_length=200)
    Place   = models.CharField(max_length=200)
    Post    = models.CharField(max_length=200)
    Pin     = models.IntegerField()


class Vehicle(models.Model):
    Name        = models.CharField(max_length=200)
    Capacity    = models.IntegerField()
    Type        = models.CharField(max_length=200)
    Details     = models.CharField(max_length=200)
    Cost        = models.IntegerField()
    TRAVELID = models.ForeignKey(travelers, on_delete=models.CASCADE)


class User(models.Model):
            Name   = models.CharField(max_length=200)
            Place  = models.CharField(max_length=200)
            Post   = models.CharField(max_length=200)
            Pin    = models.IntegerField()
            Email  = models.CharField(max_length=200)
            Photo  = models.CharField(max_length=200)
            PhoneNo = models.BigIntegerField()
            USERID  = models.ForeignKey(login,default=1,on_delete=models.CASCADE)

class Booking(models.Model):
            USERID = models.ForeignKey(User, default=1, on_delete=models.CASCADE)
            Date = models.DateField()
            Status = models.CharField(max_length=200)
            VEHICLEID = models.ForeignKey(Vehicle, default=1, on_delete=models.CASCADE)

class Feedback(models.Model):
    Feedback    = models.CharField(max_length=200)
    date        = models.DateField()
    USERID      = models.ForeignKey(User,default=1,on_delete=models.CASCADE)


class Complaints(models.Model):
    Complaints  = models.CharField(max_length=200)
    date        = models.DateField()
    Reply      = models.CharField(max_length=200)
    Reply_date = models.DateField()
    USERID      = models.ForeignKey(User, default=1, on_delete=models.CASCADE)


class Gallery(models.Model):
    Photo = models.CharField(max_length=200)
    USERID = models.ForeignKey(User, default=1, on_delete=models.CASCADE)