import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/localization/lang.dart';
import 'package:dnaner/utils/shared_widgets/custom_progress_bar.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class InvestmentsCard extends StatelessWidget {
  final ProjectStatus status;
  final String price;
  final String annualReturn;
  final String duration;
  final String rating;
  final String opportunityNumber;
  final double progressPercent;

  const InvestmentsCard({
    super.key,
    required this.status,
    required this.price,
    required this.annualReturn,
    required this.duration,
    required this.rating,
    required this.opportunityNumber,
    required this.progressPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // السعر
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مشروع مؤسسة تابعة للصندوق الاستثمارات العامة',
                        style: FontStyles.subtitle,
                      ),

                      const SizedBox(height: 8),
                      Text(

                        '$price ﷼ ',
                        style:FontStyles.font16Black,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: status.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status.label,
                    style:FontStyles.font12Black.copyWith(color: status.color),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 12),

            // النسبة
            CustomProgressBar(percentage: progressPercent),
            const SizedBox(height: 8),

            const SizedBox(height: 12),

            // التفاصيل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 14,color: AppColors.lightGrey,width: 0.7,),

                _buildInfoColumn(Lang.annualReturn, annualReturn),
                Container(height: 14,color: AppColors.lightGrey,width: 0.7,),

                _buildInfoColumn(Lang.duration, duration),
                Container(height: 14,color: AppColors.lightGrey,width: 0.7,),

                _buildInfoColumn(Lang.rating, rating),
                Container(height: 14,color: AppColors.lightGrey,width: 0.7,),


              ],
            ),
            Divider(color: AppColors.lightGrey,),

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.center,
              child: Text(

                '${Lang.opportunityNumber} : $opportunityNumber',
                style: FontStyles.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Row(
      children: [

        Column(
          children: [

            Text(
              value,
              style: FontStyles.font14Black,        ),
            const SizedBox(height: 4),
            Text(
              title,
              style: FontStyles.subtitle,        ),
          ],
        ),
      ],
    );
  }
}
enum ProjectStatus {
  active,       // نشطة
  comingSoon,   // قريباً
  completed     // مكتملة
}

extension ProjectStatusExtension on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.active:
        return Lang.active;
      case ProjectStatus.comingSoon:
        return Lang.soon;
      case ProjectStatus.completed:
        return Lang.completed;
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.active:
        return AppColors.green;
      case ProjectStatus.comingSoon:
        return AppColors.yellow;
      case ProjectStatus.completed:
        return AppColors.purple;
    }
  }
}

