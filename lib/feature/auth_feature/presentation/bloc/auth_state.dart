part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingAuthState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullySignInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullyCheckCodeState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessfullySignUpState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ErrorAuthState extends AuthState {
  final Object error;
  ErrorAuthState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class ErrorSignUpState extends AuthState {
  final Object error;
  ErrorSignUpState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
