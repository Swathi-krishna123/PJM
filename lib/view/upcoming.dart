import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Container(
                // Return the Container

                width: 342.w,
                height: 247.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000), // First shadow color
                      offset: Offset(0, 4), // Shadow position
                      blurRadius: 6.r, // Blur radius
                      spreadRadius: 0.r, // Spread radius
                    ),
                    BoxShadow(
                      color: Color(0x1A000000), // Second shadow color
                      offset: Offset(0, 10), // Shadow position
                      blurRadius: 15.r, // Blur radius
                      spreadRadius: -3.r, // Negative spread radius
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'May 22, 2024 - 10.00 AM',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1F2A37)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                        color: Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 109.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12.r),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/appointmentpageimages/Image.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. James Robinson',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff200E32)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Orthopedic Surgery',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4B5563)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/locationicon.svg',
                                      color: const Color(0xff4B5563),
                                      fit: BoxFit.cover,
                                      height: 14.h,
                                      width: 14.w,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      'Elite Ortho Clinic, USA',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Color(0xff4B5563)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                        color: Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 37.h,
                            width: 147.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.blue),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: AppColors.blue),
                            )),
                          ),
                          Container(
                            height: 37.h,
                            width: 147.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.blue),
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                                child: Text(
                              'Reschedule',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  color: Colors.white),
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
