import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:patient_journey_management/constants/colors.dart';

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
              top: 45,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 8,
                    height: size.height / 8,
                    child: SvgPicture.asset('assets/icons/ghologo.svg'),
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account    ",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/LoginPage'); // Use standard navigation
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
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
                  color: Colors.white,
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
                  padding: EdgeInsets.only(
                      left: size.width / 20,
                      top: size.width / 15,
                      right: size.width / 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CommonWidgets().textFormField(
                          hinttext: 'Enter your last name',
                          txtController: lastnamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is Required';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CommonWidgets().textFormField(
                          hinttext: 'Enter your first name',
                          txtController: firstnamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is Required';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        phonenumberTxtfield(),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: const Color(0xB2B0C7E6), width: 1),
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
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Enter password',
                              enabledBorder: InputBorder.none,
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: const Color(0xB2B0C7E6), width: 1),
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
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Confirm password',
                              enabledBorder: InputBorder.none,
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(12),
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
                            padding: EdgeInsets.only(left: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Please agree to the terms of service & privacy policy to continue",
                                style: TextStyle(
                                  color: AppColors.error,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        // register button
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate() &&
                                isChecked) {
                              setState(() {
                                isLoading = true;
                              });

                              // Simulate a network call with a delay
                              await Future.delayed(const Duration(seconds: 2));

                              setState(() {
                                isLoading = false;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Registration Successful'),
                              ));

                              Get.toNamed('/LoginPage');
                            } else {
                              if (!isChecked) {
                                setState(() {
                                  isCheckboxError = true;
                                });
                              }
                            }
                          },
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.blue,
                                  ),
                                )
                              : Container(
                                  width: 279.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF065FD5),
                                        Color(0xFF064DAB),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
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
      decoration: const InputDecoration(
        hintText: 'Phone Number',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xB2B0C7E6))),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(85)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(85)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xB2B0C7E6))),
        contentPadding: EdgeInsets.all(12),
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
        border: Border.all(color: const Color(0xB2B0C7E6), width: 1),
      ),
      child: TextFormField(
        controller: txtController,
        keyboardType: keyboardtype,
        cursorColor: AppColors.blue50,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: InputBorder.none,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
