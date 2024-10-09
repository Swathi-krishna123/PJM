import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey_management/utilities/custom_widgets/headings.dart';
import 'package:patient_journey_management/view/select_hospital.dart';

import '../constants/colors.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key});

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
            'Appointment Type',
            style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading('Choose Appointment Type'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    
                    context: context,
                    builder: (context) => SelectHospital(),
                  );
                },
                child: ContainerCustom(
                  color: const Color(0xffDEC4FF),
                  heading: 'Hospital',
                  text: 'Your journey to recovery starts here.',
                  path: 'assets/icons/hospitalicon.svg',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerCustom(
                  heading: 'Clinic',
                  text: 'Your health is our priority—let’s check in!',
                  path: 'assets/icons/clinicicon.svg',
                  color: const Color(0xffFFF48E)),
              const SizedBox(
                height: 10,
              ),
              ContainerCustom(
                  heading: 'Specialist',
                  text: 'Expert insights for your specific health needs.',
                  path: 'assets/icons/speacialisticon.svg',
                  color: const Color(0xffFFABA5))
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  String heading;
  String text;
  Color color;
  String path;
  ContainerCustom({
    super.key,
    required this.heading,
    required this.text,
    required this.path,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 326,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: const DecorationImage(
              image: AssetImage(
                  'assets/appointmentpageimages/containerbackground.jpeg'),
              opacity: 0.2,
              fit: BoxFit.cover),
          color: color),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                  child: SvgPicture.asset(
                path,
                height: 24,
                width: 24,
              )),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              heading,
              style: const TextStyle(
                  color: Color(0xff283343),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xff283343),
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
