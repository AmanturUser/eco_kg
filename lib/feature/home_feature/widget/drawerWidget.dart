import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/audit_consultation_feature/presentation/audit_consultation_screen.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../core/auto_route/auto_route.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../audit_feature/presentation/audit_screen.dart';
import '../../audit_story/presentation/audit_story.dart';
import '../../certificates/presentation/certificates_screen.dart';
import '../../consultation_feature/presentation/consultation_screen.dart';
import '../../get_certificate/presentation/get_certificate_screen.dart';
import '../../story_feature/presentation/story_screen.dart';
import '../../user_cabinet_feature/presentation/user_cabinet.dart';
import '../../widgets/showModelBottomSheet.dart';
import '../domain/entities/drawerEnum.dart';
import 'bottom_background_image.dart';

Widget drawerBuild(BuildContext context,UserEnum userEnum){
  buildMenu(String icon,String menuName,BuildContext context,DrawerSelect drawerSelect){
    String name;
    String email;
    String phone;
    return InkWell(
      onTap: (){
        switch(drawerSelect){
          case DrawerSelect.userCabinet: {
            if(userEnum==UserEnum.auditor){
              name='Айжан Мусаева';
              email='aijan.musaeva@gmail.com';
              phone='+996 555 123456';
            }else{
              name='Азамат Сапаров';
              email='azamat.saparov@gmail.com';
              phone='+996 555 505155';
            }
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>UserCabinetScreen(name: name,email: email,phone: phone,user: userEnum)));
          } break;
          case DrawerSelect.getConsultation: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const ConsultationScreen()));
          }break;
          case DrawerSelect.library: {
            AutoRouter.of(context).push(const LibraryRoute());
          }break;
          case DrawerSelect.getCertificate: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const GetCertificatScreen()));
          }break;
          case DrawerSelect.story: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>userEnum==UserEnum.auditor? const AuditStoryScreen() : const StoryScreen()));
          }break;
          case DrawerSelect.certificates: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const CertificatesScreen()));
          }break;
          case DrawerSelect.auditConsultation: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AuditConsultationScreen()));
          }break;
          case DrawerSelect.audit: {
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AuditScreen()));
          }break;
          case DrawerSelect.language: {
            callShowModelBottomSheet(context);
          }break;
          case DrawerSelect.exit: {
            AutoRouter.of(context).replaceAll([const SignInRoute()]);
          }break;
          default:{

          }
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/icon/$icon',width: 20,height: 20),
              const SizedBox(width: 12),
              Text(
                menuName,
                style: AppTextStyles.clearSansS16W400CBlack,
              )
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
  switch(userEnum){
    case UserEnum.auditor: {
      return Drawer(
        child: Stack(
            children: [ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: AppColors.colorF7F7F7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 37),
                      const Text(
                        'Айжан Мусаева',
                        style: AppTextStyles.clearSansMediumTextStyle16,
                      ),
                      Text(
                        context.text.auditor,
                        style: AppTextStyles.hintStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  context.text.basic,
                  style: AppTextStyles.clearSansMediumS14C82F500,
                ),
                const SizedBox(height: 16),
                buildMenu('user.png',context.text.user_cabinet,context,DrawerSelect.userCabinet),
                buildMenu('message-search.png',context.text.consultations,context,DrawerSelect.auditConsultation),
                buildMenu('receipt-search.png',context.text.audit,context,DrawerSelect.audit),
                buildMenu('clock.png',context.text.history,context,DrawerSelect.story),
                const SizedBox(height: 22),
                Text(
                  context.text.settings,
                  style: AppTextStyles.clearSansMediumS14C82F500,
                ),
                const SizedBox(height: 16),
                buildMenu('clipboard-text.png',context.text.terms_of_use,context,DrawerSelect.termsOfUse),
                buildMenu('language-square.png',context.text.language,context,DrawerSelect.language),
              ],
            ),
              Positioned(bottom: 85,left: 16, child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit)),
              bottomBackgroungImage()
            ]
        ),
      );
    }
    case UserEnum.applicant:{
      return Drawer(
        child: Stack(
            children: [ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: AppColors.colorF7F7F7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 37),
                      const Text(
                        'Азамат Сапаров',
                        style: AppTextStyles.clearSansMediumTextStyle16,
                      ),
                      Text(
                        context.text.applicant,
                        style: AppTextStyles.hintStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  context.text.basic,
                  style: AppTextStyles.clearSansMediumS14C82F500,
                ),
                const SizedBox(height: 16),
                buildMenu('user.png',context.text.user_cabinet,context,DrawerSelect.userCabinet),
                buildMenu('message-search.png',context.text.get_consultation,context,DrawerSelect.getConsultation),
                buildMenu('clipboard-text.png',context.text.library,context,DrawerSelect.library),
                buildMenu('medal-star.png',context.text.get_certificate,context,DrawerSelect.getCertificate),
                buildMenu('clock.png',context.text.history,context,DrawerSelect.story),
                buildMenu('medal.png',context.text.certificates,context,DrawerSelect.certificates),
                const SizedBox(height: 22),
                Text(
                  context.text.settings,
                  style: AppTextStyles.clearSansMediumS14C82F500,
                ),
                const SizedBox(height: 16),
                buildMenu('people.png',context.text.about_the_project,context,DrawerSelect.aboutProject),
                buildMenu('clipboard-text.png',context.text.terms_of_use,context,DrawerSelect.termsOfUse),
                buildMenu('language-square.png',context.text.language,context,DrawerSelect.language),
              ],
            ),
              Positioned(bottom: 85,left: 16, child: buildMenu('logout.png',context.text.exit,context,DrawerSelect.exit)),
              bottomBackgroungImage()
            ]
        ),
      );
    }
  }
}