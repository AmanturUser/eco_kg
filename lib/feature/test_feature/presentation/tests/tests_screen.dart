import 'package:eco_kg/core/style/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForNext.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_kg/feature/auth_feature/presentation/widgets/button.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:flutter/material.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../home_feature/widget/bottom_background_image.dart';
import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../../../widgets/progressWidget.dart';
import '../bloc/test_bloc.dart';

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
  var lan = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тест',
          style: AppTextStyles.clearSansMediumTextStyle16,
        ),
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)),
        leadingWidth: 100,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
  builder: (context, stateLan) {
    return BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is LoadingTestState) {
            return Center(child: progressWidget());
          }
          if (state is LoadedTestState) {
            if (stateLan.lanCode != 'ru') {
              lan = stateLan.lanCode;
            }
            numberofPages = int.parse(state.testEntity.count!);
            answers = state.testEntity.answer;
            question = lan == ''
                ? state.testEntity.question!
                : lan == 'en'
                ? state.testEntity.questionEn!
                : state.testEntity.questionKy!;
            categoryId = state.categoryId;
            testId = state.testEntity.testId.toString();
            mId = state.testEntity.mid.toString();
            currentPage = state.testEntity.number;
          }
          if (state is LoadedNextTestState) {
            if (stateLan.lanCode != 'ru') {
              lan = stateLan.lanCode;
            }
            question = lan == ''
                ? state.nextTestEntity.question!
                : lan == 'en'
                ? state.nextTestEntity.questionEn!
                : state.nextTestEntity.questionKy!;

            answers = state.nextTestEntity.answer;
            mId = state.nextTestEntity.mid.toString();
            currentPage = state.nextTestEntity.number;
          }
          if(state is LoadedResultTestState){
            AutoRouter.of(context).replace(const FinishTestRoute());
          }
          if(state is LoadedFinishTestState){
            BlocProvider.of<TestBloc>(context)
                .add(ResultTestEvent(finishTestEntity: state.finishTestEntity));
          }
          if(state is ErrorTestState){
            return Stack(
              children: [
                Center(child: Text(state.error.toString())),
                bottomBackgroungImage()
              ],
            );
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
                            title: Text(lan == ''
                                ? item.title!
                                : lan == 'en'
                                ? item.titleEn!
                                : item.titleKy!
                              ,
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
                      if (currentOptionId != '') {
                        var tempTestInfo = TestInfoForNext(
                            test_id: testId!,
                            question_id: mId!,
                            answer_id: currentOptionId,
                            category_id: categoryId!,
                            number: currentPage.toString());
                        currentOptionId='';
                        currentPage!=numberofPages ? BlocProvider.of<TestBloc>(context).add(
                            NextTestEvent(testInfoForNext: tempTestInfo)) :
                        BlocProvider.of<TestBloc>(context).add(
                            FinishTestEvent(testInfoForNext: tempTestInfo));
                      }
                    },
                  )),
              bottomBackgroungImage()
            ],
          );
        },
      );
  },
),
    );
  }
}
