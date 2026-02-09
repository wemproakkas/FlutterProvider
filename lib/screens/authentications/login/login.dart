import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/authentications/login/provider/login_provider.dart';
import 'package:helpabode_provider/screens/authentications/registration/registration_screen.dart';
import 'package:helpabode_provider/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class ProviderLoginScreen extends StatelessWidget {
  const ProviderLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<LoginProvider>(
      builder: (context, loginPro, child){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              centerTitle: true,
            ),
            
            
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40), 
                    
                      Center(
                        child: Image(
                          image: const AssetImage("assets/images/reg_logo.png"),
                          width: 120,
                          height: 120,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.image_not_supported,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Provider Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        onChanged: (String val){
                          loginPro.setEmailName(val);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (String val){
                          loginPro.setPassword(val);
                        },

                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                        ),
                      ),


                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {  
                            if(await loginPro.submitLoginForm()){

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProviderAppDashboardScreen(),
                                  ),
                                );
                            }else{
                               ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(loginPro.errorMessage.isNotEmpty
                                      ? loginPro.errorMessage
                                      : "Login Failed")),
                                );
                            } 
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: const Color.fromARGB(255, 18, 105, 76),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    
                      const SizedBox(height: 40),


                      
                          Row(
                            children: [
                              Text("Don't have any account?"),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RegistrationScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),


                    ],
                  ),
                ),
              ),
            ),
          );
      }  
    );  
  }
}