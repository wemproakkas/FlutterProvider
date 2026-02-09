import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:helpabode_provider/screens/dashboard/model/slider_model.dart';
import 'package:helpabode_provider/screens/dashboard/provider/dashboard_provider.dart';
import 'package:provider/provider.dart'; 

class DashboardSlider extends StatelessWidget {
  const DashboardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderList =
        context.watch<ProfileProvider>().sliderData.sliderList ?? [];

    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    if (sliderList.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 170,  
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
            items: sliderList.map((SliderList item) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (_, __, ___) =>
                      Container(color: Colors.grey), // fallback
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: (context, current, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sliderList.asMap().entries.map((entry) {
                  final isActive = current == entry.key;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: isActive ? 20 : 8,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color.fromARGB(255, 239, 65, 65)
                          : const Color.fromARGB(255, 232, 82, 82),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
