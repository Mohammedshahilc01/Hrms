import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

import '../../Controller/Color_list/Color_list.dart';

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
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
                        padding: const EdgeInsets.only(left: 20),
                        child: TextData(name: 'December 12',fontSize: 13,color: Colors.grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.white,
                            border: Border.all(color: Colors.black12)
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          TextData(
                                            name: 'Half Day Application',
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextData(
                                            name: 'Casual',
                                            fontSize: 15,
                                            color: Colors.green,
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
                                                        BorderRadius.circular(5),
                                                    color: Colors.yellow[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Awaiting',
                                                      fontSize: 13,
                                                      color: Colors.red[300],
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  isExpandedAwaiting = !isExpandedAwaiting;
                                                });
                                              },
                                                child: Icon(isExpandedAwaiting ? Icons.expand_less : Icons.expand_more,)),
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
                                height: isExpandedAwaiting ? 50 : 0,
                                child:  SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
                                        ),
                                        Icon(Icons.download)
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
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextData(name: 'December 12',fontSize: 13,color: Colors.grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),color: Colors.white,
                              border: Border.all(color: Colors.black12)
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          TextData(
                                            name: 'Half Day Application',
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextData(
                                            name: 'Casual',
                                            fontSize: 15,
                                            color: Colors.green,
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
                                                    BorderRadius.circular(5),
                                                    color: Colors.deepOrange[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Pending',
                                                      fontSize: 13,
                                                      color: Colors.deepOrange[300],
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isExpandedPending = !isExpandedPending;
                                                  });
                                                },
                                                child: Icon(isExpandedPending ? Icons.expand_less : Icons.expand_more,)),
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
                                height: isExpandedPending ? 50 : 0,
                                child:  SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
                                        ),
                                        Icon(Icons.download)
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
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextData(name: 'December 12',fontSize: 13,color: Colors.grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),color: Colors.white,
                              border: Border.all(color: Colors.black12)
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          TextData(
                                            name: 'Half Day Application',
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextData(
                                            name: 'Casual',
                                            fontSize: 15,
                                            color: Colors.green,
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
                                                    BorderRadius.circular(5),
                                                    color: Colors.green[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Approved',
                                                      fontSize: 13,
                                                      color: Colors.green[300],
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isExpandedApproved = !isExpandedApproved;
                                                  });
                                                },
                                                child: Icon(isExpandedApproved ? Icons.expand_less : Icons.expand_more,)),
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
                                height: isExpandedApproved ? 50 : 0,
                                child:  SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
                                        ),
                                        Icon(Icons.download)
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
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextData(name: 'December 12',fontSize: 13,color: Colors.grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),color: Colors.white,
                              border: Border.all(color: Colors.black12)
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          TextData(
                                            name: 'Half Day Application',
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                          TextData(
                                            name: 'Wed, 16 Dec',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextData(
                                            name: 'Casual',
                                            fontSize: 15,
                                            color: Colors.green,
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
                                                    BorderRadius.circular(5),
                                                    color: Colors.red[100]),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8.0,
                                                      right: 8.0,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: Center(
                                                    child: TextData(
                                                      name: 'Declined',
                                                      fontSize: 13,
                                                      color: Colors.red[300],
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    isExpandedDeclined = !isExpandedDeclined;
                                                  });
                                                },
                                                child: Icon(isExpandedDeclined ? Icons.expand_less : Icons.expand_more,)),
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
                                height: isExpandedDeclined ? 50 : 0,
                                child:  SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(
                                          name: 'Personal Issue',
                                        ),
                                        Icon(Icons.download)
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
