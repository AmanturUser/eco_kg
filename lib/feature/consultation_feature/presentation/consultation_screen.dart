import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.get_consultation),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.text.paid_consultation,style: AppTextStyles.clearSansMediumS22W500CBlack),
            const SizedBox(height: 22),
            Text(context.text.paid_consultation_text,style: AppTextStyles.hintStyle),
            const SizedBox(height: 300),
            button(text: context.text.pay)
          ],
        ),
      ),
    );
  }
}
