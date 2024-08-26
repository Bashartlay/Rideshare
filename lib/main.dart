import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideshare/view/screen/auth/login.dart';
import 'package:rideshare/view/screen/auth/signup.dart';
import 'package:rideshare/view/screen/auth/welcome.dart';
import 'package:rideshare/view/screen/home/cycle_details_screen.dart';
import 'package:rideshare/view/screen/home/select_transport.dart';
import 'package:rideshare/view/screen/onboarding/onboarding.dart';
import 'package:rideshare/view/screen/home/avaiable_cycle.dart';
import 'package:rideshare/view/screen/home/profile_page.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final token = storage.read<String>('token');

    return GetMaterialApp(
            debugShowCheckedModeBanner: false, 
      title: 'RideShare App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: token != null ? '/welcome' : '/', 
      getPages: [
        GetPage(name: '/', page: () => Onboarding()), 
        GetPage(name: '/signup', page: () => Signup()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/selectTransport', page: () => SelectTransport()),
GetPage(
  name: '/selectAvaiableCar', 
  page: () => SelectAvaiableCar(
    category: 'defaultCategory', 
    fromHubId: 1,
    toHubId: 2,   
  ),
),
        GetPage(name: '/cycleDetails', page: () => CycleDetails(bicycleId: 0, fromHubId: 0, toHubId: 0)), 
        GetPage(name: '/profile', page: () => Profile()), 
      ],
    );
  }
}
