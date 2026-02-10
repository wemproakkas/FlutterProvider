import 'package:flutter/material.dart';
import 'package:helpabode_provider/screens/authentications/login/login.dart';
import 'package:helpabode_provider/screens/dashboard/provider/dashboard_provider.dart';
import 'package:helpabode_provider/screens/dashboard/slider.dart';
import 'package:helpabode_provider/screens/services/provider/service_provider.dart';
import 'package:helpabode_provider/screens/services/service_add_screen.dart';
import 'package:helpabode_provider/screens/services/services_screen.dart'; 
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class ProviderAppDashboardScreen extends StatelessWidget {
  const ProviderAppDashboardScreen({super.key});

  // Logout function
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken'); // remove token
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ProviderLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) { 
    WidgetsBinding.instance.addPostFrameCallback((_) {

      final ProfileProvider provider =  context.read<ProfileProvider>(); 
        provider.loadProfile();
        provider.loadDashboardOverview();
        provider.loadDashboardSlider();
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B8874),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, pfPro, child) {
          if (pfPro.profileData.fullName == null ||
              pfPro.profileData.fullName!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
    
          return RefreshIndicator(
            onRefresh: pfPro.pullToRefreashData,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Profile Section ---
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/akkas49.jpg'), 
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pfPro.profileData.fullName!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            pfPro.profileData.email ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            pfPro.profileData.phone ?? '',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),

                      
                    ],
                  ),
                  const SizedBox(height: 25),

                  const DashboardSlider(),

                  const SizedBox(height: 25),
                
                  // --- Stats Cards ---
                  GridView.count(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 15, 
                    mainAxisSpacing: 15, 
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(),
                 
                    children: [
                       if(pfPro.overviewData.dashboardData!=null)
                      ...List.generate(pfPro.overviewData.dashboardData!.length, (index){
                        return _buildStatCard('${pfPro.overviewData.dashboardData![index].title}', '${pfPro.overviewData.dashboardData![index].value}', const Color.fromARGB(255, 32, 134, 98));
                      }), 
                
                    ],
                  ),
                  const SizedBox(height: 25),
                
                 
                 Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddServiceScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 130, 
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 44, 168, 118)),
                          color: const Color.fromARGB(255, 36, 146, 95),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("Add Service", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)
                        ),
                      ), 
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        context.read<AddServiceProvider>().loadServiceList();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ServiceListDesign(),
                          ),
                        );
                      },

                      child: Container(
                        width: 130, 
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 245, 78, 59)),
                          color: const Color.fromARGB(255, 240, 64, 28),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("Service List", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)
                        ),
                      ), 
                    ),
                  ],
                 ),


                  // --- Recent Bookings Header ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Bookings',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Color(0xFF12694C)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                
                  // --- Recent Bookings List (Mock) ---
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _buildBookingItem();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    
     
    );
  }

  // --- Widgets for Stats Card ---
  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16), 
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withAlpha(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.bar_chart, color: color, size: 20),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widgets for Recent Booking Item ---
  Widget _buildBookingItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withAlpha(20)),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.cleaning_services_outlined,
                color: Color(0xFF12694C)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Full Home Cleaning',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(
                  'Scheduled: Today, 2:30 PM',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '৳ 1200',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF12694C)),
              ),
              SizedBox(height: 4),
              Text(
                'Pending',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 11,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
