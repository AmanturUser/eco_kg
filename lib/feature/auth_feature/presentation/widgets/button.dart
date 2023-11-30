import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget button({required String text}){
  return Ink(
    width: 390,
    height: 52,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.color009D9B,
    ),
    child: Center(child: Text(text,style: AppTextStyles.buttonTextStyle)),
  );
}