// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// import '../main.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   void loginMutation() async {
//     final MutationOptions options = MutationOptions(
//       document: gql('''
//         mutation Login(\$email: String!, \$password: String!) {
//           tokenAuth(email: \$email, password: \$password) {
//             success
//             errors
//             token
//             refreshToken
//             user {
//               id
//               email
//               username
//               firstName
//               lastName
//               teamleader
//               empid
//               role
//               department
//               designation
//               address
//               login
//               logout
//               isActive
//             }
//           }
//         }
//       '''),
//       variables: {
//         'email': emailController.text,
//         'password': passwordController.text,
//       },
//     );
//
//     final QueryResult result = await client.value.mutate(options);
//     print('-------------------------------');
//     print(result.data);
//     print('-------------------------------');
//     if (result.hasException) {
//       print('Mutation error: ${result.exception.toString()}');
//       // Handle error, e.g., show error message to user
//     } else {
//       final dynamic responseData = result.data!['tokenAuth'];
//       print('Mutation completed: $responseData');
//       // Handle successful login, update UI or navigate to next screen
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: loginMutation,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logout(context); // Handle logout
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) {
    // Handle the logout logic here
    // For example, navigate to the login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showLogoutDialog(context),
          child: Text('Logout'),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login Page Content'),
      ),
    );
  }
}







