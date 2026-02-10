// auth_wrapper.dart

import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/service/auth_service.dart';
import 'package:helpabode_provider/screens/authentications/login/login.dart';
import 'package:helpabode_provider/screens/dashboard/dashboard_screen.dart';
import 'package:helpabode_provider/screens/splash_screen.dart';
 
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AuthService.initialize(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Something went wrong: ${snapshot.error}')),
          );
        }

        if (snapshot.data == true) {
          return const ProviderAppDashboardScreen();
        }

        return const ProviderLoginScreen();
      },
    );
  }
}
