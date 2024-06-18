import 'package:flutter/material.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

class DrawerWidgetData extends StatelessWidget {
  const DrawerWidgetData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/medium-shot-smiley-man-posing_23-2149915892.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    TextData(
                      name: "Mohammed Shahil",
                      fontWeight: FontWeight.bold,
                    ),
                    TextData(
                      name: "S12345",
                    ),
                    TextData(
                      name: "Flutter Developer",
                      fontSize: 12,
                    )
                  ],
                ),
              ),
            ),
            ExpansionTile(
              title: Text('Home'),
              trailing: const SizedBox(),
              shape: Border(),
            ),
            ExpansionTile(
              title: Text('Profile'),
              shape: Border(),
              maintainState: true,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('sdfsdf'),
                Text('sdfsdf'),
              ],
            ),
            ExpansionTile(
              title: Text("User"),
              maintainState: true,
              shape: Border(),
              expandedCrossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: const [Text("This is a Row")],
                ),
                Text("Name : User "),
                Text("Phone No:"),
                const Text("isAdmin: No")
              ],
            ),
          ],
        ),
      ),
    );
    // return Container(
  }
}
