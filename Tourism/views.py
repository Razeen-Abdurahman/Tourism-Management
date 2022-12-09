from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render, redirect
import datetime
from Tourism.models import *

# Create your views here.

def reg_travel(request):
    trav = travelers.objects.filter(TRAVELID__usertype='Pending')
    return render(request,'adminn/View_registered_traveller.html', {"regi": trav})

def approve(request,id):
        login.objects.filter(id=id).update(usertype='Traveler')
        return HttpResponse("return<script>alert('Approved');window.location='/reg_travel'</script>")

def Reject(request,id):
    travelers.objects.filter(id=id).delete()
    return HttpResponse("return<script>alert('Rejected');window.location='/reg_travel'</script>")


def approve_travel(request):
    qry = travelers.objects.filter(TRAVELID__usertype='Traveler')
    return render(request,'adminn/View_approved_traveller.html',{'tra':qry})

def place_manage(request):
   placee= Place.objects.all()
   return render(request,'adminn/Places_management.html', {"places": placee})

def complaint_view(request):
    qry = Complaints.objects.all()
    return render(request,'adminn/View_complaint.html',{'comp':qry})

def feedback_view(request):
    qry = Feedback.objects.all()
    return render(request,'adminn/View_feedback.html',{'feed':qry})

def add_place(request):
    if request.method == "POST":
        a = request.POST['textfield']
        b = request.FILES['fileField']
        c = request.POST['textfield2']
        d = request.POST['textfield3']
        e = request.POST['textfield4']
        fs = FileSystemStorage()
        dt=datetime.datetime.now().strftime("%Y%m%d%H%M%S")

        fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\"+dt+'.jpg', b)
        path = "/static/"+dt+'.jpg'
        n = Place()
        n.Name = a
        n.Image = str(path)
        n.Place = c
        n.Post = d
        n.Pin = e
        n.save()
        return HttpResponse("return<script>alert('Place added');window.location='/add_place'</script>")
    else:
        return render(request, "adminn/add_place.html")

def delete(request,id):
    Place.objects.filter(id=id).delete()
    return redirect('/place_manage')

def edit_place(request,id):
    if request.method == "POST":
         a = request.POST['textfield']
         b = request.FILES['fileField']
         c = request.POST['textfield2']
         d = request.POST['textfield3']
         e = request.POST['textfield4']
         fs = FileSystemStorage()
         dt = datetime.datetime.now().strftime("%Y%m%d%H%M%S")

         fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\" + dt + '.jpg', b)
         path = "/static/" + dt + '.jpg'
         Place.objects.filter(id=id).update(Name=a, Image=str(path) ,Place = c,Post=d,Pin = e)
         return redirect('/place_manage')
    else:
         qry = Place.objects.get()
         return render(request, 'adminn/Edit_place.html',{'placee':qry})

def registration_trav(request):
    if request.method=='POST':
        a = request.POST['textfield']
        b = request.POST['textfield2']
        c = request.POST['textfield3']
        d = request.POST['textfield4']
        e= request.POST['textfield5']
        f = request.FILES['fileField']
        g = request.POST['textfield6']
        h = request.POST['textfield7']
        date=datetime.datetime.now().strftime("%y%m%d-%H%M%S")
        fs = FileSystemStorage()
        fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\"+date+'.jpg',f)
        path="/static/"+date+'.jpg'
        print(path)

        qry = login.objects.filter(Username=e)
        # qry=qry[0]
        if qry.exists():
            return HttpResponse("return<script>alert('Email Already exists!!');window.location='/Reg_trav'</script>")
        else:


            print(a, "\n", b, "\n", c, "\n", d, "\n", e, f, "\n", g, "\n")
            lo = login()
            lo.Username = e
            lo.Password = h
            lo.usertype = 'Pending'
            lo.save()

            rt = travelers()
            rt.Name = a
            rt.Place = b
            rt.Post = c
            rt.Pin = d
            rt.Email = e
            rt.Photo = str(path)
            rt.PhoneNo= g
            rt.TRAVELID=lo
            rt.save()
            return HttpResponse("return<script>alert('Registered Successfully');window.location='/'</script>")
    else:
        return  render(request,'traveller/RegistrationT.html')

def Book_view(request):
       qry = Booking.objects.all()
       return render(request,'traveller/Booking_view.html',{'booki':qry})

def Approve2(request,id):
      Booking.objects.filter(id=id).update(Status = 'Approved')
      return HttpResponse("return<script>alert('Approved');window.location='/Book_view'</script>")


def Reject2(request,id):
    Booking.objects.filter(id=id).delete()
    return HttpResponse("return<script>alert('Rejected');window.location='/Book_view'</script>")


def Feedback_tr(request):
    qry = Feedback.objects.all()
    return render(request,'traveller/feedback_tr.html',{'feeds':qry})

def Vehicle_manage(request):
    qry = Vehicle.objects.all()
    return render(request,'traveller/Vehicle_management.html',{'vehi':qry})

def Registration_user(request):
    if request.method=='POST':
        a = request.POST['textfield']
        b = request.POST['textfield2']
        c = request.POST['textfield3']
        d = request.POST['textfield4']
        e= request.POST['textfield5']
        f = request.FILES['fileField']
        g = request.POST['textfield6']
        h = request.POST['textfield7']
        date=datetime.datetime.now().strftime("%y%m%d-%H%M%S")

        fs = FileSystemStorage()
        fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\"+date+'.jpg',f)
        path="/static/"+date+'.jpg'
        print(path)

        qry = login.objects.filter(Username=e)
        if qry.exists():
            return HttpResponse("return<script>alert('Email Already Exists!!');window.location='/Registration_user'</script>")
        else:

            print(a, "\n", b, "\n", c, "\n", d, "\n", e, f, "\n", g, "\n")
            loge = login()
            loge.Username = e
            loge.Password = h
            loge.usertype = 'User'
            loge.save()
            re = User()
            re.Name = a
            re.Place = b
            re.Post = c
            re.Pin = d
            re.Email = e
            re.Photo = str(path)
            re.PhoneNo= g
            re.USERID=loge
            re.save()
            return HttpResponse(
                "return<script>alert('Registered Successfully');window.location='/'</script>")
    else:
       return render(request,'Userr/RegistrationU.html')

def Place_view(request):
    qry = Place.objects.all()
    return render(request,'Userr/Place_view.html',{'placee':qry})

def Send_complaint(request):
    if request.method == 'POST':
        a = request.POST['textarea']
        b = datetime.datetime.now().strftime("%Y-%m-%d")
        u=request.session['lid']
        print(u)
        uid=User.objects.get(USERID=request.session['lid'])
        co = Complaints()
        co.Complaints = a
        co.date = b
        co.replay='pending'
        co.Replay_date = b
        co.USERID = uid
        co.save()
        return HttpResponse("return<script>alert('Complaint sended');window.location='/Send_complaint'</script>")
    else:
        qry = Complaints.objects.all()
        return render(request,'Userr/send_complaint.html',{'comp':qry})

def Send_feedback(request):
    if request.method == 'POST':
        a = request.POST['textarea']
        b = datetime.datetime.now().strftime("%Y-%m-%d")
        print(a)
        f = Feedback()
        f.Feedback = a
        f.date = b
        f.save()
        return HttpResponse("return<script>alert('Feedback sended');window.location='/Send_feedback'</script>")
    else:
        return render(request, 'Userr/send_feedback.html')



def Login(request):
    if request.method=='POST':
        a = request.POST['textfield']
        b = request.POST['textfield2']
        print(a, "\n", b)
        qry=login.objects.filter(Username = a, Password =b)
        if qry.exists():
            qry=qry[0]
            if qry.usertype=='Admin':
                return HttpResponse("return<script>alert('Login Successfully');window.location='/Admin'</script>")
            elif qry.usertype=='Traveler':
                request.session['lid'] = qry.id
                return HttpResponse("return<script>alert('Login Successfully');window.location='/Traveler'</script>")
            elif qry.usertype=='User':
                request.session['lid']=qry.id
                return HttpResponse("return<script>alert('Login Successfully');window.location='/User'</script>")
            else:
                return HttpResponse("return<script>alert('Incorrect Username/Password!!');window.location='/'</script>")
        else:
            return HttpResponse("return<script>alert('Incorrect Username/Password!!');window.location='/'</script>")
    else:
       return render(request,'login_index.html')

