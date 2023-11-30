part of 'next_test_bloc.dart';

abstract class NextTestEvent extends Equatable {
  const NextTestEvent();
}

class GetFromBeginTestEvent extends NextTestEvent{
  final BeginTestEntity beginTestEntity;
  final String categoryId;
  const GetFromBeginTestEvent({required this.beginTestEntity,required this.categoryId});
  @override
  List<Object> get props=>[beginTestEntity];
}

class PostNextTestEvent extends NextTestEvent{
  final TestInfoForNext testInfoForNext;
  const PostNextTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}

class FinishTestEvent extends NextTestEvent{
  final TestInfoForNext testInfoForNext;
  const FinishTestEvent({required this.testInfoForNext});
  @override
  List<Object> get props=>[testInfoForNext];
}