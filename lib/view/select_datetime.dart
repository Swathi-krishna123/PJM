import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/datecontroller.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utilities/custom_widgets/headings.dart';
import 'homepage.dart';

class SelectDateAndTime extends StatelessWidget {
  const SelectDateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final DateController dateController = Get.put(DateController());

    // Sample time slots
    final List<String> timeSlots = [
      "09:00 AM",
      "09:30 AM",
      "10:00 AM",
      "10:30 AM",
      "11:00 AM",
      "11:30 AM",
      "12:00 PM",
      "3:00 PM",
      "6:00 PM",
      "7:00 PM",
      "8:00 PM",
      "10:00 PM",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20.sp,
          ),
          onPressed: () {
            Get.back(); // Using GetX for navigation
          },
        ),
        title: Text(
          'Select Date & Time',
          style: TextStyle(
            color: AppColors.textcolor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              ContainerDr(
                  height: 90.h), // Assuming ContainerDr is a custom widget
              SizedBox(height: 10.h),
              heading('Select Date'),
              SizedBox(height: 10.h),

              // Calendar inside a container
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Obx(() => TableCalendar(
                      rowHeight: 35.h,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: dateController.focusedDay.value,
                      selectedDayPredicate: (day) =>
                          isSameDay(dateController.selectedDay.value, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        // Use DateController to update selected day
                        dateController.updateSelectedDay(
                            selectedDay, focusedDay);
                      },
                      onFormatChanged: (format) {
                        dateController.calendarFormat.value = format;
                      },
                      onPageChanged: (focusedDay) {
                        dateController.focusedDay.value = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        selectedTextStyle: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.blue50,
                          shape: BoxShape.rectangle,
                        ),
                        outsideDaysVisible: true,
                        outsideTextStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          rightChevronIcon: Icon(Icons.arrow_right),
                          leftChevronVisible: false,
                          headerMargin: EdgeInsets.only(left: 5.w),
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp)),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A7683),
                            fontSize: 12),
                        weekendStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A7683),
                            fontSize: 12.sp),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          // Highlight available dates using the controller method
                          if (dateController.isAvailable(day)) {
                            return Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xffCDE1FF), // Highlight available date
                                  borderRadius: BorderRadius.circular(
                                      5.r), // Rounded corners
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: TextStyle(
                                      color: AppColors
                                          .blue, // Text color for available date
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return null; // Default styling for other dates
                        },
                      ),
                    )),
              ),
              // Time slot selection
              SizedBox(height: 15.h),
              heading('Select Hour'),
              SizedBox(height: 15.h),

              // Grid for time slots
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return Obx(() => ElevatedButton(
                        onPressed: () {
                          dateController
                              .updateSelectedTimeSlot(timeSlots[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              dateController.selectedTimeSlot.value ==
                                      timeSlots[index]
                                  ? AppColors.blue
                                  : Colors.white,
                          foregroundColor:
                              dateController.selectedTimeSlot.value ==
                                      timeSlots[index]
                                  ? Colors.white
                                  : AppColors.grey1,
                          side: BorderSide(color: AppColors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          timeSlots[index],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: dateController.selectedTimeSlot.value ==
                                    timeSlots[index]
                                ? Colors.white
                                : const Color(0xff6B7280),
                          ),
                        ),
                      ));
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ScheduleAppointment();
                      },
                    );
                  },
                  child: ButtonCustom(
                      name: 'Schedule Appointment',
                      height: 48.h,
                      width: 310.w)),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleAppointment extends StatelessWidget {
  const ScheduleAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Container(
          color: const Color(0xff0B181F).withOpacity(0.1),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container(
              width: 341.w,
              height: 400.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.all(10.r),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      'assets/appointmentpageimages/Image (1).png',
                      height: 131.h,
                      width: 131.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    heading('Appointment Confirmed!'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Your appointment with Dr. Merin Jacob is',
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280)),
                    ),
                    Text(
                      'confirmed for June 25, 2024, at 10:00 am',
                      style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                        onTap: () => Get.toNamed('/CustomBottomNavigationBar'),
                        child: ButtonCustom(
                            name: 'Done', height: 48.h, width: 245.w)),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Edit your appointment ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
