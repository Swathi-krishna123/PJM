import 'package:flutter/material.dart';
import '../../constants/colors.dart'; // Ensure AppColors is defined in your constants/colors.dart file.

class ButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final String name;

  const ButtonCustom({
    required this.name,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [AppColors.bluegradient1, AppColors.bluegradient2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style:  TextStyle(
            color:AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
