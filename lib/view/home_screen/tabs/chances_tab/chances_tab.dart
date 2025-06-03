import 'package:dnaner/utils/localization/lang.dart';
import 'package:flutter/material.dart';

class ChancesTab extends StatefulWidget {
  const ChancesTab({super.key});

  @override
  State<ChancesTab> createState() => _ChancesTabState();
}

class _ChancesTabState extends State<ChancesTab> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(Lang.chance)
    ],);
  }
}
