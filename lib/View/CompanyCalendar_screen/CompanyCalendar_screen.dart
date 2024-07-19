import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/Widget/TextWidget.dart';
class CompanyCalendarScreen extends StatelessWidget {
  const CompanyCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => context.go('/${RouteNames.bottomNavigation}'),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextData(
                  name: 'Calendar',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Expanded(child: SfCalendar(
                view: CalendarView.month,
              ))

            ],
          ),
        ),
        // bottomNavigationBar:const CustomBottomNavigationBar(),
      ),
    );
  }
}
