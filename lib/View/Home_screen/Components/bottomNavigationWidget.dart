import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Color_list/Color_list.dart';
import '../../../Controller/Provider/Provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectIndex=Provider.of<ProviderNotifier>(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            color: ColorList.backgroundColor,
              selectedIndex: 0,
              onTabChange: (index) {
                selectIndex.bottomNavigationBar(index);
              },
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300),
              gap: 8,
              iconSize: 24,
              tabBackgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'Leave List',
                ),
                GButton(
                  icon: Icons.calendar_month,
                  text: 'Attendance',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );

  }
}
