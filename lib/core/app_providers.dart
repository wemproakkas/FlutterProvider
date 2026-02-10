import 'package:helpabode_provider/screens/authentications/login/provider/login_provider.dart';
import 'package:helpabode_provider/screens/authentications/registration/provider/registration_provider.dart';
import 'package:helpabode_provider/screens/dashboard/provider/dashboard_provider.dart';
import 'package:helpabode_provider/screens/services/provider/service_provider.dart'; 
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider( create: (_) => RegistrationProvider()),
    ChangeNotifierProvider( create: (_) => LoginProvider()),
    ChangeNotifierProvider( create: (_) => ProfileProvider()), 
    ChangeNotifierProvider( create: (_) => AddServiceProvider()),  
  ];
}
