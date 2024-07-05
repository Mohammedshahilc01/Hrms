import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:hrm/Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import 'package:hrm/Controller/Secure_Storage/Secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/String_list/String_list.dart';
import '../../Controller/Widget/TextFormFieldWidget.dart';
import '../../Controller/Widget/TextWidget.dart';
import '../../Model/UserLogin_model.dart';
import '../Home_screen/Components/LeaveStatus_widget.dart';

class NewLeavePage extends StatefulWidget {
  const NewLeavePage({super.key});

  @override
  _NewLeavePageState createState() => _NewLeavePageState();
}

class _NewLeavePageState extends State<NewLeavePage> {
  DateTime? _selectedFromDate = DateTime.now();
  DateTime? _selectedToDate = DateTime.now();
  UserLoginModel? userLoginModel;
  DateTime now=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedFromDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedFromDate) {
      setState(() {
        _selectedFromDate = picked;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat.yMMMEd().format(date);
  }

  String? causeOfLeave;
  String? typeOfLeave;
  String? selectedItemLeave;
  final List<String> _items = [
    'Casual Leave',
    'Half Day Leave',
    'Sick Leave',
    'Privilege Leave'
  ];
  final List<String> sessionItems = ['Forenoon', 'Afternoon'];
  final List<String> items = [
    'Personal Issue',
    'Emergency',
    'Disease',
    'Death in family',
    'Personal leave',
    'Travel',
    'Daycare child problems',
    'Religious events',
    'Medical Leave',
    'Other'
  ];

  Future<void> getUserData() async {
    final val = await SecureStorage.storage.read(key: SecureStorageKeys.userData);
    userLoginModel = UserLoginModel.fromJson(jsonDecode(val!));
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProviderNotifier>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              context.go('/${RouteNames.leaveRequestScreen}');
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextData(
                      name: 'Leaves Request',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomLeaveStatus(
                              textColor: Colors.green,
                              color: Colors.greenAccent[100],
                              leave: "Casual Leaves",
                              days: 1,
                              icon: const Icon(Icons.hotel_sharp,
                                  size: 23, color: Colors.green)),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomLeaveStatus(
                              color: Colors.red[100],
                              textColor: Colors.red,
                              leave: "Sick Leaves",
                              days: 3,
                              icon: const Icon(Icons.sick,
                                  size: 23, color: Colors.red)),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomLeaveStatus(
                              color: Colors.blue[100],
                              textColor: Colors.blue,
                              leave: "Privilege Leaves",
                              days: 5,
                              icon: const Icon(Icons.leave_bags_at_home,
                                  size: 23, color: Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 8.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Icon(Icons.work_outline, color: Colors.blue),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextData(
                                          name: 'Type',
                                          fontSize: 16,
                                        ),
                                        DropdownButton<String>(
                                          padding: EdgeInsets.zero,
                                          isDense: true,
                                          underline: SizedBox(),
                                          icon: SizedBox.shrink(),
                                          hint: Text('Select The Leave Type'),
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                          value: typeOfLeave,
                                          elevation: 1,
                                          isExpanded: true,
                                          items: _items.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              typeOfLeave = newValue;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          typeOfLeave == "Half Day Leave"
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 8.0),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Icon(Icons.access_alarms_sharp,
                                            color: Colors.blue),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextData(
                                                name: 'Session',
                                                fontSize: 16,
                                              ),
                                              DropdownButton<String>(
                                                padding: EdgeInsets.zero,
                                                isDense: true,
                                                underline: SizedBox(),
                                                icon: SizedBox.shrink(),
                                                hint: Text('Select the Session'),
                                                style: TextStyle(
                                                    fontSize: 14, color: Colors.grey),
                                                value: selectedItemLeave,
                                                elevation: 1,
                                                isExpanded: true,
                                                items:
                                                    sessionItems.map((String item) {
                                                  return DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(item),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedItemLeave = newValue;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 8.0),
                            child: Row(
                              children: [
                                const Expanded(
                                  child:
                                      Icon(Icons.cabin_outlined, color: Colors.blue),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextData(
                                          name: 'Reason',
                                          fontSize: 16,
                                        ),
                                        DropdownButton<String>(
                                          isDense: true,
                                          padding: EdgeInsets.zero,
                                          underline: SizedBox(),
                                          icon: SizedBox.shrink(),
                                          hint: Text('Select The reason'),
                                          value: causeOfLeave,
                                          elevation: 1,
                                          isExpanded: true,
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                          items: items.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              causeOfLeave = newValue;
                                              print(causeOfLeave);
                                              print(causeOfLeave);
                                              print(causeOfLeave);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          causeOfLeave == "Other"
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Form(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(
                                              20, 10, 10, 0),
                                          hintText: "Enter the reason for Leave",
                                          hintStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10),
                                            // borderSide: const BorderSide(color: Colors.black12)
                                          )),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          ListTile(
                            leading: Icon(Icons.calendar_today, color: Colors.blue),
                            title: Text('From'),
                            subtitle: Text(
                              _selectedFromDate == null
                                  ? '$_selectedFromDate'
                                  : '${_formatDate(_selectedFromDate!)}',
                            ),
                            onTap: () => _selectDate(context),
                          ),
                          typeOfLeave != "Half Day Leave"
                              ? ListTile(
                                  leading:
                                      Icon(Icons.calendar_today, color: Colors.blue),
                                  title: Text('To'),
                                  subtitle: Text(
                                    _selectedToDate == null
                                        ? '$_selectedToDate'
                                        : '${_formatDate(_selectedToDate!)}',
                                  ),
                                  onTap: () => _selectToDate(context),
                                )
                              : SizedBox(),
                          // ListTile(
                          //   leading: Icon(Icons.calendar_today, color: Colors.blue),
                          //   title: Text('To'),
                          //   subtitle: Text(_formattedEndDate),
                          //   onTap: () => DatePickerExample()
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SafeArea(
                        child: GestureDetector(
                          onTap: ()  {
                            getUserData();
                            String nowDate = DateFormat('yyyy-MM-dd').format(now);
                            String from = DateFormat('yyyy-MM-dd').format(_selectedFromDate!);
                            String toDate =
                                DateFormat('yyyy-MM-dd').format(_selectedToDate!);
                            String requestDate =
                                DateFormat('yyyy-MM-dd').format(DateTime.now());
                            if(typeOfLeave !=null && causeOfLeave !=null && from != nowDate  && toDate != nowDate){
                              providerData.userAddLeaveMutation(
                                  userLoginModel?.id,
                                  userLoginModel?.teamLeader,
                                  typeOfLeave,
                                  causeOfLeave,
                                  from,
                                  toDate,
                                  requestDate,
                                  context);
                            }
                            else{
                              FlutterToast.print('Please Fill the All Details');
                            }

                            // context.go('/${RouteNames.leaveRequestScreen}');
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
                      )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Consumer<ProviderNotifier>(builder: (context, value, child) {
                if(value.loading){
                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width:  MediaQuery.of(context).size.width,
                      color: Colors.black12,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  );
                }else{
                  return const Text('');
                }

              },)
            ],
          ),
        ),
      ),
    );
  }
}
