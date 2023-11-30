import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key,required this.user});
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  final UserEnum user;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.data_editing),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 42),
            Text(user==UserEnum.applicant?context.text.data_editing_text_applicant:context.text.data_editing_text_audit,style: AppTextStyles.clearSansS16cl82),
            const SizedBox(height: 32),
            Text(context.text.fullName,style: AppTextStyles.clearSansMediumS14C82F500),
            const SizedBox(height: 8),
            emailFieldTemplate(hintText: context.text.fullName),
            const SizedBox(height: 30),
            Text(context.text.phone,style: AppTextStyles.clearSansMediumS14C82F500),
            const SizedBox(height: 8),
            phoneFieldTemplate(hintText: context.text.phone),
            const SizedBox(height: 336),
            button(text: context.text.save)
          ],
        ),
      ),
    );
  }
  emailFieldTemplate({required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 274,
        child: TextField(
          controller: name,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }
  phoneFieldTemplate({required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 274,
        child: TextField(
          controller: phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }
}
