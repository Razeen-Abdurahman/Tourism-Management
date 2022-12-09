"""TourismManagement URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from Tourism import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('reg_travel', views.reg_travel),
    path('approve_travel',views.approve_travel),
    path('place_manage',views.place_manage),
    path('complaint_view',views.complaint_view),
    path('feedback_view',views.feedback_view),
    path('add_place',views.add_place),
    path('edit_place/<id>',views.edit_place),
    path('Delete/<id>',views.delete),
    path('Reg_trav',views.registration_trav),
    path('Book_view',views.Book_view),
    path('Feedback_tr',views.Feedback_tr),
    path('Vehicle_manage',views.Vehicle_manage),
    path('Registration_user',views.Registration_user),
    path('Place_view',views.Place_view),
    path('Send_complaint',views.Send_complaint),
    path('Send_feedback',views.Send_feedback),
    path('',views.Login),
    path('vehicle_add',views.vehicle_add),
    path('edit_vehicle/<id>',views.edit_vehicle),
    path('delete2/<id>',views.delete2),
    path('Reject/<id>',views.Reject),
    path('Approve/<id>',views.approve),
    path('Admin',views.Admin),
    path('Traveler',views.Traveler),
    path('User',views.User1),
    path('Vehicle_view',views.Vehicle_view),
    path('replay/<i>',views.replay),
    path('Approve2/<id>',views.Approve2),
    path('Reject2/<id>',views.Reject2),
    path('Bookss/<id>',views.book),
    path('Booking_status',views.Booking_status),
    path('Booking_statuss',views.Booking_status2),
    path('View_replay',views.view_Replay),
    path('Login2',views.Login2),
    path('Register2',views.Register2),
    path('and_feedback',views.and_feedback),
    path('Complaint2',views.Complaint2),
    path('view_place2',views.view_place2),
    path('view_reply2',views.view_reply2),
    path('view_travelers2',views.view_travelers2),
    path('view_booking2',views.view_booking2),
    path('book2',views.book2),
    path('Register3',views.Register3),
    path('Gallery',views.Gal),

]
