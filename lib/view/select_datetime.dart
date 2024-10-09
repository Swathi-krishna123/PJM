import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/controller/datecontroller.dart';
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
      // Add more time slots as needed
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textcolor,
            size: 20,
          ),
          onPressed: () {
            Get.back(); // Using GetX for navigation
          },
        ),
        title: Text(
          'Select Date & Time',
          style: TextStyle(
            color: AppColors.textcolor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContainerDr(height: 90), // Assuming ContainerDr is a custom widget
            const SizedBox(height: 10),
            heading('Select Date'),
            const SizedBox(height: 10),
        
            // Calendar inside a container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Obx(() => TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: dateController.focusedDay.value,
                    selectedDayPredicate: (day) =>
                        isSameDay(dateController.selectedDay.value, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      dateController.selectedDay.value = selectedDay;
                      dateController.focusedDay.value = focusedDay;
                    },
                    onFormatChanged: (format) {
                      dateController.calendarFormat.value = format;
                    },
                    onPageChanged: (focusedDay) {
                      dateController.focusedDay.value = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        color: Color.fromRGBO(73, 135, 255, 0.25),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w600,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.textcolor,
                        shape: BoxShape.circle,
                      ),
                      outsideDaysVisible: true,
                      outsideTextStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon: Icon(Icons.chevron_left),
                      rightChevronIcon: Icon(Icons.chevron_right),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
        
            // Time slot selection
            const SizedBox(height: 15),
            Obx(() => Text(
              'Select Time Slot on ${dateController.selectedDay.value.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )),
            const SizedBox(height: 15),
        
            // Grid for time slots
            GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                return Obx(() => ElevatedButton(
                      onPressed: () {
                        dateController.updateSelectedTimeSlot(timeSlots[index]);
                      },
                      child: Text(timeSlots[index]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dateController.selectedTimeSlot.value == timeSlots[index]
                            ? AppColors.textcolor
                            : Colors.white,
                        foregroundColor: dateController.selectedTimeSlot.value == timeSlots[index]
                            ? Colors.white
                            : AppColors.grey1,
                        side: BorderSide(color: AppColors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
