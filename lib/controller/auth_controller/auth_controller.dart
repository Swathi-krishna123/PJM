// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   // Getter method
//   get formkey => _formKey;

//   // State variables
//   RxBool isPasswordVisible = false.obs;
//   RxBool isLoading = false.obs;

//   // Toggle password visibility
//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   //////////// Handle login logic//////////////////////////////
//   Future<void> login() async {
//     if (_formKey.currentState!.validate()) {
//       isLoading.value = true;

//       try {
//         // Simulate a network call
//         await Future.delayed(const Duration(seconds: 2));
//         Get.offNamed('/CustomBottomNavigationBar');
//       } catch (e) {
//         Get.snackbar('Error', e.toString(),
//             snackPosition: SnackPosition.BOTTOM);
//       } finally {
//         isLoading.value = false;
//       }
//     }
//   }
// }
