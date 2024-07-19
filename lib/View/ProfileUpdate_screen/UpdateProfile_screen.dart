import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/String_list/String_list.dart';
import '../../Controller/Widget/TextFormFieldWidget.dart';
import '../../Controller/Widget/TextWidget.dart';
import '../Home_screen/Components/CheckIn_widget.dart';
import '../Home_screen/Components/Photo_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  final bool? isFromHome;
  const UpdateProfileScreen({super.key, this.isFromHome});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController controllerDob=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerFatherName=TextEditingController();
  TextEditingController controllerAddress=TextEditingController();
  TextEditingController controllerState=TextEditingController();
  TextEditingController controllerCity=TextEditingController();
  TextEditingController controllerZipcode=TextEditingController();
  TextEditingController controllerContact=TextEditingController();
  TextEditingController controllerSecContact=TextEditingController();
  var userDetails;

  @override
  void initState() {
    // TODO: implement initState
   Provider.of<ProviderNotifier>(context, listen: false).getUserDetailQuery();
   userDetails=Provider.of<ProviderNotifier>(context, listen: false).userDetailsModel;
   controllerDob.text=userDetails?.userDetail?.dob??"";
   controllerEmail.text=userDetails?.userDetail?.email??"";
   controllerFatherName.text=userDetails?.userDetail?.firstName??"";
   controllerAddress.text=userDetails?.userDetail?.address??"";
   controllerState.text=userDetails?.userDetail?.address??"";
   controllerCity.text=userDetails?.userDetail?.address??"";
   controllerZipcode.text=userDetails?.userDetail?.address??"";
   controllerContact.text=userDetails?.userDetail?.contactno??"";
   controllerSecContact.text=userDetails?.userDetail?.contactno??"";
   print('--------------------');
   print(controllerEmail.text);
   print('--------------------');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isFromHome == false ? Padding(
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
              ):const SizedBox.shrink(),
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
                          name: userDetails?.userDetail?.firstName,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        TextData(
                          name: userDetails?.userDetail?.empid,
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
                        textEditingController: controllerDob,
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
                        textEditingController: controllerEmail,
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
                    widget.isFromHome==false?const SafeArea(child: SizedBox(height: 20,)):const SafeArea(child:  SizedBox(height: 80,)),
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


