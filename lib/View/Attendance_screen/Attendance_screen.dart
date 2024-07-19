import 'package:Sapiens/Controller/Provider/Provider.dart';
import 'package:Sapiens/Model/UserAttendanceDetails_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/String_list/String_list.dart';
import '../../Controller/Widget/TextWidget.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _CardDesignState();
}

class _CardDesignState extends State<AttendanceScreen> {
  String selectedValue="";
  TextEditingController checkInController = TextEditingController();
  TextEditingController  checkOutController = TextEditingController();
  UserAttendanceDetailsModel? userAttendanceDetailsModel;
  Set<String> uniqueMonthYear = {};
  List<String> monthsList=[];
  List<UserAttendanceDetail> filteredDateStrings=[];
  Map<String, DateTime> monthYearMap = {};
  List<String> monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  List<UserAttendanceDetail> userAttendance=[
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-06-20T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-06-12T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-06-13T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-06-14T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-06-15T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-07-20T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-07-12T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-07-13T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-07-14T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-07-15T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-05-20T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-05-12T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-05-13T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-05-14T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
    UserAttendanceDetail(typename: "AttendanceManagementType", id: "16", checkIn: DateTime.tryParse("2024-05-15T07:07:40.549101+00:00"), checkOut: "null", totalWorkingHours: "9", lastUpdate: DateTime.tryParse("2024-07-10T07:07:40.625094+00:00")),
  ];
  void aData(){
    print('userAttendanceDetailsModel?.userAttendanceDetails');
    print(userAttendanceDetailsModel?.userAttendanceDetails[0].checkIn);
    print('userAttendanceDetailsModel?.userAttendanceDetails.');
    for (var e in userAttendanceDetailsModel?.userAttendanceDetails??[]) {
      DateTime date = DateTime.parse(e.checkIn.toString());
      int month = date.month;
      int year = date.year;
      String monthYear = '${monthNames[month - 1]} $year';
      uniqueMonthYear.add(monthYear);
      monthYearMap[monthYear] = date;
    }
     monthsList = uniqueMonthYear.toList()..sort((a, b) => monthYearMap[a]!.compareTo(monthYearMap[b]!));
    print(monthsList);
    print(monthsList);
    print(monthsList);
      // selectedValue=monthsList.last;
    // changeValue();
  }
  // void changeValue(){
  //   filteredDateStrings.clear();
  //   String dateString = selectedValue;
  //   List<String> separatedDate = dateString.split(' ');
  //   if (separatedDate.length == 2) {
  //     String selectedMonth = separatedDate[0];
  //     int selectedYear = int.parse(separatedDate[1]);
  //     for (var e in userAttendanceDetailsModel?.userAttendanceDetails??[]) {
  //       DateTime date = DateTime.parse(e.checkIn.toString());
  //       int month = date.month;
  //       int year = date.year;
  //       String monthName = monthNames[month - 1];
  //       if (monthName == selectedMonth && year == selectedYear) {
  //         filteredDateStrings.add(e);
  //       }
  //       filteredDateStrings.sort((a, b) {
  //         DateTime dateA = DateTime.parse(a.checkIn.toString());
  //         DateTime dateB = DateTime.parse(b.checkIn.toString());
  //         return dateA.compareTo(dateB);
  //       });
  //     }
  //   } else {
  //     print('Invalid date format');
  //   }
  // }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        checkInController.text = picked.format(context);
      });
    }
  }
  Future<void> _checkOutSelectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      print(picked);
      print(picked);
      print(picked);
      setState(() {
        checkOutController.text = picked.format(context);

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderNotifier>(context,listen: false).getUserAttendanceDetailsQuery();

    // userAttendanceDetailsModel=UserAttendanceDetailsModel(typename: "Query", userAttendanceDetails: userAttendance);
    // aData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Consumer<ProviderNotifier>(builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextData(
                      name: 'Attendance',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton<String>(
                        isDense: true,
                        padding: EdgeInsets.zero,
                        underline: const SizedBox(),
                        value: value.selectedValue,
                        items: value.monthsList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedValue=val!;
                          });
                          // changeValue();
                        },
                      ),
                    ),
                  ),
                  Expanded(child:  ListView.builder(
                    itemCount:value.filteredUserAttendanceDetail.length,
                    itemBuilder: (context, index) {
                      String? clockOut="";
                      int totalWorkingHour=0;
                      int dayWorkedHour=0;
                      DateTime? clockOutTimeCheck=DateTime.now();
                      DateTime? clockTimeCheck=value.filteredUserAttendanceDetail[index].checkIn;
                      var day = DateFormat("EEE").format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkIn.toString()??""));
                      var date = DateFormat("dd").format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkIn.toString()??''));
                      var month = DateFormat("MMMM").format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkIn.toString()??''));
                      var clockIn = DateFormat('hh:mm a').format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkIn.toString()??''));
                      var totalHr = value.filteredUserAttendanceDetail[index].totalWorkingHours;
                      TimeOfDay morningCloseTime=const TimeOfDay(hour: 10, minute: 01);
                      TimeOfDay eveningCloseTime=const TimeOfDay(hour: 8, minute: 00);
                      int morningClockInTimeInSeconds = clockTimeCheck!.hour * 60 + clockTimeCheck.minute;
                      int morningCloseTimeInSeconds = morningCloseTime.hour * 60 + morningCloseTime.minute;
                      if(value.filteredUserAttendanceDetail[index].checkOut!=null){
                        clockOutTimeCheck=DateTime.parse(value.filteredUserAttendanceDetail[index].checkOut.toString());
                        clockOut = DateFormat('hh:mm a').format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkOut.toString()));
                        totalWorkingHour=((clockTimeCheck.hour+clockOutTimeCheck.hour)*60)+(clockTimeCheck.minute+clockOutTimeCheck.minute);
                        dayWorkedHour=((clockTimeCheck.hour+eveningCloseTime.hour)*60) +clockTimeCheck.minute;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 5,top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                              )],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextData(name: day,fontSize: 10,),
                                    TextData(name: date,fontSize: 17,),
                                    TextData(name: month,fontSize: 10,),
                                  ],
                                )),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        // Padding(
                                        //   padding:  const EdgeInsets.only(top: 8.0,left: 8.0,right: 5.0,bottom: 4.0),
                                        //   child: InkWell(
                                        //
                                        //     child: Container(
                                        //         decoration: BoxDecoration(
                                        //           borderRadius: BorderRadius.circular(7),
                                        //           color:Colors.amber,
                                        //         ),
                                        //         child: Padding(
                                        //           padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                                        //           child: Row(
                                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //             children: [
                                        //               TextData(name: 'Project Plan',color: Colors.white,fontSize: 10,),
                                        //               TextData(name:'09:10 AM - 10:00 AM',color: Colors.white,fontSize: 10,),
                                        //             ],
                                        //           ),
                                        //         )),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 5.0,left: 8.0,),
                                          child: InkWell(
                                            onTap: () async {
                                              checkInController.text=DateFormat('hh : mm a').format(clockTimeCheck);
                                              checkOutController.text=DateFormat('hh : mm a').format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkOut.toString()));
                                              morningCloseTimeInSeconds<morningClockInTimeInSeconds?showDialog(
                                                  context: context,
                                                  builder: (_) =>  ListView(
                                                    children: [
                                                      AlertDialog(
                                                          contentPadding: EdgeInsets.zero,
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          insetPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 100),
                                                          content:Container(
                                                            // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                color: Colors.white
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: [
                                                                    Align(
                                                                        alignment: Alignment.bottomRight,
                                                                        child: IconButton(onPressed: (){
                                                                          Navigator.pop(context);
                                                                        }, icon: const Icon(Icons.close))),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10),
                                                                      child: TextData(
                                                                        name: 'Regularize Clock In',
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 25,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 10,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Date',),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                                                      child: Container(
                                                                        height: 45,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                                          color: Colors.grey.shade200,),
                                                                        child: Row(
                                                                          children: [
                                                                            const SizedBox(width: 10,),
                                                                            const Icon(Icons.calendar_month),
                                                                            const SizedBox(width: 10,),
                                                                            TextData(name: DateFormat("dd/MM/yyy").format(clockTimeCheck)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Clock In',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          onTap: () {
                                                                            _selectTime(context);
                                                                          },
                                                                          controller: checkInController,
                                                                          decoration: InputDecoration(
                                                                            hintText: 'Clock in Time',
                                                                            hintStyle: const TextStyle(fontSize: 13),
                                                                            prefixIcon: const Icon(Icons.lock_clock),
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Clock Out',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          // onTap: () => _checkOutSelectTime(context),
                                                                          controller: checkOutController,
                                                                          decoration: InputDecoration(
                                                                            enabled: false,
                                                                            hintText: 'Clock out Time',
                                                                            hintStyle: const TextStyle(fontSize: 13),
                                                                            prefixIcon: const Icon(Icons.lock_clock),
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Reason',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          decoration: InputDecoration(
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    const SizedBox(height: 40,),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child: InkWell(
                                                                          onTap: (){
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                  color: ColorList.backgroundColor),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Center(
                                                                                    child: TextData(
                                                                                      name: StringList.submit,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )

                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ):const SizedBox();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  color:morningCloseTimeInSeconds<morningClockInTimeInSeconds?Colors.red:Colors.green,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                                                      TextData(name:clockIn,color: Colors.white,fontSize: 10,),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        clockOut.isNotEmpty?Padding(
                                          padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0),
                                          child: InkWell(
                                            onTap: () async {
                                              checkInController.text=DateFormat('hh : mm a').format(clockTimeCheck);
                                              checkOutController.text=DateFormat('hh : mm a').format(DateTime.parse(value.filteredUserAttendanceDetail[index].checkOut.toString()));
                                              totalWorkingHour<=dayWorkedHour?const SizedBox():showDialog(
                                                  context: context,
                                                  builder: (_) =>  ListView(
                                                    children: [
                                                      AlertDialog(
                                                          contentPadding: EdgeInsets.zero,
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          insetPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 100),
                                                          content:Container(
                                                            // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                color: Colors.white
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: [
                                                                    Align(
                                                                        alignment: Alignment.bottomRight,
                                                                        child: IconButton(onPressed: (){
                                                                          Navigator.pop(context);
                                                                        }, icon: const Icon(Icons.close))),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10),
                                                                      child: TextData(
                                                                        name: 'Regularize Clock Out',
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 25,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 10,),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Date',),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                                                      child: Container(
                                                                        height: 45,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                                          color: Colors.grey.shade200,),
                                                                        child: Row(
                                                                          children: [
                                                                            const SizedBox(width: 10,),
                                                                            const Icon(Icons.calendar_month),
                                                                            const SizedBox(width: 10,),
                                                                            TextData(name: DateFormat("dd/MM/yyy").format(clockTimeCheck)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Clock In',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          onTap: () {
                                                                            // _selectTime(context);
                                                                          },
                                                                          controller: checkInController,
                                                                          decoration: InputDecoration(
                                                                            hintText: 'Clock in Time',
                                                                            enabled: false,
                                                                            hintStyle: const TextStyle(fontSize: 13),
                                                                            prefixIcon: const Icon(Icons.lock_clock),
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                                                    //   child: Container(
                                                                    //     height: 45,
                                                                    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                                    //       color: Colors.grey.shade200,),
                                                                    //     child: Row(
                                                                    //       children: [
                                                                    //         SizedBox(width: 10,),
                                                                    //         Icon(Icons.calendar_month),
                                                                    //         SizedBox(width: 10,),
                                                                    //         TextData(name: '10:03')
                                                                    //       ],
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Clock Out',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          onTap: () => _checkOutSelectTime(context),
                                                                          controller: checkOutController,
                                                                          decoration: InputDecoration(
                                                                            hintText: 'Clock out Time',
                                                                            hintStyle: const TextStyle(fontSize: 13),
                                                                            prefixIcon: const Icon(Icons.lock_clock),
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                                                      child: TextData(name: 'Reason',),
                                                                    ),
                                                                    Padding(
                                                                        padding:
                                                                        const EdgeInsets.only(left: 10, right: 10, ),
                                                                        child: TextFormField(
                                                                          decoration: InputDecoration(
                                                                            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                                                                            border: OutlineInputBorder(
                                                                                borderSide: BorderSide.none,
                                                                                borderRadius: BorderRadius.circular(10)
                                                                            ),
                                                                            fillColor: Colors.grey.shade200,
                                                                            filled: true,
                                                                          ),
                                                                        )
                                                                    ),
                                                                    const SizedBox(height: 40,),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child: InkWell(
                                                                          onTap: (){
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child: Container(
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                  color: ColorList.backgroundColor),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Center(
                                                                                    child: TextData(
                                                                                      name: StringList.submit,
                                                                                      color: Colors.white,
                                                                                    )),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )

                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              );
                                              // await showDialog(context: context,builder: (context) {
                                              //    return Container(
                                              //     margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                                              //     decoration: BoxDecoration(
                                              //         borderRadius: BorderRadius.circular(20),
                                              //         color: Colors.white
                                              //     ),
                                              //     child: Column(
                                              //       crossAxisAlignment: CrossAxisAlignment.stretch,
                                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //       children: [
                                              //         Column(
                                              //           crossAxisAlignment: CrossAxisAlignment.stretch,
                                              //           children: [
                                              //             Align(
                                              //               alignment: Alignment.bottomRight,
                                              //                 child: IconButton(onPressed: (){
                                              //                   Navigator.pop(context);
                                              //                 }, icon: Icon(Icons.close))),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 10),
                                              //               child: TextData(
                                              //                 name: 'Regularize',
                                              //                 fontWeight: FontWeight.bold,
                                              //                 fontSize: 25,
                                              //               ),
                                              //             ),
                                              //             const SizedBox(height: 10,),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                              //               child: TextData(name: 'Date',),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                              //               child: Container(
                                              //                 height: 45,
                                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                              //                   color: Colors.grey.shade200,),
                                              //                 child: Row(
                                              //                   children: [
                                              //                     SizedBox(width: 10,),
                                              //                     Icon(Icons.calendar_month),
                                              //                     SizedBox(width: 10,),
                                              //                     TextData(name: '09/07/2024')
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                              //               child: TextData(name: 'Clock In',),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                              //               child: Container(
                                              //                 height: 45,
                                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                              //                   color: Colors.grey.shade200,),
                                              //                 child: Row(
                                              //                   children: [
                                              //                     SizedBox(width: 10,),
                                              //                     Icon(Icons.calendar_month),
                                              //                     SizedBox(width: 10,),
                                              //                     TextData(name: '10:03')
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                              //               child: TextData(name: 'Clock Out',),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                              //               child: Container(
                                              //                 height: 45,
                                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                              //                   color: Colors.grey.shade200,),
                                              //                 child: Row(
                                              //                   children: [
                                              //                     SizedBox(width: 10,),
                                              //                     Icon(Icons.calendar_month),
                                              //                     SizedBox(width: 10,),
                                              //                     TextData(name: '06:03')
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                                              //               child: TextData(name: 'Reason',),
                                              //             ),
                                              //             Padding(
                                              //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                              //               child: Container(
                                              //                 height: 150,
                                              //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                              //                   color: Colors.grey.shade200,),
                                              //
                                              //               ),
                                              //             )
                                              //           ],
                                              //         ),
                                              //
                                              //         Padding(
                                              //           padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                                              //           child: Row(
                                              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //             children: [
                                              //               Expanded(
                                              //                 child: Container(
                                              //                     decoration: BoxDecoration(
                                              //                         borderRadius: BorderRadius.circular(30),
                                              //                         color: ColorList.backgroundColor),
                                              //                     child: Padding(
                                              //                       padding: const EdgeInsets.all(15),
                                              //                       child: Center(
                                              //                           child: TextData(
                                              //                             name: StringList.submit,
                                              //                             color: Colors.white,
                                              //                           )),
                                              //                     )),
                                              //               ),
                                              //             ],
                                              //           ),
                                              //         )
                                              //
                                              //       ],
                                              //     ),
                                              //   );
                                              // },);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  color:totalWorkingHour<=dayWorkedHour?Colors.green:Colors.red,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                                                      TextData(name:clockOut,color: Colors.white,fontSize: 10,),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ):const SizedBox(),
                                        totalHr!=null &&totalHr!=""?Padding(
                                          padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                color:Colors.blue,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    TextData(name: 'Total working hours ',color: Colors.white,fontSize: 10,),
                                                    TextData(name:value.filteredUserAttendanceDetail[index].totalWorkingHours,color: Colors.white,fontSize: 10,),
                                                  ],
                                                ),
                                              )),
                                        ):const SizedBox(),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },),),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: InkWell(
                  //     onTap: () async {
                  //       print('sdfffsdfsd');
                  //       print('sdfffsdfsd');
                  //       print('sdfffsdfsd');
                  //       aData();
                  //     },
                  //     child: Container(
                  //       color: Colors.blue,
                  //       height: 50,
                  //       width: 50,
                  //       child: Center(child: Text('dsfdsf')),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: filteredDateStrings.length,
                  //     itemBuilder: (context, index) {
                  //       var day = DateFormat("EEE").format(DateTime.parse(filteredDateStrings[index].checkIn.toString()??""));
                  //       var date = DateFormat("dd").format(DateTime.parse(filteredDateStrings[index].checkIn.toString()??''));
                  //       var month = DateFormat("MMMM").format(DateTime.parse(filteredDateStrings[index].checkIn.toString()??''));
                  //       return Padding(
                  //         padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5,bottom: 5),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               boxShadow: const [BoxShadow(
                  //                   color: Colors.black12,
                  //                   blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //               )],
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(10)),
                  //           child: Row(
                  //             children: [
                  //               Expanded(child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   TextData(name: day,fontSize: 10,),
                  //                   TextData(name: date,fontSize: 17,),
                  //                   TextData(name: month,fontSize: 10,),
                  //                 ],
                  //               )),
                  //               Expanded(
                  //                   flex: 5,
                  //                   child: Column(
                  //                     crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                     children: [
                  //                       Padding(
                  //                         padding:  const EdgeInsets.only(top: 8.0,left: 8.0,right: 5.0,bottom: 4.0),
                  //                         child: InkWell(
                  //                           onTap: () async {
                  //                             showDialog(
                  //                                 context: context,
                  //                                 builder: (_) =>  ListView(
                  //                                   children: [
                  //                                     AlertDialog(
                  //                                         contentPadding: EdgeInsets.zero,
                  //                                         clipBehavior: Clip.antiAliasWithSaveLayer,
                  //                                         insetPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 100),
                  //                                         content:Container(
                  //                                           // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                  //                                           decoration: BoxDecoration(
                  //                                               borderRadius: BorderRadius.circular(20),
                  //                                               color: Colors.white
                  //                                           ),
                  //                                           child: Column(
                  //                                             crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                             children: [
                  //                                               Column(
                  //                                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                                                 children: [
                  //                                                   Align(
                  //                                                       alignment: Alignment.bottomRight,
                  //                                                       child: IconButton(onPressed: (){
                  //                                                         Navigator.pop(context);
                  //                                                       }, icon: Icon(Icons.close))),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 10),
                  //                                                     child: TextData(
                  //                                                       name: 'Regularize',
                  //                                                       fontWeight: FontWeight.bold,
                  //                                                       fontSize: 25,
                  //                                                     ),
                  //                                                   ),
                  //                                                   const SizedBox(height: 10,),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                                                     child: TextData(name: 'Date',),
                  //                                                   ),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                                                     child: Container(
                  //                                                       height: 45,
                  //                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                                                         color: Colors.grey.shade200,),
                  //                                                       child: Row(
                  //                                                         children: [
                  //                                                           SizedBox(width: 10,),
                  //                                                           Icon(Icons.calendar_month),
                  //                                                           SizedBox(width: 10,),
                  //                                                           TextData(name: '09/07/2024')
                  //                                                         ],
                  //                                                       ),
                  //                                                     ),
                  //                                                   ),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                                                     child: TextData(name: 'Clock In',),
                  //                                                   ),
                  //                                                   Padding(
                  //                                                       padding:
                  //                                                       const EdgeInsets.only(left: 10, right: 10, ),
                  //                                                       child: TextFormField(
                  //                                                         onTap: () => _selectTime(context),
                  //                                                         controller: checkInController,
                  //                                                         decoration: InputDecoration(
                  //                                                           hintText: 'Clock in Time',
                  //                                                           hintStyle: const TextStyle(fontSize: 13),
                  //                                                           prefixIcon: const Icon(Icons.lock_clock),
                  //                                                           contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //                                                           border: OutlineInputBorder(
                  //                                                               borderSide: BorderSide.none,
                  //                                                               borderRadius: BorderRadius.circular(10)
                  //                                                           ),
                  //                                                           fillColor: Colors.grey.shade200,
                  //                                                           filled: true,
                  //                                                         ),
                  //                                                       )
                  //                                                   ),
                  //                                                   // Padding(
                  //                                                   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                                                   //   child: Container(
                  //                                                   //     height: 45,
                  //                                                   //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                                                   //       color: Colors.grey.shade200,),
                  //                                                   //     child: Row(
                  //                                                   //       children: [
                  //                                                   //         SizedBox(width: 10,),
                  //                                                   //         Icon(Icons.calendar_month),
                  //                                                   //         SizedBox(width: 10,),
                  //                                                   //         TextData(name: '10:03')
                  //                                                   //       ],
                  //                                                   //     ),
                  //                                                   //   ),
                  //                                                   // ),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                                                     child: TextData(name: 'Clock Out',),
                  //                                                   ),
                  //                                                   Padding(
                  //                                                       padding:
                  //                                                       const EdgeInsets.only(left: 10, right: 10, ),
                  //                                                       child: TextFormField(
                  //                                                         onTap: () => _checkOutSelectTime(context),
                  //                                                         controller: checkOutController,
                  //                                                         decoration: InputDecoration(
                  //                                                           hintText: 'Clock out Time',
                  //                                                           hintStyle: const TextStyle(fontSize: 13),
                  //                                                           prefixIcon: const Icon(Icons.lock_clock),
                  //                                                           contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //                                                           border: OutlineInputBorder(
                  //                                                               borderSide: BorderSide.none,
                  //                                                               borderRadius: BorderRadius.circular(10)
                  //                                                           ),
                  //                                                           fillColor: Colors.grey.shade200,
                  //                                                           filled: true,
                  //                                                         ),
                  //                                                       )
                  //                                                   ),
                  //                                                   Padding(
                  //                                                     padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                                                     child: TextData(name: 'Reason',),
                  //                                                   ),
                  //                                                   Padding(
                  //                                                       padding:
                  //                                                       const EdgeInsets.only(left: 10, right: 10, ),
                  //                                                       child: TextFormField(
                  //                                                         decoration: InputDecoration(
                  //                                                           contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //                                                           border: OutlineInputBorder(
                  //                                                               borderSide: BorderSide.none,
                  //                                                               borderRadius: BorderRadius.circular(10)
                  //                                                           ),
                  //                                                           fillColor: Colors.grey.shade200,
                  //                                                           filled: true,
                  //                                                         ),
                  //                                                       )
                  //                                                   ),
                  //                                                   const SizedBox(height: 40,),
                  //                                                 ],
                  //                                               ),
                  //                                               Padding(
                  //                                                 padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                  //                                                 child: Row(
                  //                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                                   children: [
                  //                                                     Expanded(
                  //                                                       child: InkWell(
                  //                                                         onTap: (){
                  //                                                           Navigator.pop(context);
                  //                                                         },
                  //                                                         child: Container(
                  //                                                             decoration: BoxDecoration(
                  //                                                                 borderRadius: BorderRadius.circular(30),
                  //                                                                 color: ColorList.backgroundColor),
                  //                                                             child: Padding(
                  //                                                               padding: const EdgeInsets.all(15),
                  //                                                               child: Center(
                  //                                                                   child: TextData(
                  //                                                                     name: StringList.submit,
                  //                                                                     color: Colors.white,
                  //                                                                   )),
                  //                                                             )),
                  //                                                       ),
                  //                                                     ),
                  //                                                   ],
                  //                                                 ),
                  //                                               )
                  //
                  //                                             ],
                  //                                           ),
                  //                                         )
                  //                                     ),
                  //                                   ],
                  //                                 )
                  //                             );
                  //                             // await showDialog(context: context,builder: (context) {
                  //                             //    return Container(
                  //                             //     margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                  //                             //     decoration: BoxDecoration(
                  //                             //         borderRadius: BorderRadius.circular(20),
                  //                             //         color: Colors.white
                  //                             //     ),
                  //                             //     child: Column(
                  //                             //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                             //       children: [
                  //                             //         Column(
                  //                             //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //                             //           children: [
                  //                             //             Align(
                  //                             //               alignment: Alignment.bottomRight,
                  //                             //                 child: IconButton(onPressed: (){
                  //                             //                   Navigator.pop(context);
                  //                             //                 }, icon: Icon(Icons.close))),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 10),
                  //                             //               child: TextData(
                  //                             //                 name: 'Regularize',
                  //                             //                 fontWeight: FontWeight.bold,
                  //                             //                 fontSize: 25,
                  //                             //               ),
                  //                             //             ),
                  //                             //             const SizedBox(height: 10,),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                             //               child: TextData(name: 'Date',),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                             //               child: Container(
                  //                             //                 height: 45,
                  //                             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                             //                   color: Colors.grey.shade200,),
                  //                             //                 child: Row(
                  //                             //                   children: [
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     Icon(Icons.calendar_month),
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     TextData(name: '09/07/2024')
                  //                             //                   ],
                  //                             //                 ),
                  //                             //               ),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                             //               child: TextData(name: 'Clock In',),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                             //               child: Container(
                  //                             //                 height: 45,
                  //                             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                             //                   color: Colors.grey.shade200,),
                  //                             //                 child: Row(
                  //                             //                   children: [
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     Icon(Icons.calendar_month),
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     TextData(name: '10:03')
                  //                             //                   ],
                  //                             //                 ),
                  //                             //               ),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                             //               child: TextData(name: 'Clock Out',),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                             //               child: Container(
                  //                             //                 height: 45,
                  //                             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                             //                   color: Colors.grey.shade200,),
                  //                             //                 child: Row(
                  //                             //                   children: [
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     Icon(Icons.calendar_month),
                  //                             //                     SizedBox(width: 10,),
                  //                             //                     TextData(name: '06:03')
                  //                             //                   ],
                  //                             //                 ),
                  //                             //               ),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //                             //               child: TextData(name: 'Reason',),
                  //                             //             ),
                  //                             //             Padding(
                  //                             //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //                             //               child: Container(
                  //                             //                 height: 150,
                  //                             //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //                             //                   color: Colors.grey.shade200,),
                  //                             //
                  //                             //               ),
                  //                             //             )
                  //                             //           ],
                  //                             //         ),
                  //                             //
                  //                             //         Padding(
                  //                             //           padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                  //                             //           child: Row(
                  //                             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                             //             children: [
                  //                             //               Expanded(
                  //                             //                 child: Container(
                  //                             //                     decoration: BoxDecoration(
                  //                             //                         borderRadius: BorderRadius.circular(30),
                  //                             //                         color: ColorList.backgroundColor),
                  //                             //                     child: Padding(
                  //                             //                       padding: const EdgeInsets.all(15),
                  //                             //                       child: Center(
                  //                             //                           child: TextData(
                  //                             //                             name: StringList.submit,
                  //                             //                             color: Colors.white,
                  //                             //                           )),
                  //                             //                     )),
                  //                             //               ),
                  //                             //             ],
                  //                             //           ),
                  //                             //         )
                  //                             //
                  //                             //       ],
                  //                             //     ),
                  //                             //   );
                  //                             // },);
                  //                           },
                  //                           child: Container(
                  //                               decoration: BoxDecoration(
                  //                                 borderRadius: BorderRadius.circular(7),
                  //                                 color:Colors.amber,
                  //                               ),
                  //                               child: Padding(
                  //                                 padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //                                 child: Row(
                  //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                   children: [
                  //                                     TextData(name: 'Project Plan',color: Colors.white,fontSize: 10,),
                  //                                     TextData(name:'09:10 AM - 10:00 AM',color: Colors.white,fontSize: 10,),
                  //                                   ],
                  //                                 ),
                  //                               )),
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(right: 5.0,left: 8.0,),
                  //                         child: Container(
                  //                             decoration: BoxDecoration(
                  //                               borderRadius: BorderRadius.circular(7),
                  //                               color:Colors.red,
                  //                             ),
                  //                             child: Padding(
                  //                               padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //                               child: Row(
                  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                 children: [
                  //                                   TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //                                   TextData(name:'11:10 AM ',color: Colors.white,fontSize: 10,),
                  //                                 ],
                  //                               ),
                  //                             )),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 8.0),
                  //                         child: Container(
                  //                             decoration: BoxDecoration(
                  //                               borderRadius: BorderRadius.circular(7),
                  //                               color:Colors.green,
                  //                             ),
                  //                             child: Padding(
                  //                               padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //                               child: Row(
                  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                 children: [
                  //                                   TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //                                   TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //                                 ],
                  //                               ),
                  //                             )),
                  //                       ),
                  //                     ],
                  //                   )),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     // children: [
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Mon',fontSize: 10,),
                  //     //   //             TextData(name: '1',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding:  const EdgeInsets.only(top: 8.0,left: 8.0,right: 5.0,bottom: 4.0),
                  //     //   //                   child: InkWell(
                  //     //   //                     onTap: () async {
                  //     //   //                       showDialog(
                  //     //   //                           context: context,
                  //     //   //                           builder: (_) =>  ListView(
                  //     //   //                             children: [
                  //     //   //                               AlertDialog(
                  //     //   //                                   contentPadding: EdgeInsets.zero,
                  //     //   //                                   clipBehavior: Clip.antiAliasWithSaveLayer,
                  //     //   //                                   insetPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 100),
                  //     //   //                                   content:Container(
                  //     //   //                                     // margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                  //     //   //                                     decoration: BoxDecoration(
                  //     //   //                                         borderRadius: BorderRadius.circular(20),
                  //     //   //                                         color: Colors.white
                  //     //   //                                     ),
                  //     //   //                                     child: Column(
                  //     //   //                                       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                                       children: [
                  //     //   //                                         Column(
                  //     //   //                                           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //                                           children: [
                  //     //   //                                             Align(
                  //     //   //                                                 alignment: Alignment.bottomRight,
                  //     //   //                                                 child: IconButton(onPressed: (){
                  //     //   //                                                   Navigator.pop(context);
                  //     //   //                                                 }, icon: Icon(Icons.close))),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 10),
                  //     //   //                                               child: TextData(
                  //     //   //                                                 name: 'Regularize',
                  //     //   //                                                 fontWeight: FontWeight.bold,
                  //     //   //                                                 fontSize: 25,
                  //     //   //                                               ),
                  //     //   //                                             ),
                  //     //   //                                             const SizedBox(height: 10,),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                                               child: TextData(name: 'Date',),
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                                               child: Container(
                  //     //   //                                                 height: 45,
                  //     //   //                                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                                                   color: Colors.grey.shade200,),
                  //     //   //                                                 child: Row(
                  //     //   //                                                   children: [
                  //     //   //                                                     SizedBox(width: 10,),
                  //     //   //                                                     Icon(Icons.calendar_month),
                  //     //   //                                                     SizedBox(width: 10,),
                  //     //   //                                                     TextData(name: '09/07/2024')
                  //     //   //                                                   ],
                  //     //   //                                                 ),
                  //     //   //                                               ),
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                                               child: TextData(name: 'Clock In',),
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                                 padding:
                  //     //   //                                                 const EdgeInsets.only(left: 10, right: 10, ),
                  //     //   //                                                 child: TextFormField(
                  //     //   //                                                   onTap: () => _selectTime(context),
                  //     //   //                                                   controller: checkInController,
                  //     //   //                                                   decoration: InputDecoration(
                  //     //   //                                                     hintText: 'Clock in Time',
                  //     //   //                                                     hintStyle: const TextStyle(fontSize: 13),
                  //     //   //                                                     prefixIcon: const Icon(Icons.lock_clock),
                  //     //   //                                                     contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //     //   //                                                     border: OutlineInputBorder(
                  //     //   //                                                         borderSide: BorderSide.none,
                  //     //   //                                                         borderRadius: BorderRadius.circular(10)
                  //     //   //                                                     ),
                  //     //   //                                                     fillColor: Colors.grey.shade200,
                  //     //   //                                                     filled: true,
                  //     //   //                                                   ),
                  //     //   //                                                 )
                  //     //   //                                             ),
                  //     //   //                                             // Padding(
                  //     //   //                                             //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                                             //   child: Container(
                  //     //   //                                             //     height: 45,
                  //     //   //                                             //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                                             //       color: Colors.grey.shade200,),
                  //     //   //                                             //     child: Row(
                  //     //   //                                             //       children: [
                  //     //   //                                             //         SizedBox(width: 10,),
                  //     //   //                                             //         Icon(Icons.calendar_month),
                  //     //   //                                             //         SizedBox(width: 10,),
                  //     //   //                                             //         TextData(name: '10:03')
                  //     //   //                                             //       ],
                  //     //   //                                             //     ),
                  //     //   //                                             //   ),
                  //     //   //                                             // ),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                                               child: TextData(name: 'Clock Out',),
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                                 padding:
                  //     //   //                                                 const EdgeInsets.only(left: 10, right: 10, ),
                  //     //   //                                                 child: TextFormField(
                  //     //   //                                                   onTap: () => _checkOutSelectTime(context),
                  //     //   //                                                   controller: checkOutController,
                  //     //   //                                                   decoration: InputDecoration(
                  //     //   //                                                     hintText: 'Clock out Time',
                  //     //   //                                                     hintStyle: const TextStyle(fontSize: 13),
                  //     //   //                                                     prefixIcon: const Icon(Icons.lock_clock),
                  //     //   //                                                     contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //     //   //                                                     border: OutlineInputBorder(
                  //     //   //                                                         borderSide: BorderSide.none,
                  //     //   //                                                         borderRadius: BorderRadius.circular(10)
                  //     //   //                                                     ),
                  //     //   //                                                     fillColor: Colors.grey.shade200,
                  //     //   //                                                     filled: true,
                  //     //   //                                                   ),
                  //     //   //                                                 )
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                                               child: TextData(name: 'Reason',),
                  //     //   //                                             ),
                  //     //   //                                             Padding(
                  //     //   //                                                 padding:
                  //     //   //                                                 const EdgeInsets.only(left: 10, right: 10, ),
                  //     //   //                                                 child: TextFormField(
                  //     //   //                                                   decoration: InputDecoration(
                  //     //   //                                                     contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
                  //     //   //                                                     border: OutlineInputBorder(
                  //     //   //                                                         borderSide: BorderSide.none,
                  //     //   //                                                         borderRadius: BorderRadius.circular(10)
                  //     //   //                                                     ),
                  //     //   //                                                     fillColor: Colors.grey.shade200,
                  //     //   //                                                     filled: true,
                  //     //   //                                                   ),
                  //     //   //                                                 )
                  //     //   //                                             ),
                  //     //   //                                             const SizedBox(height: 40,),
                  //     //   //                                           ],
                  //     //   //                                         ),
                  //     //   //                                         Padding(
                  //     //   //                                           padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                  //     //   //                                           child: Row(
                  //     //   //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                                             children: [
                  //     //   //                                               Expanded(
                  //     //   //                                                 child: InkWell(
                  //     //   //                                                   onTap: (){
                  //     //   //                                                     Navigator.pop(context);
                  //     //   //                                                   },
                  //     //   //                                                   child: Container(
                  //     //   //                                                       decoration: BoxDecoration(
                  //     //   //                                                           borderRadius: BorderRadius.circular(30),
                  //     //   //                                                           color: ColorList.backgroundColor),
                  //     //   //                                                       child: Padding(
                  //     //   //                                                         padding: const EdgeInsets.all(15),
                  //     //   //                                                         child: Center(
                  //     //   //                                                             child: TextData(
                  //     //   //                                                               name: StringList.submit,
                  //     //   //                                                               color: Colors.white,
                  //     //   //                                                             )),
                  //     //   //                                                       )),
                  //     //   //                                                 ),
                  //     //   //                                               ),
                  //     //   //                                             ],
                  //     //   //                                           ),
                  //     //   //                                         )
                  //     //   //
                  //     //   //                                       ],
                  //     //   //                                     ),
                  //     //   //                                   )
                  //     //   //                               ),
                  //     //   //                             ],
                  //     //   //                           )
                  //     //   //                       );
                  //     //   //                       // await showDialog(context: context,builder: (context) {
                  //     //   //                       //    return Container(
                  //     //   //                       //     margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                  //     //   //                       //     decoration: BoxDecoration(
                  //     //   //                       //         borderRadius: BorderRadius.circular(20),
                  //     //   //                       //         color: Colors.white
                  //     //   //                       //     ),
                  //     //   //                       //     child: Column(
                  //     //   //                       //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //                       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                       //       children: [
                  //     //   //                       //         Column(
                  //     //   //                       //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //                       //           children: [
                  //     //   //                       //             Align(
                  //     //   //                       //               alignment: Alignment.bottomRight,
                  //     //   //                       //                 child: IconButton(onPressed: (){
                  //     //   //                       //                   Navigator.pop(context);
                  //     //   //                       //                 }, icon: Icon(Icons.close))),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 10),
                  //     //   //                       //               child: TextData(
                  //     //   //                       //                 name: 'Regularize',
                  //     //   //                       //                 fontWeight: FontWeight.bold,
                  //     //   //                       //                 fontSize: 25,
                  //     //   //                       //               ),
                  //     //   //                       //             ),
                  //     //   //                       //             const SizedBox(height: 10,),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                       //               child: TextData(name: 'Date',),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                       //               child: Container(
                  //     //   //                       //                 height: 45,
                  //     //   //                       //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                       //                   color: Colors.grey.shade200,),
                  //     //   //                       //                 child: Row(
                  //     //   //                       //                   children: [
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     Icon(Icons.calendar_month),
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     TextData(name: '09/07/2024')
                  //     //   //                       //                   ],
                  //     //   //                       //                 ),
                  //     //   //                       //               ),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                       //               child: TextData(name: 'Clock In',),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                       //               child: Container(
                  //     //   //                       //                 height: 45,
                  //     //   //                       //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                       //                   color: Colors.grey.shade200,),
                  //     //   //                       //                 child: Row(
                  //     //   //                       //                   children: [
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     Icon(Icons.calendar_month),
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     TextData(name: '10:03')
                  //     //   //                       //                   ],
                  //     //   //                       //                 ),
                  //     //   //                       //               ),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                       //               child: TextData(name: 'Clock Out',),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                       //               child: Container(
                  //     //   //                       //                 height: 45,
                  //     //   //                       //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                       //                   color: Colors.grey.shade200,),
                  //     //   //                       //                 child: Row(
                  //     //   //                       //                   children: [
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     Icon(Icons.calendar_month),
                  //     //   //                       //                     SizedBox(width: 10,),
                  //     //   //                       //                     TextData(name: '06:03')
                  //     //   //                       //                   ],
                  //     //   //                       //                 ),
                  //     //   //                       //               ),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 5.0),
                  //     //   //                       //               child: TextData(name: 'Reason',),
                  //     //   //                       //             ),
                  //     //   //                       //             Padding(
                  //     //   //                       //               padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  //     //   //                       //               child: Container(
                  //     //   //                       //                 height: 150,
                  //     //   //                       //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  //     //   //                       //                   color: Colors.grey.shade200,),
                  //     //   //                       //
                  //     //   //                       //               ),
                  //     //   //                       //             )
                  //     //   //                       //           ],
                  //     //   //                       //         ),
                  //     //   //                       //
                  //     //   //                       //         Padding(
                  //     //   //                       //           padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15),
                  //     //   //                       //           child: Row(
                  //     //   //                       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                       //             children: [
                  //     //   //                       //               Expanded(
                  //     //   //                       //                 child: Container(
                  //     //   //                       //                     decoration: BoxDecoration(
                  //     //   //                       //                         borderRadius: BorderRadius.circular(30),
                  //     //   //                       //                         color: ColorList.backgroundColor),
                  //     //   //                       //                     child: Padding(
                  //     //   //                       //                       padding: const EdgeInsets.all(15),
                  //     //   //                       //                       child: Center(
                  //     //   //                       //                           child: TextData(
                  //     //   //                       //                             name: StringList.submit,
                  //     //   //                       //                             color: Colors.white,
                  //     //   //                       //                           )),
                  //     //   //                       //                     )),
                  //     //   //                       //               ),
                  //     //   //                       //             ],
                  //     //   //                       //           ),
                  //     //   //                       //         )
                  //     //   //                       //
                  //     //   //                       //       ],
                  //     //   //                       //     ),
                  //     //   //                       //   );
                  //     //   //                       // },);
                  //     //   //                     },
                  //     //   //                     child: Container(
                  //     //   //                         decoration: BoxDecoration(
                  //     //   //                           borderRadius: BorderRadius.circular(7),
                  //     //   //                           color:Colors.amber,
                  //     //   //                         ),
                  //     //   //                         child: Padding(
                  //     //   //                           padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                           child: Row(
                  //     //   //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                             children: [
                  //     //   //                               TextData(name: 'Project Plan',color: Colors.white,fontSize: 10,),
                  //     //   //                               TextData(name:'09:10 AM - 10:00 AM',color: Colors.white,fontSize: 10,),
                  //     //   //                             ],
                  //     //   //                           ),
                  //     //   //                         )),
                  //     //   //                   ),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.red,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'11:10 AM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Tue',fontSize: 10,),
                  //     //   //             TextData(name: '2',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'9:30 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Wed',fontSize: 10,),
                  //     //   //             TextData(name: '3',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'9:30 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Thu',fontSize: 10,),
                  //     //   //             TextData(name: '4',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'9:30 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 4.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Sick Leave',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'Approved ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Fri',fontSize: 10,),
                  //     //   //             TextData(name: '5',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'9:30 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 4.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'6:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.red,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Personal Leave',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'Rejected ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // Padding(
                  //     //   //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
                  //     //   //   child: Container(
                  //     //   //     decoration: BoxDecoration(
                  //     //   //         boxShadow: const [BoxShadow(
                  //     //   //             color: Colors.black12,
                  //     //   //             blurRadius: 2,spreadRadius:1,offset: Offset(1, 1)
                  //     //   //         )],
                  //     //   //         color: Colors.white,
                  //     //   //         borderRadius: BorderRadius.circular(10)),
                  //     //   //     child: Row(
                  //     //   //       children: [
                  //     //   //         Expanded(child: Column(
                  //     //   //           mainAxisAlignment: MainAxisAlignment.center,
                  //     //   //           children: [
                  //     //   //             TextData(name: 'Sat',fontSize: 10,),
                  //     //   //             TextData(name: '6',fontSize: 17,),
                  //     //   //           ],
                  //     //   //         )),
                  //     //   //         Expanded(
                  //     //   //             flex: 5,
                  //     //   //             child: Column(
                  //     //   //               crossAxisAlignment: CrossAxisAlignment.stretch,
                  //     //   //               children: [
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 8.0,),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.green,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock In',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'9:30 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,top: 4.0,bottom: 4.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.red,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Clock out',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'5:00 PM ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //                 Padding(
                  //     //   //                   padding: const EdgeInsets.only(right: 5.0,left: 8.0,bottom: 8.0),
                  //     //   //                   child: Container(
                  //     //   //                       decoration: BoxDecoration(
                  //     //   //                         borderRadius: BorderRadius.circular(7),
                  //     //   //                         color:Colors.blue,
                  //     //   //                       ),
                  //     //   //                       child: Padding(
                  //     //   //                         padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 8.0,left: 8.0),
                  //     //   //                         child: Row(
                  //     //   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //   //                           children: [
                  //     //   //                             TextData(name: 'Casual Leave',color: Colors.white,fontSize: 10,),
                  //     //   //                             TextData(name:'Pending ',color: Colors.white,fontSize: 10,),
                  //     //   //                           ],
                  //     //   //                         ),
                  //     //   //                       )),
                  //     //   //                 ),
                  //     //   //               ],
                  //     //   //             )),
                  //     //   //       ],
                  //     //   //     ),
                  //     //   //   ),
                  //     //   // ),
                  //     //   // const SizedBox(height: 10,),
                  //     //   // SizedBox(height: 70,),
                  //     //
                  //     // ],
                  //   ),
                  // ),

                ],
              );
            },),

            Consumer<ProviderNotifier>(builder: (context, value, child) {
              return  Center(child: value.loading?const CircularProgressIndicator():const SizedBox());
            },)
          ],
        ),
      ),
    );
  }

}
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
}
