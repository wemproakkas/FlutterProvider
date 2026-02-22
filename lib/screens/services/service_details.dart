import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/services/provider/service_details_provider.dart';
import 'package:helpabode_provider/screens/services/recommand_service.dart';
import 'package:provider/provider.dart'; 

class ServiceDetailsPage extends StatelessWidget {
  final int serviceId;
  const ServiceDetailsPage({super.key, required this.serviceId});
  
  final String description = "";

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServiceDetailsProvider>().loadServiceDetails(serviceId);
    });
  

    return Scaffold(
      body: Consumer<ServiceDetailsProvider>(
          builder: (context, pdtls, child) {

            final description = pdtls.serviceDetails.serviceData!.serviceDetails ?? '';
     
            final shouldShowButton = description.length > 120;
 
            return Stack(
              children: [
            
                /// 🔹 Top Image
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: Image.network(
                    pdtls.serviceDetails.serviceData!.image!,
                    fit: BoxFit.cover,
                  ),
                ),
            
                /// 🔹 Back Button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
            
                /// 🔹 Bottom Content
                Container(
                  margin: const EdgeInsets.only(top: 250),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView( 
                    child: Column( 
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          child: Column( 
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [ 
                              const SizedBox(height: 10),
            
                              /// Category
                              Container(
                                
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  pdtls.serviceDetails.serviceData!.categoryTitle!,
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
            
                              const SizedBox(height: 15),
            
                              /// Title
                              Text(
                                pdtls.serviceDetails.serviceData!.serviceTitle!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
            
                              const SizedBox(height: 10),
            
                              /// Price
                              Text(
                                "\$ ${pdtls.serviceDetails.serviceData!.price!}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
            
                              const SizedBox(height: 20),
            
                              const Text(
                                "Service Description",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
            
                              const SizedBox(height: 10),
            
                              /// Expandable Description
                              Text(
                                pdtls.isExpanded || !shouldShowButton
                                ? description
                                : description.substring(0, 120) + "...",

                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.6,
                                  color: Colors.black87,
                                  
                                ), 
                              ),
                              
            
                              if (shouldShowButton)
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<ServiceDetailsProvider>()
                                        .toggleExpanded();
                                  },
                                  child: Text(
                                    pdtls.isExpanded ? "See Less" : "See More",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
            
            
                            ],
                          ),
                        ),
            
                        Divider(thickness: 8, color: const Color.fromARGB(255, 229, 229, 229)),
            
                        Container( 
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column( 
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ratings", 
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        
                                        Text(
                                          "20+ ratings | 10+ public reviews", 
                                          
                                        ),
                                        
                                      
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 193, 193, 193),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Add Ratings",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100, 
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 232, 232, 232),
                                        borderRadius: BorderRadius.circular(8), 
                                      ),
                                      child: Column( 
                                        children: [
                                          SizedBox(height:28),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                              fontSize: 27,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color:Color.fromARGB(255, 94, 94, 94),
                                            size: 24,
                                            
                                          ),
                                          SizedBox(height:4),
                                          Text(
                                            "of 5 stars",
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          SizedBox(height:8),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      width: 240, 
                                      decoration: BoxDecoration( 
                                        color: const Color.fromARGB(255, 232, 232, 232),
                                        borderRadius: BorderRadius.circular(8), 
                                      ),
                                      child: Column( 
                                        children: [
                                          Row( 
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                width: 45,
                                                height:45,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(255, 136, 136, 136),
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: Icon(Icons.person, size: 30,color: Colors.white,),
                                          
                                              ),
                                              SizedBox(width: 8),
                                              Text("Md. Akkas Mia", 
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16
                                                ),
                                              )
                                            ],
                                          ), 
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star_rounded, size: 20,color: const Color.fromARGB(255, 28, 130, 101)),
                                                  Icon(Icons.star_rounded, size: 20,color: const Color.fromARGB(255, 28, 130, 101)),
                                                  Icon(Icons.star_rounded, size: 20,color: const Color.fromARGB(255, 28, 130, 101)),
                                                  Icon(Icons.star_rounded, size: 20,color: const Color.fromARGB(255, 28, 130, 101)),
                                                  Icon(Icons.star_rounded, size: 20,color: const Color.fromARGB(255, 28, 130, 101)),
                                                  SizedBox(width: 6),
                                                  Text("10 Feb 2026"),
                                                  
                                                ],
                                              ),
                                              Text("I recently hired a house cleaning service, and I couldn't be happier with the results! The team..."),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                              ),
                            ],
                          ),
                          
                        ),
            
                        Divider(thickness: 8, color: const Color.fromARGB(255, 229, 229, 229)),
            
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                          child: RecommendedServicesGrid(serviceId: serviceId),
                        ),
            
                      ],
                    ),
                  
                  ),
                ),
              ],
            );
          },
      ),
    ); 
  }
}
