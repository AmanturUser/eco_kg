part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}


class TestInfoEvent extends TestEvent{
  final Test testInfo;
  const TestInfoEvent({required this.testInfo});
  @override
  List<Object> get props=>[testInfo];
}

class BeginTestEvent extends TestEvent{
  final TestInfoForBegin testInfoForBegin;
  const BeginTestEvent({required this.testInfoForBegin});
  @override
  List<Object> get props=>[testInfoForBegin];
}

class NextTestEvent extends TestEvent{
  final TestInfoForNext testInfoForNext;
  const NextTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}

class FinishTestEvent extends TestEvent{
  final TestInfoForNext testInfoForNext;
  const FinishTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}

class ResultTestEvent extends TestEvent{
  final FinishTestEntity finishTestEntity;
  const ResultTestEvent({required this.finishTestEntity});
  @override
  List<Object> get props=>[finishTestEntity];
}
