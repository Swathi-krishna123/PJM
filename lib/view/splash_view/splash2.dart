import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import 'dart:math' as math;

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff244C81),
      body: LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final diagonalLength = math.sqrt(width * width + height * height);
        final stripeWidth = width * 0.33; // Adjust this value to change stripe width

        return Stack(
          children: [
            Container(
              color: const Color(0xFF1E3A8A), // Dark blue background
            ),
            Positioned(
              left: -diagonalLength / 2 + width / 2,
              top: -diagonalLength / 2 + height / 2,
              child: Transform.rotate(
                angle: math.pi / 3, // 45 degrees in radians
                child: Container(
                  width: diagonalLength,
                  height: stripeWidth,
                  color: const Color(0xFFBFDBFE), // Light blue stripe
                ),
              ),
            ),
          ],
        );
      },
    )
    );
  }
}
