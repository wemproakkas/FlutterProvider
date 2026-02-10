import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/services/image_picker_helper.dart';
import 'package:helpabode_provider/screens/services/provider/service_provider.dart'; 
import 'package:helpabode_provider/screens/services/services_screen.dart'; 
 
import 'package:provider/provider.dart'; 

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Cleaning',
      'Plumbing',
      'Electrical',
      'Painting',
    ];


    return Consumer<AddServiceProvider>(
      builder: (context, serPro, child){

      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Service'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Service Category Dropdown
              Text(
                'Service Category',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width - 32,
                hintText: 'Select Category',
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                dropdownMenuEntries: categories
                    .map(
                      (e) => DropdownMenuEntry(
                        value: e,
                        label: e,
                      ),
                    )
                    .toList(),
                
                onSelected: (String? val) {
                  if (val != null) {
                    serPro.setCategoryTitle(val);
                    print(val);
                  };
                },
                
              ),

              const SizedBox(height: 20),

              /// Service Title
              Text(
                'Service Title',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (String val){
                  serPro.setServiceTitle(val);
                  // print(val);
                },
                decoration: InputDecoration(
                  hintText: 'Enter service title',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Service Details
              Text(
                'Service Details',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (String val){
                  serPro.setServiceDetails(val);
                },
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter service details',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),


              /// Service Image
              Text(
                'Service Image',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),

              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  final image = await ImagePickerHelper.pickFromGallery();
                  if (image != null && context.mounted) {
                    context.read<AddServiceProvider>().setImage(image);
                  }
                },
                child: Consumer<AddServiceProvider>(
                  builder: (context, provider, _) {
                    return Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                        image: provider.selectedImage != null
                            ? DecorationImage(
                                image: FileImage(provider.selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: provider.selectedImage == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.photo_library_outlined, size: 40),
                                SizedBox(height: 8),
                                Text('Tap to select image'),
                              ],
                            )
                          : Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.black54,
                                    child: Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),



              /// Rank
              Text(
                'Rank',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (String val){
                  serPro.setServiceRank(val);
                  print(val);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter rank (e.g. 1)',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

               

              /// Submit Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: () async {
                    final success = await serPro.serviceManageForm();

                    if (success) { 
                      context.read<AddServiceProvider>().resetForm();
 
                      context.read<AddServiceProvider>().loadServiceList();
 
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServiceListDesign(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit Service',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),







            ],
          ),
        ),
      );
    
      },
    );
  
  }
}
