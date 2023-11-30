import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForNext.dart';
import 'package:eco_kg/feature/test_feature/presentation/finish/finish_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import '../../../widgets/progressWidget.dart';
import 'bloc/next_test_bloc.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  TextEditingController name = TextEditingController();

  int? numberofPages;
  int? currentPage;
  String currentOption = '';
  String currentOptionId = '';
  var answers;
  String? categoryId = '';
  String? question = '';
  String? testId = '';
  String? mId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Тест',
          style: AppTextStyles.clearSansMediumTextStyle16,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: BlocBuilder<NextTestBloc, NextTestState>(
        builder: (context, state) {
          if (state is LoadingNextTestState) {
            return Center(child: progressWidget());
          }
          if (state is LoadedGetFromBeginTestState) {
            numberofPages = int.parse(state.beginTestEntity.count!);
            answers = state.beginTestEntity.answer;
            question = state.beginTestEntity.question;
            categoryId = state.categoryId;
            testId = state.beginTestEntity.testId.toString();
            mId = state.beginTestEntity.mid.toString();
            currentPage = state.beginTestEntity.number;
          }
          if (state is LoadedNextTestState) {
            question = state.nextTestEntity.question;
            answers = state.nextTestEntity.answer;
            mId = state.nextTestEntity.mid.toString();
            currentPage = state.nextTestEntity.number;
            print("success");
          }
          if(state is LoadedFinishTestState){
            /*Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const FinishScreen()));*/
            /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                FinishScreen()), (Route<dynamic> route) => false);*/
          }
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 32),
                  NumberPaginator(
                    initialPage: currentPage! - 1,
                    showPrevButton: false,
                    showNextButton: false,
                    numberPages: numberofPages!,
                    onPageChange: (index) {
                      currentPage = index;
                      setState(() {});
                    },
                    config: const NumberPaginatorUIConfig(
                      contentPadding: EdgeInsets.all(0),
                      buttonSelectedBackgroundColor: AppColors.color009D9B,
                      buttonUnselectedBackgroundColor: AppColors.colorD4D4D4,
                      buttonSelectedForegroundColor: AppColors.colorWhite,
                      buttonUnselectedForegroundColor: AppColors.colorWhite,
                    ),
                  ),
                  const SizedBox(height: 78),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question!,
                          style: AppTextStyles.clearSansMediumTextStyle16),
                      const SizedBox(height: 16),
                      for (var item in answers!)
                        RadioListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              item.title!,
                              style: AppTextStyles.clearSansS14CBlackF400,
                            ),
                            value: item.title,
                            groupValue: currentOption,
                            onChanged: (value) {
                              currentOption = value.toString();
                              currentOptionId = item.id.toString();
                              setState(() {});
                            },
                            activeColor: AppColors.color009D9B,
                            hoverColor: AppColors.colorEAFEF1),
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: 124,
                  left: 16,
                  child: InkWell(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: currentPage==numberofPages?button(text: 'Завершить'):button(text: 'Далее')),
                    onTap: () {
                      var tempTestInfo = TestInfoForNext(
                          test_id: testId!,
                          question_id: mId!,
                          answer_id: currentOptionId,
                          category_id: categoryId!,
                          number: currentPage.toString());
                      if (currentOptionId != null) {
                        currentPage==numberofPages ? BlocProvider.of<NextTestBloc>(context).add(
                            PostNextTestEvent(testInfoForNext: tempTestInfo)) :
                        BlocProvider.of<NextTestBloc>(context).add(
                            FinishTestEvent(testInfoForNext: tempTestInfo));
                      }
                    },
                  )),
              bottomBackgroungImage()
            ],
          );

        },
      ),
    );
  }

  emailFieldTemplate({required String hintText}) {
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
          controller: name,
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
