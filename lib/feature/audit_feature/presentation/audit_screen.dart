import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';

class AuditScreen extends StatelessWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.audit),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
        children: [
          buildConsultationItem('Ak-Sai Travel','Чуйская область'),
          space(),
          buildConsultationItem('Navat Chaihana','г. Бишкек'),
          space(),
          buildConsultationItem('Jannat Resort','Чуйская область'),
        ],
      ),
    );
  }
  space(){
    return SizedBox(height: 22);
  }
  buildConsultationItem(String title,String location){
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
        crossAxisAlignment: CrossAxisAlignment.end,
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
          SizedBox(
            child: Row(
              children: [
                Container(
                  width: 82,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.color009D9B,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(child: Text('Принять',style: AppTextStyles.clearSansMediumS12W500CWhite,)),
                ),
                SizedBox(width: 12),
                Container(
                  width: 82,
                  height: 22,
                  decoration: BoxDecoration(
                      color: AppColors.colorFF0000,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(child: Text('Отклонить',style: AppTextStyles.clearSansMediumS12W500CWhite,)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
