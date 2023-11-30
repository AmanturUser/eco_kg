import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/nextQuestionEntity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/beginTestEntity.dart';
import '../../../domain/entities/finishTestEntity.dart';
import '../../../domain/entities/testIngoForNext.dart';
import '../../../domain/use_case/finish_test_use_case.dart';
import '../../../domain/use_case/next_text_use_case.dart';

part 'next_test_event.dart';
part 'next_test_state.dart';

class NextTestBloc extends Bloc<NextTestEvent, NextTestState> {
  final NextTestUseCase nextTestUseCase;
  final FinishTestUseCase finishTestUseCase;
  NextTestBloc({required this.nextTestUseCase,required this.finishTestUseCase}) : super(NextTestInitial()) {
    on<GetFromBeginTestEvent>(_getFromBeginTestEvent);
    on<PostNextTestEvent>(_nextTest);
    on<FinishTestEvent>(_finishTest);
  }
  _getFromBeginTestEvent(GetFromBeginTestEvent event,Emitter emit){
    emit(LoadedGetFromBeginTestState(beginTestEntity: event.beginTestEntity,categoryId: event.categoryId));
  }
  _nextTest(PostNextTestEvent event,Emitter emit)async{
    emit(LoadingNextTestState());
    final either=await nextTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorNextTestState(error: error)), (test){
      print('loadedNextTest');
      emit(LoadedNextTestState(nextTestEntity: test));

    });
  }
  _finishTest(FinishTestEvent event,Emitter emit)async{
    emit(LoadingNextTestState());
    final either=await finishTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorFinishTestState(error: error)), (test){
      emit(LoadedFinishTestState(finishTestEntity: test));
    });
  }
}



