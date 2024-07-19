import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/Widget/TextWidget.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
                              context.go('/${RouteNames.bottomNavigation}');
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
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextData(
                      name: 'Notification ',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
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
                                  flex: 2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                const SizedBox(width: 3,),
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
                                        TextData(name:'10/10/2024',color: Colors.grey,fontSize: 12,),

                                        // TextData(name: 'Type',fontSize: 16,fontWeight: FontWeight.bold,),

                                        const SizedBox(height: 5,),
                                        TextData(name: 'Something to do with the weather',fontSize: 13,),
                                        const SizedBox(height: 5,)

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
                                  flex: 2,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                const SizedBox(width: 3,),
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
                                        TextData(name:'10/10/2024',color: Colors.grey,fontSize: 12,),

                                        // TextData(name: 'Type',fontSize: 16,fontWeight: FontWeight.bold,),

                                        const SizedBox(height: 5,),
                                        TextData(name: 'Something to do with the weather',fontSize: 13,),
                                        const SizedBox(height: 5,)

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
                  ),
                  const SafeArea(child: SizedBox(height: 30,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
