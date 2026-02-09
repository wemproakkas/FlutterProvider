import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:helpabode_provider/screens/dashboard/model/dashboard_overview_models.dart';
import 'package:helpabode_provider/screens/dashboard/model/slider_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile_model.dart';

class ProfileProvider extends ChangeNotifier { 
  ProfileModel profileData = ProfileModel();
  DashboardOverviewModel overviewData = DashboardOverviewModel(); 
  DashboardSliderModel sliderData = DashboardSliderModel(); 

  
  Future<void> pullToRefreashData() async {
 
        loadProfile();
        loadDashboardOverview();
        loadDashboardSlider();
 
  }

 

  Future<void> loadProfile() async {
  
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken') ?? '';

 

      final response = await http.get(
        Uri.parse(profileDetailsEndpoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
 

        profileData = ProfileModel.fromJson(data);
      } else {
         print('Failed to load surahs: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } 
    
    
    notifyListeners();



  }
  

  Future<void> loadDashboardOverview() async {
      try {
      
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('accessToken') ?? '';

        final response = await http.get(
          Uri.parse(dashboardOverviewEndpoint),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          overviewData = DashboardOverviewModel.fromJson(data);
          
        } else {
          debugPrint('Failed to load overview: ${response.statusCode}');
        }
      } catch (e) {
        debugPrint(e.toString());
      } 
      
      finally { 
        notifyListeners();
      }


    }


 
  // Dashboard Slider Provider start here 
  Future<void> loadDashboardSlider() async {
      try {
      
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('accessToken') ?? '';

        final response = await http.get(
          Uri.parse(dashboardSliderEndpoint),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          print('Slider API Data: $data'); // 🔹 debug

          sliderData = DashboardSliderModel.fromJson(data);
          
        } else {
          debugPrint('Failed to load overview: ${response.statusCode}');
        }
      } catch (e) {
        debugPrint(e.toString());
      } 
      
      finally { 
        notifyListeners();
      }


    }







 

}
