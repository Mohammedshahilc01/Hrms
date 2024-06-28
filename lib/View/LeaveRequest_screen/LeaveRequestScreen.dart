import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

import '../../Controller/Color_list/Color_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => context.go('/homePage'),
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
                      context.go('/NewLeavePage');
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,bottom: 5.0),
                        child: TextData(
                          name: 'December 12',
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
                              border: Border.all(color: Colors.yellow)),
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
                                            name: 'Half Day Application',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Sick Leave',
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
                                      padding: const EdgeInsets.only(right: 10),
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
                                                      name: 'Awaiting',
                                                      fontSize: 13,
                                                      color: Colors.yellow.shade50,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpandedAwaiting =
                                                        !isExpandedAwaiting;
                                                  });
                                                },
                                                child: Icon(
                                                  isExpandedAwaiting
                                                      ? Icons.expand_less
                                                      : Icons.expand_more,
                                                )),
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
                                          name: 'Personal Issue',
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
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,bottom: 5.0),
                        child: TextData(
                          name: 'December 16',
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
                              border: Border.all(color: Colors.red)),
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
                                            name: 'Full Day Application',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Sick Leave',
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
                                      padding: const EdgeInsets.only(right: 10),
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
                                                    color: Colors.red),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Declined',
                                                      fontSize: 13,
                                                      color: Colors.red.shade50,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpandedDeclined =
                                                    !isExpandedDeclined;
                                                  });
                                                },
                                                child: Icon(
                                                  isExpandedDeclined
                                                      ? Icons.expand_less
                                                      : Icons.expand_more,
                                                )),
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
                                height: isExpandedDeclined ? 35 : 0,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
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
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,bottom: 5.0),
                        child: TextData(
                          name: 'December 16',
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
                              border: Border.all(color: Colors.green)),
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
                                            name: '3 Days Application',
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Wed, 20 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(height: 5,),
                                          TextData(
                                            name: 'Privilege Leave',
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
                                      padding: const EdgeInsets.only(right: 10),
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
                                                    color: Colors.green),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Approved',
                                                      fontSize: 13,
                                                      color: Colors.green.shade50,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpandedApproved =
                                                    !isExpandedApproved;
                                                  });
                                                },
                                                child: Icon(
                                                  isExpandedApproved
                                                      ? Icons.expand_less
                                                      : Icons.expand_more,
                                                )),
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
                                height: isExpandedApproved ? 35 : 0,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar:const CustomBottomNavigationBar(),
    );
  }
}
