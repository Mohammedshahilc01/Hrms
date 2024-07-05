// // import 'dart:async';
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// //
// // import '../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
// // import '../Controller/Secure_Storage/Secure_storage.dart';
// //
// // class TimerScreen extends StatefulWidget {
// //   @override
// //   _TimerScreenState createState() => _TimerScreenState();
// // }
// //
// // class _TimerScreenState extends State<TimerScreen> {
// //
// //   Timer? _timer;
// //   int _remainingSeconds = 0;
// //   var globalVal;
// //
// //   @override
// //   void dispose() {
// //     _timer?.cancel();
// //     super.dispose();
// //   }
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     _startTimerInit();
// //
// //     super.initState();
// //   }
// //
// //   void startTi()async {
// //     final secureDate=await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
// //     DateTime now = DateTime.now();
// //     DateTime tempDate = DateFormat("hh:mm:ss").parse(secureDate!);
// //     final checkInTimeDuration = tempDate.hour * 3600 +
// //         tempDate.minute * 60 +
// //         tempDate.second;
// //     final nowTimeDuration =
// //         now.hour * 3600 + now.minute * 60 + now.second;
// //     final totalTime=nowTimeDuration-checkInTimeDuration;
// //     setState(() {
// //       _startTimer(totalTime);
// //     });
// //   }
// //
// //   void _startTimer(int seconds) {
// //     setState(() {
// //       _remainingSeconds = seconds;
// //     });
// //     _timer?.cancel();
// //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       setState(() {
// //         if (_remainingSeconds > 0) {
// //           _remainingSeconds++;
// //         } else {
// //           timer.cancel();
// //         }
// //       });
// //     });
// //   }
// //
// //   Future<void> _startTimerInit() async {
// //     final value = await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
// //     print(value);
// //     print(value);
// //     setState(() {
// //       globalVal=value;
// //     });
// //     if (value!=null) {
// //       DateTime now = DateTime.now();
// //       final value = await SecureStorage.storage
// //           .read(key: SecureStorageKeys.checkInTime.toString());
// //       DateTime tempDate = DateFormat("hh:mm:ss").parse(value!);
// //       final timeNowSec = now.hour * 3600 + now.minute * 60 + now.second;
// //       final timeStartSec =
// //           tempDate.hour * 3600 + tempDate.minute * 60 + tempDate.second;
// //       final totalTime = timeNowSec - timeStartSec;
// //       setState(() {
// //         _remainingSeconds = totalTime;
// //       });
// //       _timer?.cancel();
// //       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //         setState(() {
// //           if (_remainingSeconds > 0) {
// //             _remainingSeconds++;
// //           } else {
// //             timer.cancel();
// //           }
// //         });
// //       });
// //     }
// //     else{
// //       print(' null');
// //       print(' null');
// //       print(' null');
// //     }
// //   }
// //
// //   void _stopTimer() async{
// //     await SecureStorage.storage.delete(key: SecureStorageKeys.checkInTime);
// //     setState(() {
// //       _timer?.cancel();
// //
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Timer App')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           child: Column(
// //             children: [
// //               SizedBox(height: 20),
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: () async {
// //                       DateTime now = DateTime.now();
// //                       if (globalVal == null) {
// //                         DateTime? birthday = DateTime.parse(now.toString());
// //                         var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(birthday.toString()));
// //                         print(tempDate);
// //                         print(tempDate);
// //                         await SecureStorage.storage.write(
// //                             key: SecureStorageKeys.checkInTime,
// //                             value: tempDate);
// //                         print(globalVal);
// //                         print(globalVal);
// //                         startTi();
// //                       }else{
// //                         print('_stopTimer');
// //                         print('_stopTimer');
// //                         print('_stopTimer');
// //                         print('_stopTimer');
// //                         _stopTimer();
// //                       }
// //                     },
// //                     child: globalVal == null
// //                         ? const Text('Start Timer')
// //                         : const Text('Stop Timer'),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 20),
// //               Text(
// //                 _formatTime(_remainingSeconds),
// //                 style: TextStyle(fontSize: 48),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   String _formatTime(int totalSeconds) {
// //     final duration = Duration(seconds: totalSeconds);
// //     final hours = duration.inHours.toString().padLeft(2, '0');
// //     final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
// //     final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
// //     return '$hours:$minutes:$seconds';
// //   }
// // }
//
//
//
// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
// import '../Controller/Secure_Storage/Secure_storage.dart';
//
// class TimerScreen extends StatefulWidget {
//   const TimerScreen({super.key});
//
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }
//
// class _TimerScreenState extends State<TimerScreen> {
//
//   Timer? _timer;
//   int _remainingSeconds = 0;
//   var globalVal;
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     _startTimerInit();
//
//     super.initState();
//   }
//
//   void startTi()async {
//     final secureDate=await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
//     DateTime now = DateTime.now();
//     DateTime tempDate = DateFormat("hh:mm:ss").parse(secureDate!);
//     final checkInTimeDuration = tempDate.hour * 3600 + tempDate.minute * 60 + tempDate.second;
//     final nowTimeDuration = now.hour * 3600 + now.minute * 60 + now.second;
//     final totalTime=nowTimeDuration-checkInTimeDuration;
//     setState(() {
//       _startTimer(totalTime);
//     });
//   }
//
//   void _startTimer(int seconds) {
//     setState(() {
//       _remainingSeconds = seconds;
//     });
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds++;
//         } else {
//           timer.cancel();
//         }
//       });
//     });
//   }
//
//   Future<void> _startTimerInit() async {
//     final value = await SecureStorage.storage.read(key: SecureStorageKeys.checkInTime.toString());
//     print(value);
//     print(value);
//     setState(() {
//       globalVal=value;
//     });
//     if (value!=null) {
//       DateTime now = DateTime.now();
//       final value = await SecureStorage.storage
//           .read(key: SecureStorageKeys.checkInTime.toString());
//       DateTime tempDate = DateFormat("hh:mm:ss").parse(value!);
//       final timeNowSec = now.hour * 3600 + now.minute * 60 + now.second;
//       final timeStartSec =
//           tempDate.hour * 3600 + tempDate.minute * 60 + tempDate.second;
//       final totalTime = timeNowSec - timeStartSec;
//       setState(() {
//         _remainingSeconds = totalTime;
//       });
//       _timer?.cancel();
//       _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//         setState(() {
//           if (_remainingSeconds > 0) {
//             _remainingSeconds++;
//           } else {
//             timer.cancel();
//           }
//         });
//       });
//     }
//     else{
//       print(' null');
//       print(' null');
//       print(' null');
//     }
//   }
//
//   void _stopTimer() async{
//     await SecureStorage.storage.delete(key: SecureStorageKeys.checkInTime);
//     setState(() {
//       _timer?.cancel();
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Timer App')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       DateTime now = DateTime.now();
//                       if (globalVal == null) {
//                         DateTime? birthday = DateTime.parse(now.toString());
//                         var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(birthday.toString()));
//                         print(tempDate);
//                         print(tempDate);
//                         await SecureStorage.storage.write(
//                             key: SecureStorageKeys.checkInTime,
//                             value: tempDate);
//                         print(globalVal);
//                         print(globalVal);
//                         startTi();
//                       }else{
//                         print('_stopTimer');
//                         print('_stopTimer');
//                         print('_stopTimer');
//                         print('_stopTimer');
//                         _stopTimer();
//                       }
//                     },
//                     child: globalVal == null
//                         ? const Text('Start Timer')
//                         : const Text('Stop Timer'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 _formatTime(_remainingSeconds),
//                 style: TextStyle(fontSize: 48),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _formatTime(int totalSeconds) {
//     final duration = Duration(seconds: totalSeconds);
//     final hours = duration.inHours.toString().padLeft(2, '0');
//     final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
//     final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//     return '$hours:$minutes:$seconds';
//   }
// }
