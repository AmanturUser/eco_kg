part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}

class LoadingTestState extends TestState{
  @override
  List<Object> get props=>[];
}

class LoadedTestState extends TestState{
  final BeginTestEntity testEntity;
  const LoadedTestState({required this.testEntity});
  @override
  List<Object> get props=>[testEntity];
}

class ErrorTestState extends TestState{
  final Object error;
  const ErrorTestState({required this.error});
  @override
  List<Object> get props=>[error];
}