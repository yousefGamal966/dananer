import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/shared_widgets/investments_card.dart';
import 'package:dnaner/view/home_screen/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WalletBalanceCard(title: 'رصيد المحفظه', balance: '12,000,00'),
          Expanded(
            child: ListView.separated(itemBuilder:(context, index) {
              return ProjectCardWidget(
                status: ProjectStatus.completed,
                price: '8,220,000',
                annualReturn: '18%',
                duration: '9 أشهر',
                rating: 'B',
                opportunityNumber: 'D25-117',
                progressPercent: 85,
              );

            }, separatorBuilder:(context, index) =>  SizedBox(height: 20,), itemCount: 4),
          )
      ],),
    );
  }
}
