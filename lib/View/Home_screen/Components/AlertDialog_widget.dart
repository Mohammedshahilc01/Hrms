import 'package:flutter/material.dart';
class AlertdialogWidget extends StatelessWidget {
  const AlertdialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // context.go('/${RouteNames.loginPage}');
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

