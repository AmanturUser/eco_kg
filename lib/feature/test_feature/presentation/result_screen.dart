import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../home_feature/widget/bottom_background_image.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 82),
                Image.asset('assets/img/result_success.png', height: 100, width: 100),
                const SizedBox(height: 62),
                const Text('Ваш балл: 80',style: AppTextStyles.clearSansMediumS22W500CBlack,),
                const SizedBox(height: 16),
                const Text('По результатам диагностики, Вам присвоена категория маркировки Золото.',style: AppTextStyles.clearSansS16cl82,textAlign: TextAlign.center),
                const SizedBox(height: 22),
                Image.asset('assets/icon/certificateGold.png', height: 100, width: 100),
                const SizedBox(height: 40),
                Text('''Ваша почта с результатами теста:
azamat.saparov@gmail.com''',style: AppTextStyles.clearSansS12C82F400,textAlign: TextAlign.center),
                const SizedBox(height: 56),
                button(text: 'Пройти сертификацию')
              ],
            ),
          ),
          bottomBackgroungImage()
        ],
      ),
    );
  }
}
