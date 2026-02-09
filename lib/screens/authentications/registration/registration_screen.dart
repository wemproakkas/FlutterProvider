// registration_screen.dart file 
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/authentications/login/login.dart';
import 'package:helpabode_provider/screens/authentications/registration/provider/registration_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart'; 


class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<RegistrationProvider>(
      builder: (context, regPro, child){
        return  Scaffold(
          resizeToAvoidBottomInset: true, 
          body: Container( 
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color:Color.fromARGB(255, 57, 89, 117),

              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.jpg"),
                fit: BoxFit.cover,
                opacity: 0.2,
                
              ),
              
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 30,
                  child: Image(
                    image: AssetImage("assets/images/reg_logo.png"),
                    width: 150,
                    height: 150,  
                          
                  ),
                ),
              
          
              
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity, 
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    ),
                          
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          const Text(
                            'User Registration',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          
                          // Input Name Field  
                          const SizedBox(height: 20),
                          TextField(
                            
                            onChanged: (String val){
                               regPro.setFullName(val);
                            },
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          
                          
                          // Input Email Field  
                          const SizedBox(height: 20),
                          TextField(
                            onChanged: (String val){
                               regPro.setEmailName(val);
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.email),
                            ),
                          ),
                          
                          
                          // Input Phone Field  
                          const SizedBox(height: 20),
                          TextField(
                            onChanged: (String val){
                               regPro.setPhone(val);
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone', 
                              
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.phone),
                            ),
                          ),

  
                          const SizedBox(height: 20),
                          TextField(
                            
                            obscureText: true,
                            onChanged: (String val){
                               regPro.setPassword(val);
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                          ),
                          const SizedBox(height: 20),
 
  
 
                          InkWell(
                            onTap: () async {
                              if(await regPro.submitRegistrationForm()){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProviderLoginScreen(),
                                    ),
                                  );
                              }else{
                                
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 105, 76),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white))),
                            ),
                          ),
                          
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Text("Have an Account?"),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProviderLoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
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
                )
            
              
              ],
            ),
            

          ),
        );
      }
    );
    
  }

}

 

Future<void> pickImage(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // ignore: use_build_context_synchronously
    context.read<RegistrationProvider>().setImage(File(pickedFile.path));
  }
}