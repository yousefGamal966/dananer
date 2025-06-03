import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/models/images.dart';
import 'package:dnaner/utils/routes/routes.dart';
import 'package:dnaner/utils/shared_widgets/custom_button.dart';
import 'package:dnaner/view/onboarding/widgets/custom_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int index = 0;
  late PageController controller = PageController(initialPage: index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.darkPurple, // كحلي غامق جداً
            AppColors.lightPurple, // بنفسجي فاتح
            AppColors.white, // أبيض
          ],
          stops: [0.1, 0.4, 0.6], // تحكم في توزيع التدرج
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 48, right: 16, left: 16),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (position) {
                      setState(() {
                        index = position;
                      });
                    },
                    children: [
                      CustomOnboarding(
                        image: AppImages.onboarding1,
                        index: index,
                        content: Lang.onboardingContent1,
                        buttonTitle: Lang.next,
                        title1: Lang.onboardingTitle1,
                      ),
                      CustomOnboarding(
                        image: AppImages.onboarding2,
                        index: index,
                        content: Lang.onboardingContent2,
                        buttonTitle: Lang.next,
                        title1: Lang.onboardingTitle2,
                      ),
                      CustomOnboarding(
                        image: AppImages.onboarding3,
                        index: index,
                        content: Lang.onboardingContent3,
                        buttonTitle: Lang.next,
                        title1: Lang.onboardingTitle3,
                      ),
                    ],
                  ),
                ),
                Card(
                  color: AppColors.white,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: index,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotWidth: 4,
                        dotHeight: 4,
                        dotColor: AppColors.grey,
                        activeDotColor: AppColors.blackText,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 90),
                Container(
                  width: double.infinity,

                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          data: Lang.next,
                          onPress: nextPage,
                          backgroundColor: AppColors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (controller.hasClients) {
      if (index == 2) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
      controller.nextPage(
        duration: const Duration(milliseconds: 300), // Animation duration
        curve: Curves.easeInOut, // Animation curve
      );
    }
  }
}
