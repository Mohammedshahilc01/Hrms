import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../Controller/Api_services/Api_services.dart';
import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/GlobalVariable/GlobalVariable.dart';
import '../../Controller/Provider/Provider.dart';
import '../../Controller/Route_names/Route_names.dart';
import '../../Controller/Secure_Storage/Components/Secure_Storage_keys.dart';
import '../../Controller/Secure_Storage/Secure_storage.dart';
import '../../Controller/String_list/String_list.dart';
import '../../Controller/Widget/PasswordTextFormFieldWidget.dart';
import '../../Controller/Widget/TextFormFieldWidget.dart';
import '../../Controller/Widget/TextWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final ApiServicesMutation _apiServices=ApiServicesMutation();
  bool loading=false;
  final formKey = GlobalKey<FormState>();

  // void login()async{
  //  try{
  //    setState(() {
  //      loading=true;
  //    });
  //    await _apiServices.userLogin(_controllerEmail.text,_controllerPassword.text).then((value) async {
  //      await SecureStorage.storage.write(key: SecureStorageKeys.token, value:value['tokenAuth']['token']);
  //      await SecureStorage.storage.write(key: SecureStorageKeys.userData, value:jsonEncode(value['tokenAuth']['user']));
  //       if(value['tokenAuth']['success']==true){
  //         setState(() {
  //           loading=false;
  //         });
  //         Future.delayed(
  //           const Duration(microseconds:0),
  //               () => context.go('/${RouteNames.bottomNavigation}'),
  //         );
  //       }
  //       else{
  //        FlutterToast.print('Enter Valid Data');
  //       }
  //    });
  //  }catch(e){
  //    setState(() {
  //      loading=false;
  //    });
  //    if (kDebugMode) {
  //      print(e);
  //    }
  //  }
  // }

  @override
  void initState() {
    pageView();
    super.initState();
  }
  Future<void> pageView() async {
    var token=(await SecureStorage.storage.read(key: SecureStorageKeys.token));
    if (token != null && token.isNotEmpty){
      Future.delayed(
        const Duration(seconds: 0),
            () => context.go("/${RouteNames.bottomNavigation}"),
      );
    }
    // else{
    //   Future.delayed(
    //     const Duration(seconds: 2),
    //         () => context.go("/${RouteNames.loginPage}"),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final providerData=Provider.of<ProviderNotifier>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorList.loginInBoxColor,
    ));
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: PopScope(
          canPop: false,
          child: SingleChildScrollView(
                child: Stack(
          children: [
            Container(
              color: Colors.grey.shade100,
            ),
            Column(
              children: [
                Container(
                  height: 35,
                  color: ColorList.loginInBoxColor,
                ),
                Container(
                  color: ColorList.loginInBoxColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.transparent,
                      ),
                      TextData(
                        name: "",
                        fontSize: 16,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close))
                    ],
                  ),
                ),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        color: ColorList.loginInBoxColor,
                        image: const DecorationImage(
                            image: AssetImage('Images/SignPage_1.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: TextData(
                  //     name: StringList.welcome,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  // ),


                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 15, left: 15, right: 20),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(30),
                  //               color: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.grey.shade100,
                  //                     spreadRadius: 2,
                  //                     blurRadius: 2)
                  //               ]),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.all(5.0),
                  //                 child: Container(
                  //                   height: 35,
                  //                   width: 35,
                  //                   decoration: const BoxDecoration(
                  //                       image: DecorationImage(
                  //                           image: AssetImage(
                  //                               'Images/google_logo.png'))),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               TextData(
                  //                 name: 'Google',
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 15,
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(30),
                  //               color: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.grey.shade100,
                  //                     spreadRadius: 2,
                  //                     blurRadius: 2)
                  //               ]),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.all(5.0),
                  //                 child: Container(
                  //                   height: 35,
                  //                   width: 35,
                  //                   decoration: const BoxDecoration(
                  //                       image: DecorationImage(
                  //                           image: AssetImage(
                  //                               'Images/outlook_Logo.png'))),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               TextData(
                  //                 name: 'Outlook',
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                   Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('Images/Sapiens.png'),fit: BoxFit.fill,
                        ),
                        color: Colors.pink
                      ),
                      height: 100,
                        width: 100,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: TextData(
                  //       name: StringList.keelisHRMS,
                  //       fontWeight: FontWeight.bold,
                  //       color: ColorList.backgroundColor,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: TextData(
                  //     name: StringList.singToContinue,
                  //     fontSize: 12,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  // Align(
                  //     alignment: Alignment.center,
                  //     child: TextData(
                  //         name: StringList.orLoginWith, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10  ),
                    child: TextData(
                      name: StringList.email,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextFormFieldData(
                      prefixIcon:const Icon(Icons.email_outlined,size: 20,color: Colors.grey,),
                      textEditingController: _controllerEmail,
                      hintText: StringList.email,
                      fillColor: Colors.white,
                      errorText: 'Enter Email Id',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: TextData(
                      name: StringList.password,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: PasswordTextFormFieldData(
                      textEditingController: _controllerPassword,
                      prefixIcon: const Icon(Icons.lock,color: Colors.grey,size: 18,),
                      hintText: StringList.password,
                      fillColor: Colors.white,
                      errorText: 'Enter Password',
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: GestureDetector(
                          onTap: (){context.go('/${RouteNames.forgotPassword}');},
                            child: TextData(
                          name: StringList.forgotPassword,
                          color: ColorList.backgroundColor,
                        )),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            providerData.login(_controllerEmail.text.trim(),_controllerPassword.text.trim(),context);
                            // login();
                          }
                          else{
                           FlutterToast.print("Enter Valid Data");
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ColorList.backgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                  child: TextData(
                                name: StringList.login,
                                color: Colors.white,
                              )),
                            )),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextData(
                          name: StringList.dontHaveAccount,
                          color: Colors.grey,
                        ),
                        TextData(
                          name: StringList.singUp,
                          color: ColorList.backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // Text('${MediaQuery.of(context).size.height/12}'),
                       const SizedBox(
                        height:67,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: TextData(
                          name: 'Powered by',
                          color: ColorList.keelInfo,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextData(
                          name: StringList.keelInfoSolution,
                          color: ColorList.keelInfo,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<ProviderNotifier>(builder: (context, value, child) {
              if(value.loading){
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width:  MediaQuery.of(context).size.width,
                  color: Colors.black12,
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              return const SizedBox();
            },)
          ],
                ),
              ),
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(
      size.width / 8,
      5 * (size.height / 5),
      7 * (size.width / 7.9),
      size.height / 2.5,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
