import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';

import '../utilities/custom_widgets/headings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/homepageimages/second opinion from doctor.png',
        'text': 'Book an ',
        'text2': 'Appointment ',
        'route':'/AppointmentType'
      },
      {
        'image': 'assets/homepageimages/telemedicine.png',
        'text': 'Tele -  ',
        'text2': 'medicine  ',
        'route':'/AppointmentType'
      },
    ];
    final List<Map<String, dynamic>> items2 = [
      {
        'image': 'assets/homepageimages/Frame 1000001455.png',
        'text': 'Second',
        'text2': 'Opinion',
      },
      {
        'image': 'assets/homepageimages/Frame 1000001456.png',
        'text': 'Peer',
        'text2': 'Review',
      },
    ];

    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: double.infinity,
          toolbarHeight: 70,
          actions: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/homepageimages/Frame 586.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffE1E7EE),
                          radius: 20,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Color(0xff336EBD),
                              size: 15,
                            ),
                          ),
                        ),
                        Text(
                          'Add member',
                          style: TextStyle(color: Colors.blue),
                        )
                      ]),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  const Text(
                    'Kochi  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff515151),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrowdown.svg',
                    color: const Color(0xff515151),
                    height: 6,
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                  width: 326,
                  child: TextFormField(
                    cursorColor: const Color(0xff515151),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 25),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCCCCC)),
                      ),
                      border: const OutlineInputBorder(),
                      hintText:
                          'Search by Specialist/Category/Condition/Hospital',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'assets/icons/searchicon.svg',
                          color: const Color(0xff909090),
                          height: 16.67,
                          width: 16.67,
                        ),
                      ),
                      hintStyle: const TextStyle(
                        color: Color(0xff909090),
                        fontSize: 12,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffCCCCCC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>Get.toNamed(items[index]['route']) ,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Image.asset(
                              items[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              right: 20,
                              top: 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    items[index]['text'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    items[index]['text2'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            // Icon Positioned at the Bottom Right
                            Positioned(
                              bottom: 30,
                              right: 20,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/arrowicon.svg',
                                  height: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
                heading('Find Hospital near you'),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000), // Shadow color
                        offset:
                            Offset(0, 10), // Horizontal and vertical offsets
                        blurRadius: 15, // Blur radius
                        spreadRadius: -3, // Spread radius
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(maxHeight: 256),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 10),
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        child: Image.asset(
                                          'assets/homepageimages/Image (2).png',
                                          height: 121,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, top: 15, bottom: 5),
                                        child: Text(
                                          'Apollo Hospital',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/locationicon.svg',
                                              color: const Color(0xff6B7280),
                                              fit: BoxFit.cover,
                                              height: 14,
                                              width: 14,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            const Text(
                                              '123 Oak Street, CA 98765',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff6B7280)),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 5),
                                        child: Row(
                                          children: [
                                            const Text(
                                              '5.0',
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/starsicon.svg',
                                              height: 10,
                                              width: 10.7,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            const Text(
                                              '(128 Reviews)',
                                              style: TextStyle(
                                                  color: Color(0xff6B7280),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: Color(0xffE5E7EB),
                                        indent: 15,
                                        endIndent: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 5),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/kmicon.svg',
                                              height: 16,
                                              width: 16,
                                              color: const Color(0xff9CA3AF),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              '2.5 km/40min',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff6B7280)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                heading('Doctor you Consulted'),
                const SizedBox(
                  height: 10,
                ),
                ContainerDr(height: 95,),
                const SizedBox(
                  height: 10,
                ),
                heading('My Consultations'),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  height: 220,
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
                      color: const Color(0xff4987FF)
                          .withOpacity(0.25), // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Booking ID: XXXXXX',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
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
                        GestureDetector(
                          onTap: () =>Get.toNamed('MyConsultations') ,
                          child: const Padding(
                            padding:
                                EdgeInsets.only(right: 20, top: 20, bottom: 20),
                            child: ButtonCustom(
                                name: 'Click Here', height: 35, width: 291),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                heading('Featured Services'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                    return Container(height: 200,width: 150,color: Colors.white,child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(items2[index]['image'],fit: BoxFit.cover,)),);
                  },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerDr extends StatelessWidget {
  final double height;
  const ContainerDr({
    super.key,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
          color: const Color(0xff4987FF)
              .withOpacity(0.25), // Border color
          width: 1, // Border width
        ),
      ),
      child: Center(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'assets/homepageimages/Ellipse 190.png'),
              ),
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
    );
  }
}
