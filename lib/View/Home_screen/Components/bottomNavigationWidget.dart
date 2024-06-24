import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Route_names/Route_names.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 0,
        onTap:(index){
          if(index==0)context.go("/${RouteNames.splashScreen}");
          if(index==1)context.go("/${RouteNames.loginPage}");
          if(index==2)context.go("/${RouteNames.forgotPassword}");
        } ,
        items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Home"),
    ]);
  }
}
