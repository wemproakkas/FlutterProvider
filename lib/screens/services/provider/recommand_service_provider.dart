import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/const_variable.dart';
import 'package:helpabode_provider/screens/services/model/recommand_service_model.dart';
import 'package:http/http.dart' as http; 

class RecommandServiceProvider extends ChangeNotifier {

  RecommandedServiceModel? _recommandedServiceModel;
  
  RecommandedServiceModel? get recommandData => _recommandedServiceModel;
 

  /// Load Recommended Services
  Future<void> loadRecommandedServices(int serviceId) async {
 
    notifyListeners();

    try {
      final response = await http.get( 
        Uri.parse("$recommandedServicesEndpoint$serviceId"),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _recommandedServiceModel =
            RecommandedServiceModel.fromJson(jsonData);
      } else {
         print("say something...");
      }
    } catch (e) {
      print(e.toString());
    }
 
    notifyListeners();
  }

 
  void clearData() {
    _recommandedServiceModel = null;
    notifyListeners();
  }


  
}
