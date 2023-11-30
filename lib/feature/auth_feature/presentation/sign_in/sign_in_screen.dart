import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool secure = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.text.auth),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 30),
          Image.asset('assets/img/logo.png', height: 216, width: 216),
          const SizedBox(height: 20),
          emailFieldTemplate(hintText: context.text.email),
          const SizedBox(height: 16),
          // passwordFieldTemplate(hintText: context.text.password),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(const ForgotPasswordRoute());
                  },
                  child: Text(context.text.forgot_password,
                      style: AppTextStyles.linkTextStyle)),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return Center(child: progressWidget());
              }
              if (state is SuccessfullySignInState) {
                AutoRouter.of(context).push(const VerificationRoute());
              }
              if(state is ErrorAuthState){
                return Column(
                  children: [
                    InkWell(onTap: () {
                  BlocProvider.of<AuthBloc>(context)
                    .add(SignInEvent(email: email.text));
                }, child: button(text: context.text.continue_word)),
                    const SizedBox(height: 10),
                    Center(child: Text(state.error.toString()),),
                  ],
                );
              }
              return InkWell(onTap: () {
                BlocProvider.of<AuthBloc>(context)
                  .add(SignInEvent(email: email.text));
              }, child: button(text: context.text.continue_word));
            },
          ),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.text.no_account,
                  style: AppTextStyles.clearSansMediumTextStyle16),
              InkWell(
                onTap: () {
                  AutoRouter.of(context).replace(const SignUpRoute());
                },
                child: Text(' ${context.text.sign_up}',
                    style: AppTextStyles.linkTextStyle),
              )
            ],
          ),
        ],
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
          controller: email,
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

  /*passwordFieldTemplate({required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 358,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.colorF7F7F7,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 274,
            child: TextField(
              controller: password,
              obscureText: secure,
              obscuringCharacter: '*',
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.hintStyle,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              secure = !secure;
              setState(() {});
            },
            child: SizedBox(
              width: 28,
              child: Icon(
                  secure ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                  color: AppColors.color828282),
            ),
          )
        ],
      ),
    );
  }*/
}
