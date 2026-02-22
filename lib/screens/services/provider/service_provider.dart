import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:helpabode_provider/screens/services/service_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddServiceProvider extends ChangeNotifier {

  bool isLoading = false;

  ServicesModel serviceData = ServicesModel(); 

  String categoryTitle = "";
  String serviceTitle = "";
  String serviceDetails = "";
  int serviceRank = 0;

  File? selectedImage;

  
  String errorMessage = "";

  /// setters
  void setCategoryTitle(String val) {
    categoryTitle = val;  
    notifyListeners();
  }

  void setServiceTitle(String val) {
    serviceTitle = val;
    notifyListeners();
  }

  void setServiceDetails(String val) {
    serviceDetails = val;
    notifyListeners();
  }

  void setServiceRank(String val) {
    serviceRank = int.tryParse(val) ?? 0;
    notifyListeners();
  }

  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

  /// loading control
  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  void setError(String msg) {
    errorMessage = msg;
    notifyListeners();
  }


  void resetForm() {
  categoryTitle = "";
  serviceTitle = "";
  serviceDetails = "";
  serviceRank = 0;
  selectedImage = null;
  errorMessage = "";
  notifyListeners();
}
 
  Future<bool> serviceManageForm() async {
 
    try {
      final url = Uri.parse(serviceManageEndpoint); // emulator example

      var request = http.MultipartRequest('POST', url);
 
        // Text fields
      request.fields['category_title'] = categoryTitle;
      request.fields['service_title'] = serviceTitle;
      request.fields['service_details'] = serviceDetails;
      request.fields['service_rank'] = serviceRank.toString();

      // Image field (if selected)
      if (selectedImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            selectedImage!.path,
            filename: basename(selectedImage!.path),
          ),
        );
      }

      // Send request
      var response = await request.send();




      // Get response body
      final respStr = await response.stream.bytesToString();
       
 
      if (response.statusCode == 200 || response.statusCode == 201) {

        
        print("Registration Success: $respStr");
        selectedImage = null;
        notifyListeners(); 

        return true;
      } else {
        print("Registration Failed: $respStr");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

 

 
 
  // Load services here 
  Future<void> loadServiceList() async {
    isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken') ?? '';

      final response = await http.get(
        Uri.parse(serviceManageEndpoint),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        serviceData = ServicesModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }





 
}
