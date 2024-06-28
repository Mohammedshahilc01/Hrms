import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hrm/Controller/Color_list/Color_list.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:hrm/Model/Local_notification.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../main.dart';

class CustomCheckIn extends StatefulWidget {
  const CustomCheckIn({super.key});

  @override
  State<CustomCheckIn> createState() => _CustomCheckInState();
}

class _CustomCheckInState extends State<CustomCheckIn> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _totalWorkedTime = Duration.zero;
  DateTime now = DateTime.now();
  bool timerShow=false;

  void _startTimer() {
    print('------------------------');
    print(_stopwatch.isRunning);
    print(_stopwatch.isRunning);
    if (!_stopwatch.isRunning) {
      print(_stopwatch.isRunning);
      _stopwatch.start();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {});
      });
    }
  }

  void _stopTimer() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _totalWorkedTime += _stopwatch.elapsed;
      _stopwatch.reset();
      _timer?.cancel();
      setState(() {});
    }
  }

  void _resetTimer() {
    _stopwatch.reset();
    _totalWorkedTime = Duration.zero;
    _timer?.cancel();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    LocalNotification.initialize(flutterLocalNotificationsPlugin);
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
              height: 10,
            ),
            timerShow?Align(
              alignment: Alignment.center,
              child: TextData(
                name: 'Work Start️ on :${now.hour}:${now.minute}:${now.second}',
                fontWeight: FontWeight.bold,
              ),
            ):Align(
              alignment: Alignment.center,
              child: TextData(
                name: 'Lets go to Work 🖊️',
                fontWeight: FontWeight.w400,
              ),
            ),
            // Text("${now.hour}:${now.minute}:${now.second}"),
            timerShow?Align(
              alignment: Alignment.center,
              child: TextData(
                name: _formatTime(_stopwatch.elapsed),
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ):const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                splashColor: Colors.red,
                onTap: () async {
                  if(!timerShow){
                    requestNotificationPermissions();
                    _startTimer();
                      LocalNotification.showBigTextNotification(
                          title: "Keel info Solution",
                          body: "You are CheckIn ${now.hour}:${now.minute}:${now.second}",
                          fln: flutterLocalNotificationsPlugin);
                  }
                  else{
                    _stopTimer();
                    LocalNotification.showBigTextNotification(
                        title: "Keel info Solution",
                        body: "You are Worked Today ${_totalWorkedTime.inHours} : ${_totalWorkedTime.inMinutes} hr",
                        fln: flutterLocalNotificationsPlugin);
                  }
                  setState(() {
                    now=DateTime.now();
                    timerShow=!timerShow;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: !timerShow?ColorList.backgroundColor:Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextData(
                            name: !timerShow?'Check In':'Check Out',
                            fontSize: 18,
                            color: Colors.white,
                          ))),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       _stopTimer();
            //       LocalNotification.showBigTextNotification(
            //           title: "Notification",
            //           body: "Check in",
            //           fln: flutterLocalNotificationsPlugin);
            //     },
            //     child: const Text(
            //       'Check In',
            //       style: TextStyle(color: Colors.black),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 10,
            ),
            // Align(
            //     alignment: Alignment.center,
            //     child: TextData(
            //       name: '$_totalWorkedTime',
            //       fontWeight: FontWeight.w400,
            //     )),
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
}
