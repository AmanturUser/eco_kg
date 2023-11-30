import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/style/app_text_styles.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/appBarLeadintBack.dart';
import '../widgets/button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _onEditing = true;
  String _code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: appBarLeading(context)
        ),
        leadingWidth: 100,

      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 30),
          Text(context.text.verification_code,
              style: AppTextStyles.clearSansMediumTextStyle20),
          const SizedBox(height: 10),
          Text(context.text.verification_code_subtitle,
              style: AppTextStyles.clearSansMedium16cl82),
          const SizedBox(height: 50),
          VerificationCode(
            underlineWidth: 1.2,
            fullBorder: true,
            fillColor: AppColors.colorE8ECF4,
            itemSize: 60,
            textStyle: AppTextStyles.clearSansMedium22,
            keyboardType: TextInputType.number,
            underlineColor: AppColors.color009D9B,
            length: 4,
            cursorColor:
            AppColors.color009D9B,
            underlineUnfocusedColor: AppColors.colorE8ECF4,
            colorAfter: AppColors.color009D9B,
            margin: const EdgeInsets.all(12),
            onCompleted: (String value) {
              setState(() {
                _code = value;
              });
              print(_code);
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(height: 80),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return Center(child: progressWidget());
              }
              if (state is SuccessfullyCheckCodeState) {

                AutoRouter.of(context).replaceAll([const HomeRoute()]);
              }
              if(state is ErrorAuthState){
                return Column(
                  children: [
                    InkWell(onTap: () {
                  if (_code.length == 4)
                    BlocProvider.of<AuthBloc>(context)
                        .add(CheckConfirmationCodeEvent(code: _code!));
                }, child: button(text: context.text.apply)),
                    const SizedBox(height: 20),
                    Center(child: Text(state.error.toString()),),
                  ],
                );
              }
              return InkWell(onTap: () {
                if (_code.length == 4)
                  BlocProvider.of<AuthBloc>(context)
                      .add(CheckConfirmationCodeEvent(code: _code!));
              }, child: button(text: context.text.apply));
            },
          ),
          const SizedBox(height: 230),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.text.smsNot} ',
                  style: AppTextStyles.clearSansMediumTextStyle16),
              InkWell(
                onTap: () {},
                child: Text(context.text.send_code_again,
                    style: AppTextStyles.linkTextStyle),
              )
            ],
          ),
        ],
      ),
    );
  }
}
