import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:hrm/Controller/Provider/Provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectIndex=Provider.of<ProviderNotifier>(context);
    return SafeArea(
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              selectedIndex: 0,
              onTabChange: (index) {
                selectIndex.bottomNavigationBar(index);
              },
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300),
              gap: 8,
              iconSize: 24,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: const EdgeInsets.all(10),
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.read_more_outlined,
                  text: 'Leave Request',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'Leave List',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
    // return BottomNavigationBar(
    //     currentIndex: 0,
    //     onTap:(index){
    //       if(index==0)context.go("/${RouteNames.splashScreen}");
    //       if(index==1)context.go("/${RouteNames.leaveRequestScreen}");
    //       if(index==2)context.go("/${RouteNames.updateProfile}");
    //     } ,
    //     items: const [
    //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    //   BottomNavigationBarItem(icon: Icon(Icons.fast_rewind), label: "Leave"),
    //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    // ]);
  }
}
