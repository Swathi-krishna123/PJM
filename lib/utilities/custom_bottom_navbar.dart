// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:patient_journey_management/constants/colors.dart';
// import 'package:patient_journey_management/view/appointmentpage.dart';
// import 'package:patient_journey_management/view/homepage.dart';
// import 'package:patient_journey_management/view/notificationpage.dart';
// import 'package:patient_journey_management/view/profilepage.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _currentindex = 0;
//   List<Widget> pages = [
//     const Homepage(),
//     const Notificationpage(),
//     const Appointmentpage(),
//     const Profilepage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_currentindex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.blue,
//         selectedIconTheme:IconThemeData(color:AppColors.blue ),
//         unselectedItemColor: Colors.grey,
//         unselectedIconTheme:IconThemeData(color: AppColors.grey1) ,

//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(

//             icon: SvgPicture.asset(
//               'assets/icons/homepageicon.svg',// home page icon
//               height: 20,
//               color: _currentindex==0?AppColors.blue:AppColors.grey1 ,
//             ),
//             label: '', // No label text
//             // backgroundColor: _currentindex==0?Colors.blue:Colors.grey
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/icons/notificationpageicon.svg',// notification page icon
//               height: 20,
//                color: _currentindex==1?AppColors.blue:AppColors.grey1 ,
//             ),
//             label: '', // No label text
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/icons/appointmentpageicon.svg', // appointment page icon
//               height: 20,
//                color: _currentindex==2?AppColors.blue:AppColors.grey1 ,
//             ),
//             label: '', // No label text
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(

//               'assets/icons/profilepageicon.svg', // profile page icon
//               height: 20,
//                color: _currentindex==3?AppColors.blue:AppColors.grey1 ,
//             ),
//             label: '', // No label text
//           ),
//         ],
//         currentIndex: _currentindex,
//         onTap: (int index) {
//           setState(() {
//             _currentindex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:patient_journey_management/constants/colors.dart';
// import 'package:patient_journey_management/view/appointmentpage.dart';
// import 'package:patient_journey_management/view/homepage.dart';
// import 'package:patient_journey_management/view/notificationpage.dart';
// import 'package:patient_journey_management/view/profilepage.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _currentindex = 0;
//   List<Widget> pages = [
//     const Homepage(),
//     const Notificationpage(),
//     const Appointmentpage(),
//     const Profilepage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_currentindex],
//       bottomNavigationBar: Container(
//         height: 70,
//         color: Colors.white, // Bottom Navigation Bar Background
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             for (int i = 0; i < pages.length; i++)
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _currentindex = i;
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     // Circle Avatar behind the selected icon
//                     if (_currentindex == i)
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: AppColors.iconbackground, // Change the color as needed
//                         ),
//                       ),
//                     // Icon
//                     SvgPicture.asset(
//                       getIconPath(i),
//                       height: 20,
//                       color: _currentindex == i ? AppColors.blue : AppColors.grey1,
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   String getIconPath(int index) {
//     switch (index) {
//       case 0:
//         return 'assets/icons/homepageicon.svg'; // home page icon
//       case 1:
//         return 'assets/icons/notificationpageicon.svg'; // notification page icon
//       case 2:
//         return 'assets/icons/appointmentpageicon.svg'; // appointment page icon
//       case 3:
//         return 'assets/icons/profilepageicon.svg'; // profile page icon
//       default:
//         return '';
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/view/appointmentpage.dart';
import 'package:patient_journey_management/view/homepage.dart';
import 'package:patient_journey_management/view/notificationpage.dart';
import 'package:patient_journey_management/view/profilepage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const Notificationpage(),
     const AppointmentPage(),
    const Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentindex],
      bottomNavigationBar: Container(
        height: 70.h,
        color: Colors.white, // Bottom Navigation Bar Background
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < pages.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentindex = i;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle background behind the selected icon
                    if (_currentindex == i)
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors
                              .iconbackground, // Change the color as needed
                        ),
                      ),
                    // Icon
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          getIconPath(i),
                          height: 20.h,
                          color: _currentindex == i
                              ? AppColors.blue
                              : AppColors.grey1,
                        ),
                        // Optional: Add text labels below icons if needed
                        // Text(getLabel(i), style: TextStyle(color: _currentindex == i ? AppColors.blue : AppColors.grey1)),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String getIconPath(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/homepageicon.svg'; // home page icon
      case 1:
        return 'assets/icons/notificationpageicon.svg'; // notification page icon
      case 2:
        return 'assets/icons/appointmentpageicon.svg'; // appointment page icon
      case 3:
        return 'assets/icons/profilepageicon.svg'; // profile page icon
      default:
        return '';
    }
  }

  // Optional: If you want to add labels below icons
  String getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Notifications';
      case 2:
        return 'Appointments';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
