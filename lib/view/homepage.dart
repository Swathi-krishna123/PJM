import 'package:flutter/material.dart';
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundImage:
                        AssetImage('assets/homepageimages/Frame 586.png'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Color(0xffE1E7EE),
                    radius: 20,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Color(0xff336EBD),
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Text(
                    'Kochi',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff515151),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined,
                      color: Color(0xff515151), size: 30),
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Search by Specialist/Category/Condition/Hospital',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 16,
                        color: Color(0xff909090),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
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
                            right: screenWidth * 0.05, // Adjust the right position
                            top: screenHeight * 0.05, // Adjust the top position
                            left: screenWidth * 0.05, // Adjust the top position
                            bottom: screenHeight * 0.05, // Adjust the top position
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  items[index]['text'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Handle overflow
                                  maxLines: 1, // Limit to 1 line
                                ),
                                Text(
                                  items[index]['text2'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Handle overflow
                                  maxLines: 1, // Limit to 1 line
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
