import 'package:flutter/material.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Appointmentpage extends StatelessWidget {
  const Appointmentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body:const Center(child: Text('Appointment Page'),),
    );
  }
}