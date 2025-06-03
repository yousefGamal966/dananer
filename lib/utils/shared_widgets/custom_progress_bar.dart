import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const CustomProgressBar({
    Key? key,
    required this.percentage,
    this.height = 24.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = const Color(0xFF1ABC9C),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        children: [
          Container(
            height: height,
            color: backgroundColor,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final barWidth = constraints.maxWidth * (percentage / 100);
              return Stack(
                children: [
                  Container(
                    height: height,
                    width: barWidth,
                    color: progressColor,
                  ),
                  Positioned(
                    left: barWidth - 40, // لضبط مكان النسبة
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 40,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 4),
                      child: Text(
                        '${percentage.toInt()}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
