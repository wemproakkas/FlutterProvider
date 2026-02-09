import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/service/auth_service.dart';
import 'package:helpabode_provider/screens/authentications/login/login.dart';
import 'package:helpabode_provider/screens/dashboard/dashboard_screen.dart';
import 'package:helpabode_provider/screens/splash_screen.dart';
 

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final result = await AuthService.initialize(context);
    setState(() {
      isLoggedIn = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      return const SplashScreen();
    }

    return isLoggedIn! 
        ? const ProviderAppDashboardScreen()
        : const ProviderLoginScreen();
  }
}

