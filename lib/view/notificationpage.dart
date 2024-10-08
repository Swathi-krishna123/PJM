import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: AppColors.textcolor,
        //     size: 20,
        //   ),
        // ),
        title: Text(
          'Notifications',
          style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'TODAY',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                  ),
                  Spacer(),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                        color: Color(0xff1C2A3A),
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(radius: 35,
                backgroundColor: const Color(0xffDEF7E5),child: Center(child: SvgPicture.asset('assets/icons/sucessappointmenticon.svg')),
              ),
              title: const Row(
                children: [
                  Text(
                    'Appointment Success',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    '1h',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: const Text(
                'You have successfully booked your appointment with Dr. Emily Walker.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280)),
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(radius: 35,
                backgroundColor: const Color(0xffFDE8E8),child: Center(child: SvgPicture.asset('assets/icons/cancelappointmenticon.svg')),
              ),
              title: const Row(
                children: [
                  Text(
                    'Appointment Cancelled',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    '2h',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: const Text(
                'You have successfully cancelled your appointment with Dr. David Patel.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280)),
              ),
            ),ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(radius: 35,
                backgroundColor: const Color(0xffF3F4F6),child: Center(child: SvgPicture.asset('assets/icons/schedulechangeicon.svg')),
              ),
              title: const Row(
                children: [
                  Text(
                    'Scheduled Changed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    '8h',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: const Text(
                'You have successfully changes your appointment with Dr. Jesica Turner.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  children: [
                    Text(
                      'YESTERDAY',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280)),
                    ),
                    Spacer(),
                    Text(
                      'Mark all as read',
                      style: TextStyle(
                          color: Color(0xff1C2A3A),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
            ),
             ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(radius: 35,
                backgroundColor: const Color(0xffDEF7E5),child: Center(child: SvgPicture.asset('assets/icons/sucessappointmenticon.svg')),
              ),
              title: const Row(
                children: [
                  Text(
                    'Appointment Success',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    '1d',
                    style: TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              subtitle: const Text(
                'You have successfully booked your appointment with Dr. David Patel.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280)),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
