import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool registerpassobscureText = true;
  bool registerconfirmpassobscureText = true;
  bool isChecked = false;
  bool isCheckboxError = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              top: 55,
              child: Column(
                children: [
                  SizedBox(
                    width: 40.w,
                    height:40.h,
                    child: SvgPicture.asset('assets/icons/ghologo.svg'),
                  ),
                  SizedBox(height: 10.h,),
                   Text(
                    'Sign Up',
                    style: TextStyle(
                        color:AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Already have an account    ",
                        style: TextStyle(color:AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/LoginPage');
                        },
                        child:  Text(
                          "Sign In",
                          style: TextStyle(
                              color: AppColors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.white,
                              fontWeight: FontWeight.bold),
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
              bottom: size.height / 15,
              child: Container(
                width: 327.w,
                height: 511.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow:  [
                    BoxShadow(
                      color:AppColors.shadow,
                      blurRadius: 12.r,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 20,
                      top: size.width / 15,
                      right: size.width / 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CommonWidgets().textFormField(
                          hinttext: 'Enter first  name',
                          txtController: lastnamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is Required';
                            }

                            return null;
                          },
                        ),
                         SizedBox(height: 20.h),
                        CommonWidgets().textFormField(
                          hinttext: 'Enter your last name',
                          txtController: firstnamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is Required';
                            }

                            return null;
                          },
                        ),
                         SizedBox(height: 20.h),
                        phonenumberTxtfield(),
                         SizedBox(
                          height: 20.h,
                        ),
                        CommonWidgets().textFormField(
                          hinttext: 'Enter your email',
                          txtController: emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is Required';
                            } // Email validation regex
                            String emailPattern =
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                            RegExp regex = RegExp(emailPattern);
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            }

                            return null;
                          },
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                color:AppColors.blue7, width: 1.w),
                          ),
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: registerpassobscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is Required';
                              }
                              return null;
                            },
                            cursorColor: AppColors.blue50,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    registerpassobscureText =
                                        !registerpassobscureText;
                                  });
                                },
                                icon: Icon(
                                  registerpassobscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:AppColors.grey,
                                ),
                              ),
                              hintText: 'Enter password',
                              enabledBorder: InputBorder.none,
                              errorBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85.r)),
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85.r)),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding:  EdgeInsets.all(12.w),
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                color:AppColors.blue7, width: 1.w),
                          ),
                          child: TextFormField(
                            controller: confirmcontroller,
                            obscureText: registerconfirmpassobscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is Required';
                              }
                              if (value != passwordcontroller.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            cursorColor: AppColors.blue50,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    registerconfirmpassobscureText =
                                        !registerconfirmpassobscureText;
                                  });
                                },
                                icon: Icon(
                                  registerconfirmpassobscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:AppColors.grey,
                                ),
                              ),
                              hintText: 'Confirm password',
                              enabledBorder: InputBorder.none,
                              errorBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85.r)),
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85.r)),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding:  EdgeInsets.all(12.w),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: AppColors.blue,
                              checkColor: AppColors.white,
                              side: BorderSide(
                                color: AppColors.blue,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            Text(
                              "I agree to the ",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Terms of Service ",
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "& ",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp),
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                        if (isCheckboxError)
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Please agree to the terms of service & privacy policy to continue",
                                style: TextStyle(
                                  color: AppColors.error,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                         SizedBox(
                          height: 10.h,
                        ),
                        // register button
                        GestureDetector(
                          onTap: () async {
                            try {
                              if (_formKey.currentState!.validate() &&
                                  isChecked) {
                                setState(() {
                                  isLoading = true;
                                });

                                // Simulate a network call with a delay
                                await Future.delayed(
                                    const Duration(seconds: 2));

                                setState(() {
                                  isLoading = false;
                                });

                                Get.offNamed('/OtpConfirmation');
                              } else {
                                if (!isChecked) {
                                  setState(() {
                                    isCheckboxError = true;
                                  });
                                }
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
                              : ButtonCustom(name: 'Sign Up', height: 48, width: 279)
                        ),
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

  Widget phonenumberTxtfield() {
    return IntlPhoneField(
      controller: phonecontroller,
      initialCountryCode: 'IN',
      flagsButtonPadding: const EdgeInsets.all(5),
      pickerDialogStyle: PickerDialogStyle(
        width: 300,
        countryCodeStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration:  InputDecoration(
        hintText: 'Phone Number',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.blue7)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(85.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(85.r)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.blue7)),
        contentPadding: EdgeInsets.all(12.w),
      ),
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}

class CommonWidgets {
  Container textFormField({
    TextEditingController? txtController,
    String? hinttext,
    Widget? prefixIcon,
    TextInputType keyboardtype = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color:AppColors.blue7, width: 1),
      ),
      child: TextFormField(
        controller: txtController,
        keyboardType: keyboardtype,
        cursorColor: AppColors.blue50,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: InputBorder.none,
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85.r)),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85.r)),
          ),
          focusedBorder: InputBorder.none,
          contentPadding:  EdgeInsets.all(12.w),
        ),
      ),
    );
  }
}

