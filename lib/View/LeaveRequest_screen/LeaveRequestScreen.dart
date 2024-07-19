import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/Widget/TextWidget.dart';
import '../../Model/UserLeaveRequestQuery_model.dart';
import '../Home_screen/Components/bottomNavigationWidget.dart';
import '../NewLeave_screen/NewLeave_screen.dart';

class LeaveRequestScreen extends StatefulWidget {
  final bool? isFromHome;
  const LeaveRequestScreen({super.key, this.isFromHome});

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
                      widget.isFromHome==false ?Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // context.go('/${RouteNames.bottomNavigation}');
                            Navigator.pop(context);
                          },
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
                      ):const SizedBox(),
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
                        return const Center(child: SizedBox(
                            child: Image(image: AssetImage('Images/noDataFound.png'))));
                      }
                      return ListView.builder(
                        itemCount: length??0,
                        itemBuilder: (context, index) {
                          String fromDate = DateFormat('yyyy-MM-dd').format(data![index].leaveFrom!);
                          String toDate = DateFormat('yyyy-MM-dd').format(data[index].leaveTill!);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 125,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(2, 2)
                                  )]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextData(name:'${value.userLeaveRequestQueryModel?.leaveRequestsByMe![index].requestedOn}',color: Colors.grey,fontSize: 12,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: Colors.green[200]
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5),
                                                          child: Text('Pending',style: TextStyle(fontSize: 10,color: ColorList.backgroundColor),),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              TextData(name: '${value.userLeaveRequestQueryModel?.leaveRequestsByMe![index].leaveType}',fontSize: 16,fontWeight: FontWeight.bold,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextData(name: 'From: $fromDate TO: $toDate',fontSize: 11,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 15),
                                                    child: TextData(name: '${value.userLeaveRequestQueryModel?.leaveRequestsByMe![index].totalDays} Days',fontSize: 20,fontWeight: FontWeight.bold,),
                                                  )
                                                ],
                                              ),
                                              TextData(name: '${value.userLeaveRequestQueryModel?.leaveRequestsByMe![index].reason}',fontSize: 12,)

                                            ],
                                          ),
                                        ),
                                      )),
                                  Expanded(child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                      color: ColorList.backgroundColor
                                    ),
                                  )),
                                ],
                              ),
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

              },),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewLeavePage(),));
                              // context.go('/${RouteNames.newLeavePage}');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorList.backgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  widget.isFromHome==false?const SafeArea(child: SizedBox(height: 20,)):const SafeArea(child: SizedBox(height: 60,))
                ],
              )
            ],

          ),
        ),
        // bottomNavigationBar:const CustomBottomNavigationBar(),
        // floatingActionButton: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) => const NewLeavePage(),));
        //         // context.go('/${RouteNames.newLeavePage}');
        //       },
        //       child: Container(
        //         decoration: BoxDecoration(
        //             color: ColorList.backgroundColor,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: const Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Icon(
        //             Icons.add,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
