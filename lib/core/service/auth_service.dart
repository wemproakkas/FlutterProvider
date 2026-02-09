import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/dashboard/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';  

class AuthService {
  static Future<bool> initialize(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    if (token == null || token.isEmpty) return false;

    // Provider data load safely AFTER context available
    await Provider.of<ProfileProvider>(context, listen: false).pullToRefreashData();

    return true;
  }
}

