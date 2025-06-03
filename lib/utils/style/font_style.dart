
import 'package:dnaner/utils/color/colors.dart';
import 'package:flutter/material.dart';

 class FontStyles {
  static final String _fontFamily = 'SansArabic';
  static final font32Black =  TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    color: AppColors.blackText,
    fontWeight: FontWeight.w500,
  );
  static final font16Black =  TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    color: AppColors.blackText,
  );

  static final  font14Black = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.blackText,
    fontWeight: FontWeight.normal,
  );
  static final  font14White = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );

  static final  font30White = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static final  subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
  );

}