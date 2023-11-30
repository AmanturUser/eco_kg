part of 'next_test_bloc.dart';

abstract class NextTestState extends Equatable {
  const NextTestState();
}

class NextTestInitial extends NextTestState {
  @override
  List<Object> get props => [];
}

class LoadingNextTestState extends NextTestState{
  @override
  List<Object> get props=>[];
}

class LoadedNextTestState extends NextTestState{
  final NextQuestionEntity nextTestEntity;
  const LoadedNextTestState({required this.nextTestEntity});
  @override
  List<Object> get props=>[nextTestEntity];
}

class LoadedFinishTestState extends NextTestState{
  final FinishTestEntity finishTestEntity;
  const LoadedFinishTestState({required this.finishTestEntity});
  @override
  List<Object> get props=>[finishTestEntity];
}

class LoadedGetFromBeginTestState extends NextTestState{
  final String categoryId;
  final BeginTestEntity beginTestEntity;
  const LoadedGetFromBeginTestState({required this.beginTestEntity,required this.categoryId});
  @override
  List<Object> get props=>[beginTestEntity];
}

class ErrorNextTestState extends NextTestState{
  final Object error;
  const ErrorNextTestState({required this.error});
  @override
  List<Object> get props=>[error];
}

class ErrorFinishTestState extends NextTestState{
  final Object error;
  const ErrorFinishTestState({required this.error});
  @override
  List<Object> get props=>[error];
}