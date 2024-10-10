import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_bottom_navbar.dart';
import 'package:patient_journey_management/view/appointment_type.dart';
import 'package:patient_journey_management/view/appointmentpage.dart';
import 'package:patient_journey_management/view/homepage.dart';
import 'package:patient_journey_management/view/myconsultations.dart';
import 'package:patient_journey_management/view/notificationpage.dart';
import 'package:patient_journey_management/view/select_datetime.dart';
import 'package:patient_journey_management/view/select_hospital.dart';

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
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.blue50,
            cursorColor: AppColors.blue,
            selectionHandleColor: AppColors.blue),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(color: AppColors.background),
        textTheme: GoogleFonts.latoTextTheme(
          
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Splash1()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(
            name: '/customBottomNavBar',
            page: () => const CustomBottomNavigationBar()),
        GetPage(
            name: '/Notificationpage', page: () => const Notificationpage()),
        GetPage(name: '/AppointmentPage', page: () => const AppointmentPage()),
        GetPage(name: '/AppointmentType', page: () => const AppointmentType()),
        GetPage(name: '/AppointmentType', page: () => const SelectHospital()),
        GetPage(name: '/SelectDateAndTime', page: () => const SelectDateAndTime()),
        GetPage(name: '/CustomBottomNavigationBar', page: () => const CustomBottomNavigationBar()),
        GetPage(name: '/MyConsultations', page: () => const MyConsultations()),
      ],
    );
  }
}
