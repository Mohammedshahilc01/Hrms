import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/Widget/ExpansionTileWidget.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

class DrawerWidgetData extends StatelessWidget {
  const DrawerWidgetData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const Border(),
        elevation: 0.0,
        child: ListView(
          children: [
            Container(
              color:ColorList.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/medium-shot-smiley-man-posing_23-2149915892.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    TextData(
                      name: "Mohammed Shahil",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    TextData(
                      name: "S12345",
                      color: Colors.white,
                    ),
                    TextData(
                      name: "Flutter Developer",
                      fontSize: 12,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const ExpansionTile(
              title: Text('Home'),
              trailing:  SizedBox(),
              shape: Border(),
            ),
              ExpansionTile(
              title: Text('Profile'),
              shape: Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=>context.go('/updateProfile'),
                  child: const Padding(
                    padding:  EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
                    child: Text('Personal Details'),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
                  child: Text('Education Details'),
                ),
              ],
            ),
             ExpansionTile(
              title: const Text('Leave'),
              shape: const Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
              GestureDetector(
                onTap: ()=>context.go('/LeaveRequestScreen'),
                  child: const Padding(
                    padding:  EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
                    child: Text('Leave Request'),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
                  child: Text('Leave Approval'),
                ),
              ],
            ),
           const  ExpansionTile(
              title: Text('Regularization'),
              trailing: const SizedBox(),
              shape: Border(),
            ),
            const ExpansionTile(
              title: Text('Calendar'),
              trailing: const SizedBox(),
              shape: Border(),
            ),
            const ExpansionTile(
              title: Text('Help'),
              shape: Border(),
              maintainState: true,
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 8.0,bottom: 8.0,top: 8.0),
                  child: Text('Password Reset'),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Log Out'),
              trailing:  SizedBox(),
              shape: Border(),
            ),
          ],
        ),
      ),
    );
    // return Container(
  }
}
