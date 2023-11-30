import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/splash_feature/presentation/widget/button_with_icon.dart';
import 'package:eco_kg/feature/user_cabinet_feature/presentation/edit/edit_screen.dart';
import 'package:flutter/material.dart';

import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';

class UserCabinetScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final UserEnum user;
  const UserCabinetScreen({super.key, required this.name, required this.email, required this.phone,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user==UserEnum.applicant? context.text.applicants_cabinet : context.text.auditors_cabinet),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 62),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: Column(
                children: [
                  buildInfo(context.text.fullName,name,context,true),
                  space(),
                  buildInfo(context.text.email,email,context),
                  space(),
                  buildInfo(context.text.phone,phone,context,true),
                ],
              ),
            ),

            buttonWithIcon(context.text.delete_profile,'trash.png')
          ],
        ),
      )
    );
  }
  buildInfo(String leading,String info,BuildContext context,[bool icon=false]){
    return SizedBox(
      child: Row(
        children: [
          SizedBox(width: 110,child: Text(leading,style: AppTextStyles.clearSansMediumS14C82F500)),
          Text(info),
          if(icon)
            InkWell(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditScreen(user: user)));
            },child: SizedBox(width: 128,child: Image.asset('assets/icon/edit.png',width: 24,height: 24,alignment: Alignment.centerRight,)))


        ],
      ),
    );
  }
  space(){
    return const Divider(
      height: 20,
      color: AppColors.colorD9D9D9,
    );
  }
}
