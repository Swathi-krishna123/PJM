import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_bottom_navbar.dart';
import 'package:patient_journey_management/view/auth_view/otp_verification.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';
import 'package:patient_journey_management/view/my_consultations/appointment_status.dart';
import 'package:patient_journey_management/view/book_an_appointment/appointment_type.dart';
import 'package:patient_journey_management/view/my_bookings/appointmentpage.dart';
import 'package:patient_journey_management/view/my_consultations/dr_info.dart';
import 'package:patient_journey_management/view/home_page/homepage.dart';
import 'package:patient_journey_management/view/auth_view/login_page.dart';
import 'package:patient_journey_management/view/my_consultations/myconsultations.dart';
import 'package:patient_journey_management/view/notifications/notificationpage.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_datetime.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_hospital.dart';

import 'package:patient_journey_management/view/splash_view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Patient Journey Management',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.blue50,
            cursorColor: AppColors.blue,
            selectionHandleColor: AppColors.blue,
          ),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
              color: AppColors.background,
              surfaceTintColor: AppColors.background),
          textTheme: GoogleFonts.latoTextTheme(),
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
          GetPage(
              name: '/AppointmentPage', page: () => const AppointmentPage()),
          GetPage(
              name: '/AppointmentType', page: () => const AppointmentType()),
          GetPage(name: '/AppointmentType', page: () => const SelectHospital()),
          GetPage(
              name: '/SelectDateAndTime',
              page: () => const SelectDateAndTime()),
          GetPage(
              name: '/CustomBottomNavigationBar',
              page: () => const CustomBottomNavigationBar()),
          GetPage(
              name: '/MyConsultations', page: () => const MyConsultations()),
          GetPage(name: '/DrInfo', page: () => const DrInfo()),
          GetPage(
              name: '/AppointmentStatus',
              page: () => const AppointmentStatus()),
          GetPage(
              name: '/LoginPage',
              page: () =>  LoginPage()),
          GetPage(
              name: '/RegisterPage',
              page: () =>  RegisterPage()),
          GetPage(
              name: '/OtpConfirmation',
              page: () =>  OtpConfirmation()),
        ],
      ),
    );
  }
}
