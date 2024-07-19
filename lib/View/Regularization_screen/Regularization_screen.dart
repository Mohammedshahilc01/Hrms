import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/Widget/TextWidget.dart';
class RegularizationScreen extends StatefulWidget {

  const RegularizationScreen({super.key});

  @override
  State<RegularizationScreen> createState() => _RegularizationScreenState();
}

class _RegularizationScreenState extends State<RegularizationScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextData(
                  name: 'Regularization',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            const SizedBox(width: 5,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Delete action clicked');
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              padding: EdgeInsets.all(10),
                              autoClose: true,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(width: 3,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Edit action clicked');
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              padding: EdgeInsets.all(10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(name:'10/10/2024',color: Colors.grey,fontSize: 12,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.yellow[200]
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Text('Pending with Manager',style: TextStyle(fontSize: 10,color: ColorList.backgroundColor),),
                                              )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    // TextData(name: 'Type',fontSize: 16,fontWeight: FontWeight.bold,),
                                    Row(
                                      children: [
                                        TextData(name: "Clock In -",fontWeight: FontWeight.bold,),
                                        TextData(name: "11:00 AM" ,),
                                        TextData(name: "  Clock Out - ",fontWeight: FontWeight.bold,),
                                        TextData(name: "6:00 PM",),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    TextData(name: 'Something to do with the weather',fontSize: 13,),
                                    const SizedBox(height: 3,),

                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                                    color: ColorList.backgroundColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            const SizedBox(width: 5,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Delete action clicked');
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              padding: EdgeInsets.all(10),
                              autoClose: true,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(width: 3,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Edit action clicked');
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              padding: EdgeInsets.all(10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(name:'10/10/2024',color: Colors.grey,fontSize: 12,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.yellow[200]
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Text('Pending with Manager',style: TextStyle(fontSize: 10,color: ColorList.backgroundColor),),
                                              )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    // TextData(name: 'Type',fontSize: 16,fontWeight: FontWeight.bold,),
                                    Row(
                                      children: [
                                        TextData(name: "Clock In -",fontWeight: FontWeight.bold,),
                                        TextData(name: "11:00 AM" ,),
                                        TextData(name: "  Clock Out - ",fontWeight: FontWeight.bold,),
                                        TextData(name: "6:00 PM",),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    TextData(name: 'Something to do with the weather',fontSize: 13,),
                                    const SizedBox(height: 3,),

                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                                    color: ColorList.backgroundColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            const SizedBox(width: 5,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Delete action clicked');
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              padding: EdgeInsets.all(10),
                              autoClose: true,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(width: 3,),
                            SlidableAction(
                              onPressed: (context) {
                                // Add your action here
                                print('Edit action clicked');
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              padding: EdgeInsets.all(10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextData(name:'26/10/2024',color: Colors.grey,fontSize: 12,),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.red[200]
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Text('Rejected',style: TextStyle(fontSize: 10,color: ColorList.backgroundColor),),
                                              )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    // TextData(name: 'Type',fontSize: 16,fontWeight: FontWeight.bold,),
                                    Row(
                                      children: [
                                        TextData(name: "Clock In -",fontWeight: FontWeight.bold,),
                                        TextData(name: "11:00 AM" ,),
                                        TextData(name: "  Clock Out - ",fontWeight: FontWeight.bold,),
                                        TextData(name: "6:00 PM",),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    TextData(name: 'Public transport',fontSize: 13,),
                                    const SizedBox(height: 3,),

                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                                    color: ColorList.backgroundColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar:const CustomBottomNavigationBar(),
      ),
    );
  }
}
