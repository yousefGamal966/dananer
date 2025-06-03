import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/models/images.dart';
import 'package:dnaner/utils/shared_widgets/custom_button.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';

class WalletBalanceCard extends StatefulWidget {
  final String title;
  final String balance;

   const WalletBalanceCard({required this.title,required this.balance, super.key});
  

  @override
  State<WalletBalanceCard> createState() => _WalletBalanceCardState();
}

class _WalletBalanceCardState extends State<WalletBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(AppImages.cardBack),fit: BoxFit.cover),
      ),
      child:Column(
        children: [
          SizedBox(height: 18,),
          Text(widget.title,style:FontStyles.font14White,),
          SizedBox(height: 10,),
          Text(widget.balance,style:FontStyles.font30WhiteSemiBold,),
          SizedBox(height: 20,),
          Row(

            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(data: '+ إيداع', onPress: (){}, backgroundColor:AppColors.white,textColor:AppColors.blackText ,),
              )),
            ],
          ),
          SizedBox(height: 22,),

        ],
      ) ,

    );
  }
}
