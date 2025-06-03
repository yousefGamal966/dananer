import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/models/images.dart';
import 'package:dnaner/utils/shared_widgets/investments_card.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:dnaner/view/home_screen/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List <ProjectStatus> status = [ProjectStatus.active, ProjectStatus.comingSoon, ProjectStatus.completed,ProjectStatus.comingSoon,];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2),
          SafeArea(
            child: Row(
              children: [SvgPicture.asset(AppImages.user),
                SizedBox(width: 10),
                Text('هلا , فيصل',style:FontStyles.font20BlackSemiBold,),
                Spacer(),
                SvgPicture.asset(AppImages.support),
                SvgPicture.asset(AppImages.notification),
              ],
            ),
          ),
          SizedBox(height: 34),

          WalletBalanceCard(title: 'رصيد المحفظه', balance: '12,000,00'),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Lang.opportunities,style:FontStyles.font20BlackSemiBold,),
              Container(

                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      Lang.allOpportunities,
                      style:FontStyles.font12Black.copyWith(color: AppColors.purple),
                    ),
                    Icon(Icons.arrow_forward_ios,color: AppColors.purple,size: 14,),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 22),


          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InvestmentsCard(
                  status: status[index],
                  price: '8,220,000',
                  annualReturn: '18%',
                  duration: '9 أشهر',
                  rating: 'B',
                  opportunityNumber: 'D25-117',
                  progressPercent: 85,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
