// import 'package:flutter/material.dart';
// import 'package:hrm/Controller/Provider/Provider.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import '../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
// import '../Controller/Secure_Storage/Secure_storage.dart';
//
// class TimerTest extends StatelessWidget {
//   const TimerTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<TimerProvider>(context, listen: false).startTimer();
//     final timerPro= Provider.of<TimerProvider>(context);
//     return Scaffold(
//       body: Center(child:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(onPressed: () async {
//           if(timerPro.checkIn){
//             DateTime now = DateTime.now();
//             DateTime? birthday = DateTime.parse(now.toString());
//             var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(birthday.toString()));
//             await SecureStorage.storage.write(
//                 key: SecureStorageKeys.checkInTime,
//                 value: tempDate);
//             timerPro.startTimer();
//           }
//           else{
//             timerPro.stopTimer();
//           }
//           }, child: timerPro.totalTimeShow?const Text('Start'):const Text('Stop')),
//           Text('Work Started:  ${timerPro.startTime}'),
//           !timerPro.checkIn?Consumer<TimerProvider>(
//             builder: (context, timerProvider, child) {
//               final duration = Duration(seconds: timerProvider.remainingSeconds);
//               final hours = duration.inHours.toString().padLeft(2, '0');
//               final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
//               final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//               return Text('$hours:$minutes:$seconds', style: const TextStyle(fontSize: 48));
//             },
//           ):Text('sdfsdf'),
//         ],
//       ),),
//     );
//   }
// }
