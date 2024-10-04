import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_journey_management/view/homepage.dart';

import 'package:patient_journey_management/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Journey Management',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black, // Apply default text color
                displayColor: Colors.black, // Apply default heading color
              ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Splash1()),
        GetPage(name: '/homepage', page: () => const Homepage()),
      ],
    );
  }
}