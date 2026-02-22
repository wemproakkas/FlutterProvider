from rest_framework.views import APIView
from rest_framework.response import Response
from . models import *
from rest_framework import status
from rest_framework import permissions
from .serializers import ProductSerializer
from django.shortcuts import get_object_or_404


from rest_framework_simplejwt.tokens import RefreshToken

def get_tokens_for_user(user):
    refresh = RefreshToken.for_user(user)
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }



class ProductListAPIView(APIView):
    def get(self, request):
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)
    

class RegistrationProviderView(APIView):
    def post(self, request):

        get_data = request.data
        
        print("Get data from frontend", get_data)

        full_name = get_data.get('fullName')
        email = get_data.get('email')
        phone = get_data.get('phone')
        password = get_data.get('password') 
        image = request.FILES.get('image') 

        print("image: ", image)


        CustomUser.objects.create(
            full_name = full_name,
            email = email, 
            phone = phone, 
            password = password, 
            image = image
        )

        print("Registraion successfully done for Md. ", full_name) 
        
        return  Response({"messages": "Data get success"}, status=status.HTTP_201_CREATED)


class loginProvider(APIView):

    def post(self, request):
        get_data = request.data 
 
        email = get_data.get('email') 
        password = get_data.get('password') 


        chk_exist = CustomUser.objects.filter(email=email).first()
        if chk_exist: 
            if chk_exist.password == password:
                tokens = get_tokens_for_user(chk_exist)
                return Response({
                    "messages": "Login success",
                    "access": tokens['access'],
                    "refresh": tokens['refresh'],
                }, status=status.HTTP_201_CREATED)
            

            else:
                print("Password not Match") 
                return  Response({"messages": "Password not Match"}, status=status.HTTP_404_NOT_FOUND)

        else:
            print("User not found")
            return  Response({"messages": "User not found"}, status=status.HTTP_404_NOT_FOUND)

 
class profileDetails(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = request.user 
 
        return Response(
            {
                "fullName": user.full_name,
                "email": user.email,
                "phone": user.phone,
                "image": request.build_absolute_uri(user.image.url) if user.image else ""
            },
            status=status.HTTP_200_OK
        )
 
class dashboardOverview(APIView): 
    permission_classes = [permissions.IsAuthenticated]
    
    def get(self, request):

        dashboard_data = [
            {
                "value": "$9000.00",
                "title": "Bookings", 
            },
            {
                "value": "40",
                "title": "Active User", 
            },
            {
                "value": "118",
                "title": "Completed", 
            },
            {
                "value": "4.5",
                "title": "Reviews", 
            }
        ]

        return Response({"dashboard_data": dashboard_data}, status=status.HTTP_200_OK)


class dashboardSlider(APIView):  
    
    def get(self, request):

        sliders = SliderList.objects.all()

        slider_list = []

        if sliders:
            for data in sliders:
                slider_list.append(
                    {
                        "title": data.title,
                        "image":  request.build_absolute_uri(data.image.url) if data.image else "",
                        "rank": data.rank
                    }
                )

 
        return Response({"slider_list": slider_list}, status=status.HTTP_200_OK)





class serviceManage(APIView):  

    def get(self, request):

        services = Services.objects.all()
 
        service_list = []

        if services:
            for data in services:
                service_list.append(
                    {
                        'id': data.id,
                        'category_title': data.category_title,
                        'service_title': data.service_title,
                        'service_details': data.service_details,
                        'service_rank': data.rank,
                        'created': data.created,
                        'image': request.build_absolute_uri(data.image.url) if data.image else "",
                    }
                )
 
        return Response({"service_list": service_list}, status=status.HTTP_200_OK)


    
    def post(self, request):
        print("data from fornd end: ", request.data)
        try:
            category_title = request.data.get('category_title', '')
            service_title = request.data.get('service_title', '')
            service_details = request.data.get('service_details', '')
            rank = request.data.get('service_rank', 0)
            image = request.FILES.get('image')

          
            if not category_title or not service_title:
                return Response(
                    {"message": "category_title and service_title are required"},
                    status=status.HTTP_400_BAD_REQUEST
                )

            service = Services.objects.create(
                category_title=category_title,
                service_title=service_title,
                service_details=service_details,
                rank=rank,
                image=image
            )

            return Response(
                {
                    "message": "Service created successfully", 
                },
                status=status.HTTP_201_CREATED
            )

        except Exception as e:
            return Response(
                {"message": "Something went wrong", "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        


from django.forms.models import model_to_dict
class serviceDetails(APIView):
 
    def get(self, request, id):
     
        try:
            service = Services.objects.get(id=id)
        except Services.DoesNotExist:
            return Response(
                {"error": "Service not found"},
                status=status.HTTP_404_NOT_FOUND
            )
        
        # Convert model instance to dict
        service_data = model_to_dict(service)

        # If image exists, return full URL
        if service.image:
            service_data['image'] = request.build_absolute_uri(service.image.url)
        else:
            service_data['image'] = None

        return Response({"service_data": service_data}, status=status.HTTP_200_OK)


class recommandedServiceList(APIView):

    def get(self, request, service_id):
 
        service = get_object_or_404(Services, id=service_id)
 
        recommended_services = Services.objects.filter(
            category_title=service.category_title
        ).exclude(id=service_id).order_by('-rank')[:10]

        service_data = []

        for item in recommended_services:
            service_data.append({
                "id": item.id,
                "categoryTitle": item.category_title,
                "serviceTitle": item.service_title,
                "serviceDetails": item.service_details,
                "price": item.price,
                "rank": item.rank,
                "image": request.build_absolute_uri(item.image.url) if item.image else None
            })


        return Response({"service_data": service_data}, status=status.HTTP_200_OK)






