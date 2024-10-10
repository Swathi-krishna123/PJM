import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_journey_management/utilities/custom_widgets/headings.dart';

import '../constants/colors.dart';

class MyConsultations extends StatelessWidget {
  const MyConsultations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.textcolor,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous screen
            },
          ),
          title: Text(
            'My Consultations',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 326,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000), // Shadow color
                        offset:
                            Offset(0, 10), // Horizontal and vertical offsets
                        blurRadius: 15, // Blur radius
                        spreadRadius: -3, // Spread radius
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffFFD5C4), // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        color: const Color(0xffFFD5C4),
                        child: const Center(
                          child: Text('Token no: 25'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'Booking ID: XXXXXX',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clockicon.svg',
                              color: const Color(
                                0xff363636,
                              ),
                              height: 16.67,
                              width: 16.67,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Sep, Wed 20 . 10:00 am - 10:30 am',
                              style: TextStyle(
                                  color: Color(0xff515151),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/homepageimages/Ellipse 190.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Merin Jacob',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Psychologists | Apollo hospital',
                                  style: TextStyle(
                                      color: Color(0xff7D8A95),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              heading('Map Towards Hospital'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/locationicon.svg',
                    color: AppColors.blue,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '154/11, Bannerghatta Road Opp, Bangalore - 560 076',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff283343),
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 326,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue),
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                        child: Text(
                      'I’m at Hospital',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      'Report To Doctor/Nurse',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.blue),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              heading('Need Help?'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'If you can’t make it, please cancel or reschedule.',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff283343),
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/reschedule.svg',
                    height: 24,
                    width: 24,
                    color: Color(0xff200E32),
                  ),
                  SizedBox(width: 10,),
                  Text('Reschedule',style: TextStyle(color: Color(0xff200E32),fontSize: 16,fontWeight: FontWeight.w600),)
                ],
              ),
              SizedBox(height: 15,),
               Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    height: 24,
                    width: 24,
                    color: Color(0xff200E32),
                  ),
                  SizedBox(width: 10,),
                  Text('Cancel',style: TextStyle(color: Color(0xff200E32),fontSize: 16,fontWeight: FontWeight.w600),)
                ],
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
