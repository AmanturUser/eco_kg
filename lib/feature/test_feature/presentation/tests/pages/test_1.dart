import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}
List<String> options=['Отель / Гостиница','Гостевой дом','Хостел'];

class _Test1State extends State<Test1> {

  String currentOption=options.first;
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Text('Тип предприятия:',style: AppTextStyles.clearSansMediumTextStyle16),
        SizedBox(height: 24),
        RadioListTile(title: Text('Отель / Гостиница',style: AppTextStyles.clearSansS14CBlackF400,),value: options[0], groupValue: currentOption, onChanged: (value){
          currentOption=value.toString();
          setState(() {

          });
        }),
        RadioListTile(title: Text('Гостевой дом',style: AppTextStyles.clearSansS14CBlackF400,),value: options[1], groupValue: currentOption, onChanged: (value){
          currentOption=value.toString();
          setState(() {

          });
        }),
        RadioListTile(title: Text('Хостел',style: AppTextStyles.clearSansS14CBlackF400,),value: options[2], groupValue: currentOption, onChanged: (value){
          currentOption=value.toString();
          setState(() {
          });
        }),
      ],
    );
  }
}
