import 'package:dnaner/utils/color/colors.dart';
import 'package:dnaner/utils/shared_widgets/custom_progress_bar.dart';
import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectStatus status;
  final String price;
  final String annualReturn;
  final String duration;
  final String rating;
  final String opportunityNumber;
  final double progressPercent;

  const ProjectCardWidget({
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
                    style: TextStyle(color: status.color, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 12),

            // النسبة
            CustomProgressBar(percentage: progressPercent),
            const SizedBox(height: 8),
            Text('${(progressPercent * 100).toStringAsFixed(0)}%'),

            const SizedBox(height: 12),

            // التفاصيل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn('صافي العائد السنوي', annualReturn),
                _buildInfoColumn('المدة', duration),
                _buildInfoColumn('التصنيف', rating),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              'رقم الفرصة: $opportunityNumber',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
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
        return 'نشطة';
      case ProjectStatus.comingSoon:
        return 'قريباً';
      case ProjectStatus.completed:
        return 'مكتملة';
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.active:
        return Colors.green;
      case ProjectStatus.comingSoon:
        return Colors.yellow[700]!;
      case ProjectStatus.completed:
        return Colors.purple;
    }
  }
}

