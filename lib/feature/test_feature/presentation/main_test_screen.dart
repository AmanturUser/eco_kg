import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:flutter/material.dart';
import '../../../core/style/app_colors.dart';
import '../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../home_feature/domain/entities/test.dart';
import '../../home_feature/widget/bottom_background_image.dart';
import '../../home_feature/widget/testIcon.dart';
import '../../widgets/progressWidget.dart';
import 'bloc/test_bloc.dart';

class MainTestScreen extends StatefulWidget {

  const MainTestScreen({super.key});

  @override
  State<MainTestScreen> createState() => _MainTestScreenState();
}

class _MainTestScreenState extends State<MainTestScreen> {
  TextEditingController companyName = TextEditingController();

  TextEditingController fullName = TextEditingController();

  TextEditingController region = TextEditingController();
  Test? testInfo;
  @override
  void dispose() {
    fullName.dispose();
    region.dispose();
    companyName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    companyName.text = 'Shoro';
    fullName.text = 'Egemberdiev';
    region.text = 'Bishkek';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тест',
          style: AppTextStyles.clearSansMediumTextStyle16,
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: Stack(
        children: [
          BlocBuilder<TestBloc, TestState>(
            builder: (context, stateGlobal) {
              if(stateGlobal is LoadedInfoTestState) {
                testInfo=stateGlobal.infoTest;
              }
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      testIconWidget(
                          testInfo!.backColor, testInfo!.iconPath),
                      const SizedBox(width: 16),
                      SizedBox(
                          width: 286,
                          child: Text(testInfo!.testTitle,
                              style: AppTextStyles.clearSansMediumTextStyle18)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  companyFieldTemplate(hintText: 'Название предприятия'),
                  const SizedBox(height: 16),
                  nameFieldTemplate(hintText: 'Руководитель компании ФИО'),
                  const SizedBox(height: 16),
                  regionFieldTemplate(hintText: 'Регион'),
                  const SizedBox(height: 240),
                  BlocBuilder<TestBloc, TestState>(
                    builder: (context, state) {
                      if (state is LoadingTestState) {
                        return Center(child: progressWidget());
                      }
                      if (state is LoadedTestState) {
                        AutoRouter.of(context).replace(const StartTestRoute());
                      }
                      if (state is ErrorTestState) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                BlocProvider.of<TestBloc>(context).add(
                                  BeginTestEvent(
                                    testInfoForBegin: TestInfoForBegin(
                                        companyName: companyName.text,
                                        companyDirector: fullName.text,
                                        categoryId:
                                        testInfo!.testNo.toString(),
                                        region: region.text),
                                  ),
                                );
                              },
                              child: button(text: 'Начать'),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(state.error.toString()),
                            ),
                          ],
                        );
                      }
                      return InkWell(
                          onTap: () {
                            var tempTestInfo = TestInfoForBegin(
                                companyName: companyName.text,
                                companyDirector: fullName.text,
                                categoryId: testInfo!.testNo.toString(),
                                region: region.text);
                            BlocProvider.of<TestBloc>(context).add(
                                BeginTestEvent(testInfoForBegin: tempTestInfo));
                          },
                          child: button(text: 'Начать'));
                    },
                  )
                ],
              );
            },
          ),
          bottomBackgroungImage()
        ],
      ),
    );
  }

  companyFieldTemplate({required String hintText}) {
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
          controller: companyName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }

  nameFieldTemplate({required String hintText}) {
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
          controller: fullName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.hintStyle,
          ),
        ),
      ),
    );
  }

  regionFieldTemplate({required String hintText}) {
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
          controller: region,
          keyboardType: TextInputType.emailAddress,
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
