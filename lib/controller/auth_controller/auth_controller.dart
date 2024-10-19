import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // State variables
  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;
  // RxBool isCheckboxError = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // is checked ///////
  void isCheckedvisibility() {
    isChecked.value = !isChecked.value;
  }

  //////////// Handle login logic//////////////////////////////
  Future<void> login() async {
    try {
      isLoading.value = true;

      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      Get.offNamed('/CustomBottomNavigationBar');
    } catch (e) {
      isLoading.value = false;

      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
  /////////////////////////Handle Register Logic //////////////////////

  Future<void> register() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));
      Get.toNamed('/OtpConfirmation');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
