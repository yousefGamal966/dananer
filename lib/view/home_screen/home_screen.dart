import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/models/icons.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:dnaner/view/home_screen/tabs/chances_tab/chances_tab.dart';
import 'package:dnaner/view/home_screen/tabs/home_tab/home_tab.dart';
import 'package:dnaner/view/home_screen/tabs/my_investments_tab/my_investments_tab.dart';
import 'package:dnaner/view/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:dnaner/view/home_screen/tabs/wallet_tab/wallet_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> screens = [
    HomeTab(),
    ChancesTab(),
    WalletTab(),
    MyInvestmentsTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,


        selectedLabelStyle: FontStyles.font14Black,
      unselectedLabelStyle: FontStyles.font14Black,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
        iconSize: 24,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.purple,
        unselectedItemColor: AppColors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items:  [
        BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ImageIcon(AssetImage(AppIcons.home))),
          label: Lang.home,
        ),
        BottomNavigationBarItem(
          icon:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ImageIcon(AssetImage(AppIcons.chance)),
          ),

          label: Lang.chance,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ImageIcon(AssetImage(AppIcons.wallet)),
          ),
          label: Lang.wallet,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ImageIcon(AssetImage(AppIcons.cash)),
          ),
          label: Lang.myInvestments,
        ),
        BottomNavigationBarItem(

          icon: Padding(

            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ImageIcon(AssetImage(AppIcons.profile)),
          ),
          label: Lang.profile,
        ),
      ],
    ),
      body: screens[_currentIndex],
    );
  }
}
