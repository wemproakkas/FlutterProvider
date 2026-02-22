from django.urls import path
from . views import *

urlpatterns = [
    path('products/', ProductListAPIView.as_view()),
    path('registrationProvider/', RegistrationProviderView.as_view(), name='RegistrationProviderView'),
    path('loginProvider/', loginProvider.as_view(), name='loginProvider'),
    path('profileDetails/', profileDetails.as_view(), name='profileDetails'),
    path('dashboardOverview/', dashboardOverview.as_view(), name='dashboardOverview'),
    path('dashboardSlider/', dashboardSlider.as_view(), name='dashboardSlider'),
    path('serviceManage/', serviceManage.as_view(), name='serviceManage'),
    path('service/details/<int:id>', serviceDetails.as_view(), name='serviceDetails'),
    path('service/recommanded-services/<int:service_id>', recommandedServiceList.as_view(), name='recommandedServiceList'),
]
