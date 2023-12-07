import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';

Widget buttonWithIcon(String buttonText,String icon){
  return Ink(
    width: 358,
    height: 52,
    decoration: BoxDecoration(
        color: AppColors.colorEDF0F2,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1,color: AppColors.color009D9B)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icon/$icon', height: 24, width: 24),
        const SizedBox(width: 10),
        Text(buttonText,style: AppTextStyles.clearSansMediumTextStyle16)
      ],
    ),
  );
}