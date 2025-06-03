import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/shared_widgets/custom_button.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CustomOnboarding extends StatelessWidget {
  int index;
  final String title1;
  final String content;
  final String buttonTitle;
  final String? buttonTitle1;
  final bool isFirst;
  final void Function()? button2;

  final String image;

  CustomOnboarding(
      {super.key,
        this.buttonTitle1,
        required this.image,
        required this.index,
        required this.content,
        required this.buttonTitle,
        required this.title1,
        this.isFirst = false,
        this.button2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(image,fit: BoxFit.cover,),
        SizedBox(
          height: 168,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            textAlign: TextAlign.center,
            title1,
            style: FontStyles.font32BlackSemiBold,
          ),
        ),

        SizedBox(
          height: 16,
        ),
        Flexible(
          child: Text(
              textAlign: TextAlign.center,

              content,
            style: FontStyles.font16Black
          ),
        ),
        SizedBox(
          height: 32,
        ),

      ],
    );
  }
}
