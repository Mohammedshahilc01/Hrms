// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TimerProvider(),
//       child: MaterialApp(
//         home: TimerScreen(),
//       ),
//     );
//   }
// }
//
// class TimerScreen extends StatefulWidget {
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }
//
// class _TimerScreenState extends State<TimerScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _hoursController = TextEditingController();
//   final _minutesController = TextEditingController();
//   final _secondsController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Timer App')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _hoursController,
//                 decoration: InputDecoration(labelText: 'Hours'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter hours';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _minutesController,
//                 decoration: InputDecoration(labelText: 'Minutes'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter minutes';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _secondsController,
//                 decoration: const InputDecoration(labelText: 'Seconds'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter seconds';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final hours = int.parse(_hoursController.text);
//                     final minutes = int.parse(_minutesController.text);
//                     final seconds = int.parse(_secondsController.text);
//                     DateTime now = DateTime.now();
//                     print('---------------------------------');
//                     print('${now.hour}:${now.minute}:${now.second}');
//                     print('${now.hour * 3600 + now.minute* 60 + now.second}');
//                     final totalSecond2=now.hour * 3600 + now.minute* 60 + now.second;
//                     final totalSeconds = hours * 3600 + minutes * 60 + seconds;
//                     print('Total ${totalSecond2-totalSeconds}');
//                     print('---------------------------------');
//
//                     Provider.of<TimerProvider>(context, listen: false).startTimer(totalSecond2-totalSeconds);
//                   }
//                 },
//                 child: Text('Start Timer'),
//               ),
//               const SizedBox(height: 20),
//               Consumer<TimerProvider>(
//                 builder: (context, timerProvider, child) {
//                   final duration = Duration(seconds: timerProvider.remainingSeconds);
//                   final hours = duration.inHours.toString().padLeft(2, '0');
//                   final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
//                   final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//                   return Text('$hours:$minutes:$seconds', style: TextStyle(fontSize: 48));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TimerProvider with ChangeNotifier {
//   int _remainingSeconds = 0;
//   Timer? _timer;
//
//   int get remainingSeconds => _remainingSeconds;
//
//   void startTimer(int seconds) {
//     _remainingSeconds = seconds;
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds > 0) {
//         _remainingSeconds++;
//         notifyListeners();
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }
// }