def vehicle_add(request):
    if request.method == 'POST':
        a = request.POST['textfield']
        b = request.POST['textfield2']
        c = request.POST['textfield3']
        d = request.POST['textfield4']
        e = request.POST['textfield5']
        print(a,b,c,d,e)
        t = request.session['lid']
        print(t)
        tid = travelers.objects.get(TRAVELID=request.session['lid'])
        v = Vehicle()
        v.Name = a
        v.Capacity = b
        v.Type = c
        v.Details = d
        v.Cost = e
        v.TRAVELID = tid
        v.save()

        return HttpResponse("return<script>alert('Vehicle added');window.location='/vehicle_add'</script>")
    else:
        return render(request,'traveller/vehicle_add.html')

def delete2(request,id):
    Vehicle.objects.filter(id=id).delete()
    return redirect('/Vehicle_manage')

def edit_vehicle(request,id):
    if request.method == "POST":
         a = request.POST['textfield']
         b = request.POST['textfield2']
         c = request.POST['textfield3']
         d = request.POST['textfield4']
         e = request.POST['textfield5']
         Vehicle.objects.filter(id=id).update(Name=a, Capacity=b ,Type = c,Details=d,Cost = e)
         return redirect('/Vehicle_manage')
    else:
         qry = Vehicle.objects.filter(id=id).get()
         return render(request, "traveller/edit_vehicle.html", {'editt': qry})


def Vehicle_view(request):
    qry = Vehicle.objects.all()
    return render(request,'Userr/Vehicle_view.html',{'veh':qry})

def book(request, id):
    us = User.objects.get(USERID=request.session['lid'])
    veh = Vehicle.objects.get(id=id)
    book1 = Booking()
    book1.USERID = us
    book1.VEHICLEID = veh
    book1.Date = datetime.datetime.now().strftime("%Y-%m-%d")
    book1.Status = 'Pending'
    book1.save()

    return HttpResponse("return<script>alert('Booking successful');window.location='/Vehicle_view'</script>")

def replay(request,i):
    if request.method=='POST':
        a = request.POST['textarea']
        b = datetime.datetime.now().strftime("%Y-%m-%d")
        coo = Complaints.objects.get(id=i)
        coo.replay = a
        coo.Replay_date = b
        coo.save()
        return HttpResponse("return<script>alert('Replay sended');window.location='/replay/<i>'</script>")
    else:

        return render(request,'adminn/Reply.html')


def Booking_status(request):
    qry = Booking.objects.all()
    return render(request,'Userr/Booking.html',{'bookii':qry})

def Booking_status2(request):
    qry = Booking.objects.all()
    return render(request,'traveller/Booking2.html',{'booki':qry})

def view_Replay(request):
    qry = Complaints.objects.all()
    return  render(request,'Userr/View_replay.html',{'comp':qry})


def Admin(request):
    return render(request,'adminn/Admin_index.html')

def Traveler(request):
    return render(request,'traveller/Traveller_index.html')
#
def User1(request):
    return render(request,'Userr/User_index.html')

# ==========================================================================
                # Android user module
# ==========================================================================

def Login2(request):
    a = request.POST['u']
    b = request.POST['p']
    qry = login.objects.filter(Username=a, Password=b)
    print(qry)
    if qry.exists():
        lid = qry[0].id
        type=qry[0].usertype
        return JsonResponse({'status':"ok","lid":lid,"type":type})
    else:
        return JsonResponse({'status':"none"})


def and_feedback(request):
    fdbck = request.POST['feed']

    user_id = request.POST['id']
    date = datetime.datetime.now().strftime("%Y-%m-%d")
    uid = User.objects.get(USERID=user_id)

    print(user_id,date,fdbck)
    f = Feedback()
    f.Feedback = fdbck
    f.date = date
    f.USERID = uid
    f.save()
    return JsonResponse({"status":"ok"})

