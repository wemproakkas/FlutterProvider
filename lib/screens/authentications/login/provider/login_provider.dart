import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  String email = "";
  String password = "";

  bool isLoading = false;
  String errorMessage = "";

  void setEmailName(String val) {
    email = val;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    notifyListeners();
  }

  Future<bool> submitLoginForm() async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    final myData = {
      'email': email,
      'password': password,
    };

    bool loginSuccess = false;

    try {
      final url = Uri.parse(loginProviderEndpoint);  // API calling here
       
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(myData),
      );

      final data = jsonDecode(response.body);
 
      if (response.statusCode == 200 || response.statusCode == 201) {
 
        // Check exact key
        final accessToken = data['access'];
        print("Extracted token: $accessToken");
 
        if (accessToken != null && accessToken.isNotEmpty) {
 
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', accessToken);
          print("Login Success: Token Saved");
          loginSuccess = true;
        } else {
          errorMessage = "Token missing in response";
        }
      } else {
        final data = jsonDecode(response.body);
        errorMessage = data['error'] ?? "Login failed";
      }
    } catch (e) {
      errorMessage = e.toString();
    } 
    
    finally {
      isLoading = false;
      notifyListeners();
    }

    return loginSuccess;
  }
}
