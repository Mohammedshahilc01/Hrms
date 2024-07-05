import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Model/UserLeaveRequestQuery_model.dart';
import '../Home_screen/Components/bottomNavigationWidget.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  bool isExpandedAwaiting = false;
  bool isExpandedPending = false;
  bool isExpandedApproved = false;
  bool isExpandedDeclined = false;
  List cardColor=[
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderNotifier>(context).userLeaveRequestQuery(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => context.go('/${RouteNames.bottomNavigation}'),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            context.go('/${RouteNames.newLeavePage}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorList.backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextData(
                      name: 'Leaves',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Expanded(child: Consumer<ProviderNotifier>(
                    builder: (context, value, child) {
                      final length=value.userLeaveRequestQueryModel?.leaveRequestsByMe?.length;
                      final data=value.userLeaveRequestQueryModel?.leaveRequestsByMe;
                      if(length==null || length==0){
                        return const Center(child: Text('No data Found'));
                      }
                      return ListView.builder(
                        itemCount: length??0,
                        itemBuilder: (context, index) {
                          String fromDate = DateFormat('yyyy-MM-dd').format(data![index].leaveFrom!);
                          String toDate = DateFormat('yyyy-MM-dd').format(data[index].leaveTill!);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 5.0),
                                  child: TextData(
                                    name:'${data[index].requestedOn}',
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(color: cardColor[index % cardColor.length])),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 10, top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.stretch,
                                                  children: [
                                                    TextData(
                                                      name: '${data?[index].leaveType}',
                                                      fontSize: 15,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextData(
                                                          name: fromDate,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        TextData(
                                                          name: ' TO ',
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        TextData(
                                                          name: toDate,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextData(
                                                      name: '${data[index].totalDays} Days',
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.red,
                                                    ),
                                                    TextData(
                                                      name: '${data[index].reason}',
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(right: 10),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 8.0, bottom: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      5),
                                                              color: Colors.yellow),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                    left: 8.0,
                                                                    right: 8.0,
                                                                    top: 3,
                                                                    bottom: 3),
                                                            child: Center(
                                                              child: TextData(
                                                                name: '${data?[index].status}',
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .yellow.shade50,
                                                              ),
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      // GestureDetector(
                                                      //     onTap: () {
                                                      //       print(data[index].isExpanded);
                                                      //       setState(() {
                                                      //
                                                      //         isExpandedAwaiting =
                                                      //             !isExpandedAwaiting;
                                                      //       });
                                                      //     },
                                                      //     child: Icon(
                                                      //       isExpandedAwaiting
                                                      //           ? Icons.expand_less
                                                      //           : Icons.expand_more,
                                                      //     )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          height: isExpandedAwaiting ? 35 : 0,
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextData(
                                                    // name: '${data?[index].lastUpdate}',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  Icon(
                                                    Icons.download,
                                                    color: ColorList.backgroundColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )),
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
        // bottomNavigationBar:const CustomBottomNavigationBar(),
      ),
    );
  }
}
