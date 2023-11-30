part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();
}

class BeginTestEvent extends TestEvent{
  final TestInfoForBegin testInfoForBegin;
  const BeginTestEvent({required this.testInfoForBegin});
  @override
  List<Object> get props=>[testInfoForBegin];
}
