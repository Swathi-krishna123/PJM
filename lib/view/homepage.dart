import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/homepageimages/second opinion from doctor.png',
        'text': 'Book an ',
        'text2': 'Appointment ',
      },
      {
        'image': 'assets/homepageimages/telemedicine.png',
        'text': 'Tele -  ',
        'text2': 'medicine  ',
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background,
          leadingWidth: double.infinity,
          toolbarHeight: 75, // Fixed height for the app bar
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
                  Column(mainAxisAlignment: MainAxisAlignment.center,children: [
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
                    Text('Add member',style: TextStyle(color: Colors.blue),)
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
            padding: const EdgeInsets.only(left: 15),
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
                    return ClipRRect(
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
                    );
                  },
                  itemCount: items.length,
                ),
                const Text(
                  'Find Hospital near you',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff283343)),
                ),
                SizedBox(height: 10,),
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
                const Text(
                  'Doctor you Consulted',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff283343)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
