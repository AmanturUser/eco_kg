import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class GetCertificatScreen extends StatelessWidget {
  const GetCertificatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.get_certificate),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.text.pay_certificate,style: AppTextStyles.clearSansMediumS22W500CBlack),
            SizedBox(height: 22),
            Text(context.text.pay_certificate_text,style: AppTextStyles.hintStyle),
            SizedBox(height: 204),
            button(text: context.text.pay)
          ],
        ),
      ),
    );
  }
}
