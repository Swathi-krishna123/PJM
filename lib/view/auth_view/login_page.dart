import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Password visibility state
  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Background containers
            Container(
              width: size.width,
              height: size.height,
              color: AppColors.blue,
            ),
            Positioned(
              top: size.height / 2,
              child: Container(
                width: size.width,
                height: size.height / 1.5,
                color: AppColors.background,
              ),
            ),
            // Login elements
            Positioned(
              left: size.width / 25,
              right: size.width / 25,
              top: 45,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 8,
                    height: size.height / 8,
                    child: SvgPicture.asset('assets/icons/ghologo.svg'),
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: AppColors.white3,
                      fontWeight: FontWeight.w700,
                      fontSize: 36.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account    ",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigate to sign-up page
                          Get.toNamed('/RegisterPage');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height / 3,
              left: 25,
              right: 25,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 12,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    children: [
                      // Email input
                      loginTextform(
                        textcontroller: emailController,

                        hinttext: 'Enter Your Email or Phone number',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}")
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      // Password input
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border:
                              Border.all(color: AppColors.blue7, width: 1.w),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          cursorColor: AppColors.blue,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.grey,
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Enter password',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(12.w),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      // Forget password link
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/Forgetpasswordemail');
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Forget Password?',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.sp),
                      // Login button
                      GestureDetector(
                        onTap: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              // Simulate a network call with a delay
                              await Future.delayed(const Duration(seconds: 2));

                              setState(() {
                                isLoading = false;
                              });

                              Get.offNamed('/CustomBottomNavigationBar');
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$e'.toString())));
                          }
                        },
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.blue,
                                ),
                              )
                            : ButtonCustom(name: 'Login', height: 48.h, width: 279.w)
                      ),
                      SizedBox(height: 20.h),
                      // Social sign-up options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Or sign up using',
                            style: TextStyle(
                                color: AppColors.grey10,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SvgPicture.asset('assets/icons/googleicon.svg'),
                          SvgPicture.asset('assets/icons/appleicon.svg'),
                          SvgPicture.asset('assets/icons/metaicon.svg'),
                          SvgPicture.asset('assets/icons/windowsicon.svg'),
                        ],
                      ),
                       SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable text field container
  Container loginTextform({
    TextEditingController? textcontroller,
    String? hinttext,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blue7, width: 1.w),
      ),
      child: TextFormField(
        controller: textcontroller,
        validator: validator,
        cursorColor: AppColors.blue,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 14),
          enabledBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85.r)),
          ),
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(12.w),
        ),
      ),
    );
  }
}
