import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/services/provider/service_provider.dart';
import 'package:helpabode_provider/screens/services/service_details.dart';
import 'package:provider/provider.dart';

class ServiceListDesign extends StatelessWidget {
 
  const ServiceListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddServiceProvider>(
      builder: (context, pro, _) {
        final serviceList = pro.serviceData.serviceList ?? [];

        // 🔹 Loading state
        if (pro.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 🔹 Empty state
        if (serviceList.isEmpty) {
          return const Scaffold(
            body: Center(child: Text("No services found")),
          );
        }

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 240, 240),
          appBar: AppBar(
            title: const Text('My Services'),
            centerTitle: true,
            
          ),

          body: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: serviceList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final service = serviceList[index];
 
              return Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ServiceDetailsPage(serviceId: service.id!),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // ✅ Network image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            service.image ?? '',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.serviceTitle ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                service.categoryTitle ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
