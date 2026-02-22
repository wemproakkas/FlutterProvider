import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:helpabode_provider/screens/services/service_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:http/http.dart' as http;

class ServiceDetailsProvider extends ChangeNotifier {

  ServiceDetailsModel serviceDetails = ServiceDetailsModel();
 
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }



  Future<void> loadServiceDetails(int serviceId) async {
  
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken') ?? '';
 
      final response = await http.get(
        Uri.parse("$serviceDetailsEndpoint$serviceId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );


      print("This is the response...");
      print(response);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
 

        serviceDetails = ServiceDetailsModel.fromJson(data);
      } else {
         print('Failed to load surahs: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } 
    
    
    notifyListeners();



  }


}
