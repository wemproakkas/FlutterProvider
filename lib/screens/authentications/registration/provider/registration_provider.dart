 
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class RegistrationProvider extends ChangeNotifier {
  String fullName = "";
  String email = "";
  String phone = "";
  String password = "";
  File? selectedImage;

  void setFullName(String val) {
    fullName = val;
    notifyListeners();
  }

  void setEmailName(String val) {
    email = val;
    notifyListeners();
  }

  void setPhone(String val) {
    phone = val;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    notifyListeners();
  } 

  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

 
  Future<bool> submitRegistrationForm() async {
 
    try {
      final url = Uri.parse(registrationProviderEndpoint); // emulator example

      var request = http.MultipartRequest('POST', url);
 
        // Text fields
      request.fields['fullName'] = fullName;
      request.fields['email'] = email;
      request.fields['phone'] = phone;
      request.fields['password'] = password;

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





}
