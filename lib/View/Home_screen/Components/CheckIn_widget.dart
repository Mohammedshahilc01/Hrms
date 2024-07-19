// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:hrm/Controller/Color_list/Color_list.dart';
// import 'package:hrm/Controller/Widget/TextWidget.dart';
// import 'package:hrm/Model/Local_notification.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../../main.dart';
//
// class CustomCheckIn extends StatefulWidget {
//   const CustomCheckIn({super.key});
//
//   @override
//   State<CustomCheckIn> createState() => _CustomCheckInState();
// }
//
// class _CustomCheckInState extends State<CustomCheckIn> {
//   Stopwatch _stopwatch = Stopwatch();
//   Timer? _timer;
//   Duration _totalWorkedTime = Duration.zero;
//   DateTime now = DateTime.now();
//   bool timerShow=false;
//
//   void _startTimer() {
//     if (!_stopwatch.isRunning) {
//       _stopwatch.start();
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         setState(() {});
//       });
//     }
//   }
//
//   void _stopTimer() {
//     if (_stopwatch.isRunning) {
//       _stopwatch.stop();
//       _totalWorkedTime += _stopwatch.elapsed;
//       _stopwatch.reset();
//       _timer?.cancel();
//       setState(() {});
//     }
//   }
//
//   void _resetTimer() {
//     _stopwatch.reset();
//     _totalWorkedTime = Duration.zero;
//     _timer?.cancel();
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   String _formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   Future<void> requestNotificationPermissions() async {
//     final PermissionStatus status = await Permission.notification.request();
//     if (status.isGranted) {
//       // Notification permissions granted
//     } else if (status.isDenied) {
//       // Notification permissions denied
//     } else if (status.isPermanentlyDenied) {
//       // Notification permissions permanently denied, open app settings
//       await openAppSettings();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     LocalNotification.initialize(flutterLocalNotificationsPlugin);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//                 color: Colors.black12,
//                 offset: Offset(1, 1),
//                 blurRadius: 5,
//                 spreadRadius: 1)
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             timerShow?Align(
//               alignment: Alignment.center,
//               child: TextData(
//                 name: 'Work Start️ on :${now.hour}:${now.minute}:${now.second}',
//                 fontWeight: FontWeight.bold,
//               ),
//             ):Align(
//               alignment: Alignment.center,
//               child: TextData(
//                 name: 'Lets go to Work 🖊️',
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             // Text("${now.hour}:${now.minute}:${now.second}"),
//             timerShow?Align(
//               alignment: Alignment.center,
//               child: TextData(
//                 name: _formatTime(_stopwatch.elapsed),
//                 fontWeight: FontWeight.w400,
//                 fontSize: 40,
//               ),
//             ):const SizedBox(),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: InkWell(
//                 splashColor: Colors.red,
//                 onTap: () async {
//                   if(!timerShow){
//                     requestNotificationPermissions();
//                     _startTimer();
//                     LocalNotification.showBigTextNotification(
//                         title: "Keel info Solution",
//                         body: "You are CheckIn ${now.hour}:${now.minute}:${now.second}",
//                         fln: flutterLocalNotificationsPlugin);
//                   }
//                   else{
//                     _stopTimer();
//                     LocalNotification.showBigTextNotification(
//                         title: "Keel info Solution",
//                         body: "You are Worked Today ${_totalWorkedTime.inHours} : ${_totalWorkedTime.inMinutes} hr",
//                         fln: flutterLocalNotificationsPlugin);
//                   }
//                   setState(() {
//                     now=DateTime.now();
//                     timerShow=!timerShow;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: !timerShow?ColorList.backgroundColor:Colors.red,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                       child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: TextData(
//                             name: !timerShow?'Check In':'Check Out',
//                             fontSize: 18,
//                             color: Colors.white,
//                           ))),
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(10),
//             //   child: ElevatedButton(
//             //     onPressed: () {
//             //       _stopTimer();
//             //       LocalNotification.showBigTextNotification(
//             //           title: "Notification",
//             //           body: "Check in",
//             //           fln: flutterLocalNotificationsPlugin);
//             //     },
//             //     child: const Text(
//             //       'Check In',
//             //       style: TextStyle(color: Colors.black),
//             //     ),
//             //   ),
//             // ),
//
//             const SizedBox(
//               height: 10,
//             ),
//             // Align(
//             //     alignment: Alignment.center,
//             //     child: TextData(
//             //       name: '$_totalWorkedTime',
//             //       fontWeight: FontWeight.w400,
//             //     )),
//             const SizedBox(
//               height: 5,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Color_list/Color_list.dart';
import '../../../Controller/Provider/Provider.dart';
import '../../../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import '../../../Controller/Secure_Storage/Secure_storage.dart';
import '../../../Controller/Widget/TextWidget.dart';
import '../../../Model/Local_notification.dart';
import '../../../Model/UserCheckInTest_model.dart';
import '../../../Model/UserLogin_model.dart';
import '../../../main.dart';
import '../../providerTimerCheck.dart';

class CustomCheckIn extends StatefulWidget {
  const CustomCheckIn({super.key});

  @override
  State<CustomCheckIn> createState() => _CustomCheckInState();
}

class _CustomCheckInState extends State<CustomCheckIn> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TimerProvider>(context, listen: false).userCheckInTestQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 1)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 15,
            ),
            Consumer<TimerProvider>(
              builder: (context, timerProvider, child) {
                var checkInTime = DateFormat("dd / MMMM / yyyy").format(DateTime.parse(timerProvider.checkTime.toString()));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextData(name: 'Shift Today : (9:30 AM To 5:30 PM)',color: Colors.grey,fontSize: 12,),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                    color: Colors.green),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.sticky_note_2_outlined,color:Colors.white,size: 18,),
                                )),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextData(name: checkInTime,),
                                TextData(name: "${timerProvider.totalWorkedTime.inHours}h / 8h",),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    timerProvider.isWorkTimeShow
                        ? Center(
                          child: TextData(
                              name: 'Work Start️ on ${timerProvider.checkTime.hour} : ${timerProvider.checkTime.minute} : ${timerProvider.checkTime.second}',
                              fontWeight: FontWeight.w500,
                            color: ColorList.backgroundColor,
                            ),
                        )
                        : const SizedBox(),
                     timerProvider.isWorkTimeShow?Center(
                       child: Text(
                              timerProvider.formattedTime,
                              style: const TextStyle(fontSize: 48),
                            ),
                     ):const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        timerProvider.isStarted
                            ? SizedBox(
                          width: MediaQuery.of(context).size.width/1.2,
                              child: ElevatedButton(
                                style:ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(timerProvider.isRunning?Colors.red:ColorList.backgroundColor),
                                ),
                                  onPressed: (){

                                    if(timerProvider.isRunning){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return  AlertDialog(
                                            title: TextData(
                                              name: "Confirmation",
                                            ),
                                            content:  TextData(
                                              name: "Are you sure you want to Clock Out?",
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(); // Close the dialog
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  timerProvider.userCheckOutFirstAPI();
                                                  // timerProvider.userCheckOut();


                                                  // timerProvider.stopTimer();

                                                  // LocalNotification.showBigTextNotification(
                                                  //     title: "Keel info Solution",
                                                  //     // body: "You are Worked Today  : ${timerPro.totalWorkedTime.inHours} Hr : ${timerPro.totalWorkedTime.inMinutes} Minutes",
                                                  //     fln: flutterLocalNotificationsPlugin, body: 'ss');
                                                },
                                                child: const Text('Clock Out'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                    }
                                    else{
                                      timerProvider.userCheckInFirstAPI();
                                      // timerProvider.startTimer();
                                    }
                                  },
                                  child: Text(
                                      timerProvider.isRunning ? 'Clock Out' : 'Clock In',style: TextStyle(color: Colors.white),),
                                ),
                            )
                            : const SizedBox(),
                        const SizedBox(width: 10),
                      ],
                    ),
                    !timerProvider.isStarted? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextData(name: 'You worked :'),
                        // TextData(name: ' ${timerPro.totalWorkedTime.inHours} hr : ${timerPro.totalWorkedTime.inMinutes} min ',fontWeight: FontWeight.bold,),
                        TextData(name: '${timerProvider.totalWorkedTime.inHours} Hr: ${timerProvider.totalWorkedTime.inMinutes} Min' ,fontWeight: FontWeight.bold,),
                        TextData(name: ' today'),
                      ],
                    ):const SizedBox()
                  ],
                );
              },
            ),

            // Align(
            //    alignment: Alignment.center,
            //    child: TextData(
            //      name: 'Work Start️ on ${GlobalVariable.startTime?.hour} : ${GlobalVariable.startTime?.minute} : ${GlobalVariable.startTime?.second}',
            //      fontWeight: FontWeight.bold,
            //    ),
            //  ):
            //  Align(
            //    alignment: Alignment.center,
            //    child: TextData(
            //      name: 'Lets go to Work 🖊️',
            //      fontWeight: FontWeight.w400,
            //    ),
            //  ),
            //
            //  checkIn?Center(
            //    child: Text(
            //      _formatTime(_remainingSeconds),
            //      style: TextStyle(fontSize: 48),
            //    ),
            //  ):SizedBox(),
            //  Padding(
            //    padding: const EdgeInsets.all(10),
            //    child: InkWell(
            //      splashColor: Colors.red,
            //      onTap: () async {
            //          if(!checkIn){
            //            DateTime now = DateTime.now();
            //            DateTime? birthday = DateTime.parse(now.toString());
            //            var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(birthday.toString()));
            //            print(tempDate);
            //            print(tempDate);
            //            await SecureStorage.storage.write(
            //                key: SecureStorageKeys.checkInTime,
            //                value: tempDate);
            //            setState(() {
            //              startTi();
            //            });
            //            // LocalNotification.showBigTextNotification(
            //            //     title: "Keel info Solution",
            //            //     body: "You are CheckIn $tempDate",
            //            //     fln: flutterLocalNotificationsPlugin);
            //          }
            //          else{
            //            showDialog(
            //              context: context,
            //              builder: (BuildContext context) {
            //                return  AlertDialog(
            //                  title: TextData(
            //                    name: "Confirmation",
            //                  ),
            //                  content:  TextData(
            //                    name: "Are you sure you want to Checkout?",
            //                  ),
            //                  actions: <Widget>[
            //                    TextButton(
            //                      onPressed: () {
            //                        Navigator.of(context).pop(); // Close the dialog
            //                      },
            //                      child: const Text('Cancel'),
            //                    ),
            //                    TextButton(
            //                      onPressed: () {
            //                        // timerPro.stopTimer();
            //                        LocalNotification.showBigTextNotification(
            //                            title: "Keel info Solution",
            //                            body: "You are Worked Today  : 10 Hr : 10 Minutes",
            //                            fln: flutterLocalNotificationsPlugin);
            //                        Navigator.of(context).pop();
            //                        _stopTimer();
            //                      },
            //                      child: const Text('Checkout'),
            //                    ),
            //                  ],
            //                );
            //              },
            //            );
            //
            //          }
            //
            //      },
            //      child: Container(
            //        decoration: BoxDecoration(
            //          color: checkIn?Colors.red:ColorList.backgroundColor,
            //          borderRadius: BorderRadius.circular(20),
            //        ),
            //        child: Center(
            //            child: Padding(
            //                padding: EdgeInsets.all(10),
            //                child: TextData(
            //                  name: checkIn?'Check Out':'Check In',
            //                  fontSize: 18,
            //                  color: Colors.white,
            //                ))),
            //      ),
            //    ),
            //  ),
            //

            // !timerPro.checkInToday?Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: InkWell(
            //     splashColor: Colors.red,
            //     onTap: () async {
            //       if(!timerPro.checkInToday){
            //         if(timerPro.checkIn){
            //           DateTime now = DateTime.now();
            //           DateTime? birthday = DateTime.parse(now.toString());
            //           var tempDate = DateFormat("HH:mm:ss").format(DateTime.parse(birthday.toString()));
            //           await SecureStorage.storage.write(
            //               key: SecureStorageKeys.checkInTime,
            //               value: tempDate);
            //           LocalNotification.showBigTextNotification(
            //               title: "Keel info Solution",
            //               body: "You are CheckIn $tempDate",
            //               fln: flutterLocalNotificationsPlugin);
            //           timerPro.startTimer();
            //         }
            //         else{
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return  AlertDialog(
            //                 title: TextData(
            //                   name: "Confirmation",
            //                 ),
            //                 content:  TextData(
            //                   name: "Are you sure you want to Checkout?",
            //                 ),
            //                 actions: <Widget>[
            //                   TextButton(
            //                     onPressed: () {
            //                       Navigator.of(context).pop(); // Close the dialog
            //                     },
            //                     child: const Text('Cancel'),
            //                   ),
            //                   TextButton(
            //                     onPressed: () {
            //                       timerPro.stopTimer();
            //                       Navigator.of(context).pop();
            //                       LocalNotification.showBigTextNotification(
            //                           title: "Keel info Solution",
            //                           body: "You are Worked Today  : ${timerPro.totalWorkedTime.inHours} Hr : ${timerPro.totalWorkedTime.inMinutes} Minutes",
            //                           fln: flutterLocalNotificationsPlugin);
            //                     },
            //                     child: const Text('Checkout'),
            //                   ),
            //                 ],
            //               );
            //             },
            //           );
            //
            //         }
            //       }
            //
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: timerPro.totalTimeShow?ColorList.backgroundColor:Colors.red,
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       child: Center(
            //           child: Padding(
            //               padding: EdgeInsets.all(10),
            //               child: TextData(
            //                  name: timerPro.totalTimeShow?'Check In':'Check Out',
            //                 fontSize: 18,
            //                 color: Colors.white,
            //               ))),
            //     ),
            //   ),
            // ):Center(child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextData(name: 'You worked :'),
            //     TextData(name: ' ${timerPro.totalWorkedTime.inHours} hr : ${timerPro.totalWorkedTime.inMinutes} min ',fontWeight: FontWeight.bold,),
            //     TextData(name: ' today'),
            //   ],
            // )),

            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
