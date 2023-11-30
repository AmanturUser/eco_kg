import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/test_feature/presentation/result_screen.dart';
import 'package:flutter/material.dart';

import '../../../home_feature/widget/bottom_background_image.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(),
                  const Text(
                      'На вашу почту отправлено письмо с результатами теста самодиагностики.',
                      style: AppTextStyles.clearSansS16cl82,textAlign: TextAlign.center),
                  const SizedBox(),
                  InkWell(child: button(text: 'Завершить'),onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const ResultScreen()));
                  },)
                ],
              ),
            ),
            bottomBackgroungImage()
          ],
        ));
  }
}
