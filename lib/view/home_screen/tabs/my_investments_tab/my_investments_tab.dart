import 'package:dnaner/utils/localization/lang.dart';
import 'package:flutter/material.dart';

class MyInvestmentsTab extends StatefulWidget {
  const MyInvestmentsTab({super.key});

  @override
  State<MyInvestmentsTab> createState() => _MyInvestmentsTabState();
}

class _MyInvestmentsTabState extends State<MyInvestmentsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(Lang.myInvestments)
    ],);
  }
}
