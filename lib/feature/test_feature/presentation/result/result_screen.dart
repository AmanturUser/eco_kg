import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/finishTestEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../get_certificate/presentation/get_certificate_screen.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import '../bloc/test_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  FinishTestEntity? finishTestEntity;
  String email='';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<TestBloc, TestState>(
  builder: (context, state) {
    if(state is LoadedResultTestState){
      finishTestEntity=state.finishTestEntity;
      email=state.email;
    }
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 82),
                  Image.asset('assets/img/result_success.png', height: 100, width: 100),
                  const SizedBox(height: 62),
                  Text('Ваш балл: ${finishTestEntity!.score!}',style: AppTextStyles.clearSansMediumS22W500CBlack,),
                  const SizedBox(height: 16),
                  Text(finishTestEntity!.achievment!,style: AppTextStyles.clearSansS16cl82,textAlign: TextAlign.center),
                  const SizedBox(height: 22),
                  Image.asset('assets/icon/certificateGold.png', height: 100, width: 100),
                  const SizedBox(height: 40),
                  Text('''Ваша почта с результатами теста:
$email''',style: AppTextStyles.clearSansS12C82F400,textAlign: TextAlign.center),
                  const SizedBox(height: 56),
                  InkWell(child: button(text: 'Пройти сертификацию'),onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const GetCertificatScreen()));
                  },)
                ],
              );
  },
),
            ),
            bottomBackgroungImage()
          ],
        ),
      ),
    );
  }
}
