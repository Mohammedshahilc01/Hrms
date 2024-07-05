import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm/Controller/Widget/TextWidget.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/String_list/String_list.dart';
import '../../Controller/Widget/TextFormFieldWidget.dart';
import '../Home_screen/Components/CheckIn_widget.dart';
import '../Home_screen/Components/Photo_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
  final bool? isFromHome;
  const UpdateProfileScreen({super.key, this.isFromHome});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isFromHome == false ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                   Navigator.pop(context);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ):SizedBox.shrink(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'Images/profileImage.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        TextData(
                          name: "Mohammed Shahil",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        TextData(
                          name: "S12345",
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                          size: 20,
                        ),
                        hintText: StringList.dob,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                        hintText: StringList.email,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.drive_file_rename_outline,
                          size: 20,
                        ),
                        hintText: StringList.fatherName,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        hintText: StringList.address,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.real_estate_agent_outlined,
                          size: 20,
                        ),
                        hintText: StringList.state,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.location_city,
                          size: 20,
                        ),
                        hintText: StringList.city,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.numbers_sharp,
                          size: 20,
                        ),
                        hintText: StringList.zipcode,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.phone,
                          size: 20,
                        ),
                        hintText: StringList.contactNumber,
                      ),
                    ),
                    Padding(
                      padding:
                           const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormFieldData(
                        prefixIcon: const Icon(
                          Icons.phone,
                          size: 20,
                        ),
                        hintText: StringList.secondaryNumber,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
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
                              ))),
                    ),
                    const SafeArea(child:  SizedBox(height: 90,)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
