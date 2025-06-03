import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';

class OpportunitiesTab extends StatefulWidget {
  const OpportunitiesTab({super.key});

  @override
  State<OpportunitiesTab> createState() => _OpportunitiesTabState();
}

class _OpportunitiesTabState extends State<OpportunitiesTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ['الكل', 'نشطة', 'مكتملة', 'قريباً'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            height: 160,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            decoration:BoxDecoration(
              color: AppColors.blackText,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32)),
            ) ,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Lang.opportunities,
                    style: FontStyles.font24WhiteSemiBold
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Icon(Icons.swap_vert, size: 20),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          // TabBar Container بالكيرف المطلوب
          TabBar(
            dividerColor: Colors.transparent,

            controller: _tabController,
            labelColor: AppColors.white,
            labelStyle: FontStyles.font12White,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey, width: 2),

              color: AppColors.purple,
              borderRadius: BorderRadius.circular(6),
            ),
            tabs: tabs.map((title) {
              return Container(
                width:76 ,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.lightGrey, width: 2),
                ),
                child: Tab(
                  child: Text(title),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 16),

          // TabBarView محتوى كل تبويب
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((title) {
                return Center(
                  child: Text(
                    'محتوى: $title',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );

  }
}

