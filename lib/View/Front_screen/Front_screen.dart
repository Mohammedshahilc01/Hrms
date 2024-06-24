import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../Controller/Color_list/Color_list.dart';
import '../../Controller/Widget/TextWidget.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List images = [
    "Images/splash 1.png",
    "Images/splash 2.png",
    "Images/splash 4.png"
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:ColorList.loginInBoxColor,

    ));
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar(
                  backgroundColor: Colors.grey.shade100,
                  elevation: 0.0,
                  leading: Container(),
                  actions: [
                    IconButton(onPressed: (){
                      context.go('/loginPage');
                    }, icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: TextData(
                    color: Colors.amber,
                    name: 'Get More Feature',
                    fontSize: 16,
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: TextData(
                    color: ColorList.backgroundColor,
                    name: 'Easy and Secure',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextData(
                      color: Colors.grey,
                      name:
                          'Easy-secure" is a complete security package that provides advanced level of protection to your',
                      fontSize: 10,
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      pauseAutoPlayInFiniteScroll: false,
                      aspectRatio: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                          if (currentIndex == 2) {
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                return context.go('/loginPage');
                              },
                            );
                          }
                        });
                      },
                    ),
                    items: const [
                      Image(image: AssetImage('Images/splash 2.png')),
                      Image(image: AssetImage('Images/splash-1.png')),
                      Image(image: AssetImage('Images/splash 4.png')),
                    ],
                  ),
                  DotsIndicator(
                    decorator: DotsDecorator(
                      color: ColorList.backgroundColor,
                      size: const Size(5, 5),
                    ),
                    dotsCount: images.length,
                    position: currentIndex,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
