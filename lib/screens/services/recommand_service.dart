import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/services/provider/recommand_service_provider.dart';
import 'package:helpabode_provider/screens/services/service_details.dart';
import 'package:provider/provider.dart';

  
class RecommendedServicesGrid extends StatelessWidget {
  final int serviceId;
  const RecommendedServicesGrid({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecommandServiceProvider>().loadRecommandedServices(serviceId);
    });



    return Consumer<RecommandServiceProvider>(
      builder: (context, rspro, _) {
 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Recommended Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
    
            // 🔹 GridView
            GridView.builder(
              shrinkWrap: true, // Important: Container / Column  
              physics: const NeverScrollableScrollPhysics(), // Scroll parent scroll 
              itemCount: rspro.recommandData!.serviceData!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 column
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3/3, // width / height
              ),
              itemBuilder: (context, index) {
                final service = rspro.recommandData!.serviceData![index];

                print("===================Akkas Mia=================");
                print(service);

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(70),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServiceDetailsPage(serviceId: service.id!),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            service.image!,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                    
                        const SizedBox(height: 8),
                    
                        // 🔹 Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            service.categoryTitle!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                    
                        // 🔹 Price
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "\$ ${service.price}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 36, 111, 80),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );

  }

}
