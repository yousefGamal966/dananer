import 'package:dnaner/utils/style/font_style.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String data;
  final void Function() onPress;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Widget? icon;

  const CustomButton({
    super.key,
    this.textStyle,
    this.borderColor,
    required this.data,
    required this.onPress,
    this.icon,
    required this.backgroundColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        side: borderColor != null
            ? BorderSide(width: 1, color: borderColor!)
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Rounded corners
        ),
        padding: EdgeInsets.zero, // Removes default button padding
      ),
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Ensures the button wraps content
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: 8), // Space between icon and text
            ],
            Flexible(
              child: Text(
                data,
                style: textStyle ??
                    FontStyles.font16Black.copyWith(
                      color: textColor,
                    ),
                overflow: TextOverflow.ellipsis, // Prevents text overflow
              ),
            ),
          ],
        ),
      ),
    );
  }
}
