import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/checkConfirmationCode.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_case/sign_in.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final CheckConfirmationCode checkConfirmationCode;

  AuthBloc({required this.signIn, required this.checkConfirmationCode})
      : super(AuthInitial()) {
    on<SignInEvent>(_signIn);
    on<CheckConfirmationCodeEvent>(_checkConfirmationCode);
  }

  _signIn(SignInEvent event, Emitter emit) async {
    final email = event.email;
    emit(LoadingAuthState());
    if (email !='') {
      final either = await signIn.call(email);
      either
          .fold((error) => emit(ErrorAuthState(error: 'Ваши данные не верны')),
              (active) {
        if (active == true){
          emit(SuccessfullySignInState());
        }
        else if(active==false) {
          emit(ErrorAuthState(error: 'Ваши данные не верны'));
        }else{
          emit(ErrorAuthState(error: 'Ошибка'));
        }

      });
    } else {
      emit(ErrorAuthState(error: 'Введите данные'));
    }
  }

  _checkConfirmationCode(CheckConfirmationCodeEvent event, Emitter emit) async {
    final code = event.code;
    emit(LoadingAuthState());
    if (code !='') {
      final either = await checkConfirmationCode.call(code);
      either
          .fold((error) => emit(ErrorAuthState(error: 'Введите данные')),
              (active) {
            if (active){
              emit(SuccessfullyCheckCodeState());
            }
            else {
              emit(ErrorAuthState(error: 'Проверочный код не найден или устарел'));
            }

          });
    } else {
      emit(ErrorAuthState(error: 'Введите данные'));
    }
  }
}
