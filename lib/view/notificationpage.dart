import 'package:flutter/material.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text('Notification'),),
    );
  }
}