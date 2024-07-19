import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../View/Home_screen/Components/bottomNavigationWidget.dart';
import '../GlobalVariable/GlobalVariable.dart';
import '../Provider/Provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex=Provider.of<ProviderNotifier>(context);
    return Scaffold(
      body:Stack(
        children: [
          PageList.tabList.elementAt(tabIndex.selectedIndex),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: CustomBottomNavigationBar()),
            ],
          )
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
