import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
          toolbarHeight: 100, // Fixed height for the app bar
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
                  Stack(children: [
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48,
                width: 326,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText:
                        'Search by Specialist/Category/Condition/Hospital',
                    contentPadding: EdgeInsetsDirectional.only(bottom: 6),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        'assets/icons/searchicon.svg',
                        color: const Color(0xff909090),
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
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                          right: screenWidth * 0.05,
                          top: screenHeight * 0.05,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                items[index]['text'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                items[index]['text2'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.05,
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
                          bottom: screenHeight * 0.05,
                          right: screenWidth * 0.05,
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/arrowicon.svg',
                              height: screenWidth * 0.05,
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
                style: TextStyle(color: Color(0xff283343), fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
