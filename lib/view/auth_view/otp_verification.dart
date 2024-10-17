import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:pinput/pinput.dart';

class OtpConfirmation extends StatefulWidget {
  const OtpConfirmation({super.key});

  @override
  _OtpConfirmationState createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isChecked = false;
  String email = ''; // Assign the email from where you need

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 56.h,
      height: 60.w,
      textStyle: const TextStyle(color: Colors.black, fontSize: 18),
      decoration: BoxDecoration(
        color: AppColors.blue7.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
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
            Positioned(
              left: size.width / 25,
              right: size.width / 25,
              top: 25,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 8,
                    height: size.height / 8,
                    child: SvgPicture.asset('assets/images/ghologo.svg'),
                  ),
                  Text(
                    'Verify\nEmail Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width / 11,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "OTP has been sent to $email",
                    style: TextStyle(
                        color: AppColors.white, fontSize: size.width / 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height / 2.6,
              left: 25,
              right: 25,
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x1A000000),
                      blurRadius: 12.r,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 20,
                      top: size.width / 15,
                      right: size.width / 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Pinput(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              } else if (value.length != 6) {
                                return 'Enter a valid OTP of 6 digits';
                              } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                                return 'OTP should contain only numbers';
                              }
                              return null;
                            },
                            length: 6,
                            defaultPinTheme: defaultPinTheme.copyWith(
                                height: 46.h,
                                width: 46.w,
                                textStyle: TextStyle(
                                    color: AppColors.blue6,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.blue7,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r))),
                            focusedPinTheme: defaultPinTheme.copyWith(
                                height: 46.h,
                                width: 45.w,
                                textStyle: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                        color: AppColors.blue,
                                        border:
                                            Border.all(color: AppColors.blue7),
                                        borderRadius:
                                            BorderRadius.circular(4.r))),
                            onCompleted: (value) {
                              otpController.text = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: AppColors.blue,
                              checkColor:AppColors.white,
                              side: BorderSide(
                                color: AppColors.blue7,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            Text("Didn't get OTP Code?",
                                style: TextStyle(color: AppColors.grey10)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: () async {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  // Simulate a network call with a delay
                                  await Future.delayed(
                                      const Duration(seconds: 2));

                                  setState(() {
                                    isLoading = false;
                                  });

                                  Get.offNamed('/LoginPage');
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
                                : isChecked
                                    ? GestureDetector(
                                        onTap: () {
                                          // Add your resend OTP logic here
                                        },
                                        child: Container(
                                          width: 279.w,
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.blue),
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Resend',
                                              style: TextStyle(
                                                color: AppColors.blue,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    :  ButtonCustom(
                                        name: 'Verify',
                                        height: 48.h,
                                        width: 279.w)),
                         SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> userOTPConfirmation(
      String email, String otp, BuildContext context) async {
    // Add your OTP confirmation logic here
    // Example: await YourAuthService.confirmOTP(email, otp);
  }
}