def Complaint2(request):
    a = request.POST['comp']
    b = datetime.datetime.now().strftime("%Y-%m-%d")

    user = request.POST['id']

    uid = User.objects.get(USERID=user)
    print(a,b,user)
    co = Complaints()
    co.Complaints = a
    co.date = b
    co.Reply = 'pending'
    co.Reply_date = b
    co.USERID = uid
    co.save()
    return JsonResponse({"status":"ok"})





def Register2(request):
    a = request.POST['N']
    b = request.POST['P']
    c = request.POST['Po']
    d = request.POST['Pi']
    e = request.POST['E']
    g = request.POST['Ph']
    h = request.POST['Pass']

    loge = login()
    loge.Username = e
    loge.Password = h
    loge.usertype = 'User'
    loge.save()
    re = User()
    re.Name = a
    re.Place = b
    re.Post = c
    re.Pin = d
    re.Email = e
    re.PhoneNo = g
    re.USERID = loge
    re.save()
    return JsonResponse({'status':"ok"})

def view_place2(request):
    qry = Place.objects.all()
    print(qry)
    ar=[]
    for i in qry:
        ar.append({"Name":i.Name,"Image":i.Image,"Place":i.Place,"Post":i.Post,"Pin":i.Pin})
    return JsonResponse({"status":"ok","data":ar})

def view_reply2(request):
    user = request.POST['id']
    print(user)
    u = User.objects.get(USERID=user)
    print(u)
    qry = Complaints.objects.filter(USERID=u)
    print(qry)


    ar=[]
    for i in qry:
        ar.append({"Complaints":i.Complaints,"Date":i.date,"Reply":i.Reply,"Reply_date":i.Reply_date})
    return JsonResponse({"status":"ok","data":ar})


def view_travelers2(request):
    qry = Vehicle.objects.all()
    print(qry)

    ar = []
    for i in qry:
        ar.append({"Name":i.Name,"Type":i.Type,"Details":i.Details,"Capacity":i.Capacity,"Price":i.Cost,"vid":i.id})
    return JsonResponse({"status": "ok", "data": ar})





def view_booking2(request):
    qry = Booking.objects.all()
    print(qry)

    ar = []
    for i in qry:
        ar.append({"Vehicle_name":i.VEHICLEID.Name,"Date":i.Date,"Status":i.Status})
    return JsonResponse({"status":"ok","data":ar})

def book2(request):
    id=request.POST['id']
    vid=request.POST['vid']
    us = User.objects.get(USERID=id)
    veh = Vehicle.objects.get(id=vid)
    book1 = Booking()
    book1.USERID = us
    book1.VEHICLEID = veh
    book1.Date = datetime.datetime.now().strftime("%Y-%m-%d")
    book1.Status = 'Pending'
    book1.save()

    return JsonResponse({"status":"ok"})

def Register3(request):
    a = request.POST['na']
    b = request.POST['pla']
    c = request.POST['pos']
    d = request.POST['pin']
    e = request.POST['em']
    f = request.FILES['pic']
    g = request.POST['phon']
    h = request.POST['p']

    date = datetime.datetime.now().strftime("%y%m%d-%H%M%S")

    fs = FileSystemStorage()
    fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\" + date + '.jpg', f)
    path = "/static/" + date + '.jpg'
    print(path)

    loge = login()
    loge.Username = e
    loge.Password = h
    loge.usertype = 'User'
    loge.save()
    re = User()
    re.Name = a
    re.Place = b
    re.Post = c
    re.Pin = d
    re.Photo = str(path)
    re.Email = e
    re.PhoneNo = g
    re.USERID = loge
    re.save()
    return JsonResponse({'status': "ok"})



def Gal(request):
    f = request.FILES['pic']
    id = request.POST['id']
    date = datetime.datetime.now().strftime("%y%m%d-%H%M%S")
    uid = User.objects.get(USERID=id)
    print(uid)
    fs = FileSystemStorage()
    fs.save(r"C:\Users\ruzai\PycharmProjects\TourismManagement\Tourism\static\\" + date + '.jpg', f)
    path = "/static/" + date + '.jpg'
    print(path)
    ga = Gallery()
    ga.Photo = str(path)
    ga.USERID = uid
    ga.save()
    return JsonResponse({'status': "ok"})





