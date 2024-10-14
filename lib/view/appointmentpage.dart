import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_journey_management/constants/colors.dart';

import 'upcoming.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back_ios_rounded,
          //     color: AppColors.textcolor,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context); // Navigates back to the previous screen
          //   },
          // ),
          title: Text(
            'My Bookings',
            style: TextStyle(
              color: AppColors.textcolor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true, // Makes the TabBar scrollable
            unselectedLabelColor:AppColors.grey1,
            labelColor: AppColors.textcolor2,
            indicator: const BoxDecoration(), // Removes the indicator
            splashFactory: NoSplash.splashFactory, // Removes splash effect
            tabs: <Widget>[
              Container(
                width: 90.w,
                child: const Tab(text: 'Upcoming'),
              ),
              Container(
                width: 90.w,
                child: const Tab(text: 'Completed'),
              ),
              Container(
                width: 90.w,
                child: const Tab(text: 'Canceled'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UpComing(),
            Center(child: Text('Completed Page Content')),
            Center(child: Text('Canceled Page Content')),
          ],
        ),
      ),
    );
  }
}
