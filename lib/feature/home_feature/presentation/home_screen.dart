import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:eco_kg/feature/home_feature/widget/drawerWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/user.dart';
import '../../test_feature/presentation/main_test_screen.dart';
import '../domain/entities/test.dart';
import '../widget/bottom_background_image.dart';
import '../widget/testIcon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var testList = Test.testList;
    return Scaffold(
        drawer: drawerBuild(context,UserEnum.applicant),
        appBar: AppBar(
          title: const Text('Главная'),
        ),
        body: Stack(children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            itemCount: testList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MainTestScreen(testInfo: testList[index])));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 358,
                  height: 88,
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
                    children: [
                      testIconWidget(testList[index].backColor,testList[index].iconPath),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Тест ${index + 1}',
                                  style:
                                      AppTextStyles.clearSansMediumTextStyle18),
                              const SizedBox(width: 182),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColors.color009D9B,
                              )
                            ],
                          ),
                          SizedBox(
                              width: 259,
                              child: Text(
                                testList[index].testTitle,
                                style: AppTextStyles.hintStyle,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 32);
            },
          ),
          bottomBackgroungImage()
        ]));
  }
}

