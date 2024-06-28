import 'package:flutter/material.dart';
import 'package:hrm/Controller/GlobalVariable/GlobalVariable.dart';
import 'package:provider/provider.dart';

import '../../View/Home_screen/Components/bottomNavigationWidget.dart';
import '../Provider/Provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndex=Provider.of<ProviderNotifier>(context);
    return Scaffold(
      body:PageList.tabList.elementAt(tabIndex.selectedIndex),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
