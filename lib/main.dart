import 'package:flutter/material.dart';
import 'package:helpabode_provider/core/service/auth_wrapper.dart';
import 'package:provider/provider.dart';
import 'core/app_providers.dart';
import 'utils/navigator_key.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: providers(),
      child: const HelpabodeProviderApp(),
    ),
  );
}

class HelpabodeProviderApp extends StatelessWidget {
  const HelpabodeProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'HelpAbode Provider App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 18, 105, 76),
          foregroundColor: Colors.white,
        ),
      ),
      home: const AuthWrapper(), 
    );
  }
}
