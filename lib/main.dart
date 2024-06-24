import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hrm/Controller/MyRouter/routers.dart';
import 'package:hrm/Controller/String_list/String_list.dart';
import 'package:hrm/View/ForgotPassword_screen/ForgotPassword_screen.dart';
import 'package:hrm/View/Home_screen/Home_screen.dart';
import 'package:hrm/View/Login_screen/Login_screen.dart';
import 'package:hrm/View/Splash_screen/Splash_screen.dart';

void main() async{
  runApp( const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  final HttpLink httpLink = HttpLink('http://localhost:4000/');
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:MyRouter.router,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// import 'View/test.dart';
//
// final HttpLink httpLink = HttpLink(
//   'http://192.168.0.190:8000/graphql/',
// );
//
// final ValueNotifier<GraphQLClient> client = ValueNotifier(
//   GraphQLClient(
//     link: httpLink,
//     cache: GraphQLCache(),
//   ),
// );
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GraphQLProvider(
//       client: client,
//       child: MaterialApp(
//         title: 'Flutter GraphQL Example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }




