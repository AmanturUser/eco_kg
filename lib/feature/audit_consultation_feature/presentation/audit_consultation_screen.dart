import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';

class AuditConsultationScreen extends StatelessWidget {
  const AuditConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.consultations),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
        children: [
          buildConsultationItem('Ak-Sai Travel','aksaitravel@gmail.com','Чуйская область','+996 551 234567'),
          space(),
          buildConsultationItem('Navat Chaihana','navatkg@gmail.com','г. Бишкек','+996 551 234567'),
          space(),
          buildConsultationItem('Jannat Resort','jannatresort@gmail.com','Чуйская область','+996 312 909749'),
          space(),
          buildConsultationItem('Ak-Sai Travel','aksaitravel@gmail.com','Чуйская область','+996 551 234567'),
          space(),
          buildConsultationItem('Navat Chaihana','navatkg@gmail.com','г. Бишкек','+996 551 234567'),
          space(),
          buildConsultationItem('Jannat Resort','jannatresort@gmail.com','Чуйская область','+996 312 909749'),
        ],
      ),
    );
  }

  space(){
    return SizedBox(height: 22);
  }
  buildConsultationItem(String title,String email,String location,String phone){
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 28,
            color: AppColors.color009D9B.withOpacity(0.08),
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextStyles.clearSansMediumS14W500C009D9B),
              const SizedBox(height: 6),
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/location.png',width: 18,height: 18),
                    const SizedBox(width: 6),
                    Text(location,
                        style: AppTextStyles.clearSansS12C82F400),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/sms.png',width: 18,height: 18),
                    const SizedBox(width: 6),
                    Text(email,style: AppTextStyles.clearSansS12W400CBlack,),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                child: Row(
                  children: [
                    Image.asset('assets/icon/call.png',width: 18,height: 18),
                    const SizedBox(width: 6),
                    Text(phone,
                        style: AppTextStyles.clearSansS12C82F400),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
