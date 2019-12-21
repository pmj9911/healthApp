from django.http import HttpResponse
from healthapp.models import Food,Profile,Exercise
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser
from django.core.serializers.json import DjangoJSONEncoder
import json
import traceback

class HomePage(APIView):
    parser_classes = (MultiPartParser,)
    def get(self,request):
        try:
            jsonresp = {
                'exerciseId' : 5,
                'profileId' : 1,
                'exerciseName' : 'Running',
                'date' : '2019-08-10',
                'caloriesBurnt' : 800,
                'bmi' : 10,
            }
            return Response(jsonresp, content_type='application/json')
        except Exception as e:
                traceback.print_exc()
                print(e)
                return HttpResponse(status=403)
    def post(self,request):
        return HttpResponse(status=403)

class FoodPage(APIView):
    parser_classes = (MultiPartParser,)
    def post(self,request):
        try:
            myId = request.POST.get('token')
            print(myId)
            food = Food.objects.filter(foodid=myId).first()
            profile = Profile.objects.filter(profileid=myId).first()

            foodId = food.foodid
            foodName = food.foodname
            foodCals = food.calories        
            
            profileId = profile.profileid
            profileW = profile.profileweight
            profileH = profile.profileheight
            
            profileBMI = 10000 * profileW/(profileH**2)
            cals = profileBMI * foodCals
            calories = int(cals)
            bmi = int(profileBMI)
            print(profileBMI)
            print(profileH,profileW)
            jsonresp = {
                'foodId' : foodId,
                'profileId' : profileId,
                'calories' : calories,
                'bmi' : bmi,
            }
            return Response(jsonresp, content_type='application/json')
        except Exception as e:
                traceback.print_exc()
                print(e)
                return HttpResponse(status=403)

    def get(self,request):
        food = Food.objects.all()[:]
        foodJson = food.values()[:]
        return Response(foodJson, content_type='application/json')

class ExercisePage(APIView):
    parser_classes = (MultiPartParser,)
    def post(self,request):
        try:
            myId = request.POST.get('token')
            print(myId)
            exerise = Exercise.objects.filter(exerciseid=myId).first()
            profile = Profile.objects.filter(profileid=myId).first()      
            
            profileId = profile.profileid
            profileW = profile.profileweight
            profileH = profile.profileheight
            
            profileBMI = 10000 * profileW/(profileH**2)
            bmi = int(profileBMI)
            exeriseId = exerise.exerciseid
            exeriseName = exerise.exercisename
            exeriseCalories = exerise.calories
            
            caloriesBurnt = exeriseCalories*profileW
            calsBurnt = int(caloriesBurnt)

            jsonresp = {
                'exerciseId' : exeriseId,
                'profileId' : profileId,
                'calories' : calsBurnt,
                'bmi' : bmi,
            }
            return Response(jsonresp, content_type='application/json')
        except Exception as e:
                traceback.print_exc()
                print(e)
                return HttpResponse(status=403)
    def get(self,request):
        exercise = Exercise.objects.all()[:]
        exerciseJson = exercise.values()[:]
        return Response(exerciseJson, content_type='application/json')

class ProfilePage(APIView):
    parser_classes = (MultiPartParser,)
    def post(self,request):
        try:
            myId = request.POST.get('token')
            print(myId)
            profile = Profile.objects.filter(profileid=myId).first()      
            
            profileId = profile.profileid
            profileW = profile.profileweight
            profileH = profile.profileheight
            profileName = profile.profilename
            profileAge = profile.profileage
            profileBMI = 10000 * profileW/(profileH**2)
            
            weight = int(profileW)
            height = int(profileH)
            bmi = int(profileBMI)
            jsonresp = {
                'profileId' : profileId,
                'name' : profileName,
                'weight' : weight,
                'height' : height,
                'age' : profileAge,
                'bmi' : bmi,
            }
            return Response(jsonresp, content_type='application/json')
        except Exception as e:
                traceback.print_exc()
                print(e)
                return HttpResponse(status=403)
    def get(self,request):
        return HttpResponse(status=403)




