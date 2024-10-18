import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to Splash2
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Splash2()); // Navigate after the delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/splash_images/Background.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}