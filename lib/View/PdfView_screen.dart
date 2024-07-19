import 'dart:io';

import 'package:Sapiens/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Controller/Color_list/Color_list.dart';
import '../Controller/Route_names/Route_names.dart';
import '../Controller/String_list/String_list.dart';
import '../Controller/Widget/TextWidget.dart';
import 'Home_screen/Components/LeaveStatus_widget.dart';
class PdfviewScreen extends StatefulWidget {

  const PdfviewScreen({super.key,});

  @override
  State<PdfviewScreen> createState() => _PdfviewScreenState();
}

class _PdfviewScreenState extends State<PdfviewScreen> {
  String selectedValue="July 2024";


  late PDFViewController pdfViewController;
  int totalPages = 0;
  int currentPage = 0;
  bool isReady = false;
  String? path;
  bool loading=true;


  Future<String> loadPDFAsset(String asset) async {
    final data = await rootBundle.load(asset);
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/temp.pdf");
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    setState(() {
      path =file.path;
      print(file.path);
      loading=false;
    });
    return file.path;
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  Future getData()async{
    WidgetsFlutterBinding.ensureInitialized();
    path=await loadPDFAsset('Images/MutationwithVariable.pdf');
  }
  Future<void> getPermission() async {
    var allowed = await Permission.storage.isGranted;
    final PermissionStatus status = await  Permission.storage.request();
   print("status");
   print(allowed);
   print("status");
    if (allowed == false) {
      final PermissionStatus status =
      await Permission.locationWhenInUse.request();
      allowed = status.isGranted;
    }
    // final permissionStatus = await Permission.storage.status;
    // print("permissionStatus.isDenied");
    // print(permissionStatus.isDenied);
    // print("permissionStatus.isDenied");
    // if (permissionStatus.isDenied) {
    //   // Here just ask for the permission for the first time
    //   await Permission.storage.request();
    //   // I noticed that sometimes popup won't show after user press deny
    //   // so I do the check once again but now go straight to appSettings
    //   if (permissionStatus.isDenied) {
    //     await openAppSettings();
    //   }
    // } else if (permissionStatus.isPermanentlyDenied) {
    //   // Here open app settings for user to manually enable permission in case
    //   // where permission was permanently denied
    //   await openAppSettings();
    // } else {
    //   // Do stuff that require permission here
    // }
  }

  Future<void> _downloadPdf() async {
    // Request storage permission

    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        // Load PDF file from assets
        final ByteData bytes = await rootBundle.load('Images/MutationwithVariable.pdf');
        final Uint8List pdfData = bytes.buffer.asUint8List();

        // Get the external storage directory
        final Directory? externalDir = await getExternalStorageDirectory();
        final String externalPath = externalDir!.path;

        // Create a file to write PDF data
        final File file = File('$externalPath/sample.pdf');

        // Write the PDF data to the file
        await file.writeAsBytes(pdfData);
        FlutterToast.print('PDF downloaded to: ${file.path}');
        print('PDF downloaded to: ${file.path}');
      } catch (e) {
        print('Error downloading PDF: $e');
      }
    } else {
      print('Permission denied');
    }
  }

  // Future<void> downloadPdf() async {
  //   if (Platform.isAndroid) {
  //     var status = await Permission.storage.status;
  //     if (status != PermissionStatus.granted) {
  //       status = await Permission.storage.request();
  //     }
  //     if (status.isGranted) {
  //       const downloadsFolderPath = '/storage/emulated/0/Download/';
  //       Directory dir = Directory(downloadsFolderPath);
  //       File file = File('${dir.path}/$path');
  //       print("--------------file------------------");
  //       print(file);
  //       print("--------------file------------------");
  //
  //     }
  //   }
  // }
  // Future downloadPDF(String url, String fileName) async {
  //   final file = path;
  // }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              loading?const Center(child: CircularProgressIndicator()):Column(
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
                      name: 'Payslip ',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton<String>(
                        isDense: true,
                        padding: EdgeInsets.zero,
                        underline: const SizedBox(),
                        value: selectedValue,
                        items: <String>['Jan 2024', 'Feb 2024', 'Mar 2024', 'Apl 2024','May 2024','Jun 2024','July 2024'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedValue=val!;
                          });
                        },
                      ),
                    ),
                  ),
                   Expanded(
                     child:  Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Stack(
                         children: [
                           Container(
                             decoration: BoxDecoration(
                               border: Border.all(color: Colors.black12)
                             ),
                             child: PDFView(
                               filePath: path,
                               autoSpacing: true,
                               swipeHorizontal: false,
                               pageFling: true,
                               onRender: (pages) {
                                 setState(() {
                                   totalPages = pages!;
                                   isReady = true;
                                 });
                               },
                               onViewCreated: (PDFViewController vc) {
                                 pdfViewController = vc;
                               },
                               onPageChanged: (int? page, int? total) {
                                 setState(() {
                                   currentPage = page!;
                                 });
                               },
                             ),
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Align(
                                 alignment: Alignment.bottomRight,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [
                                         Container(
                                             decoration: BoxDecoration(
                                                 color: Colors.grey.shade200,
                                               borderRadius: BorderRadius.circular(10)
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: TextData(name: '$currentPage / $totalPages')
                                             )),
                                         const SizedBox(height: 15,),
                                         // Container(
                                         //   decoration: BoxDecoration(
                                         //     color: ColorList.backgroundColor,
                                         //     shape: BoxShape.circle
                                         //   ),
                                         //     child: IconButton(onPressed: () async {
                                         //       getPermission();
                                         //       // _downloadPdf();
                                         //     }, icon: Icon(Icons.download,color: Colors.white,))),
                                         const SizedBox(height: 15,),
                                       ],
                                     ),
                                   )),
                             ],
                           )
                         ],
                       ),
                     ),

                   ),
                  SafeArea(child: SizedBox(height: 30,)),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //       child: TextData(name: '$currentPage / $totalPages',)),
                  // ),
                  // !isReady
                  //     ? Center(child: CircularProgressIndicator())
                  //     : Offstage(),
                  // SafeArea(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(15),
                  //         child: Container(
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(30),
                  //                 color: ColorList.backgroundColor),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Center(
                  //                   child: IconButton(
                  //                     onPressed: (){
                  //
                  //                     },
                  //                     icon: Icon(Icons.download,color: Colors.white,),
                  //                   )),
                  //             )),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
