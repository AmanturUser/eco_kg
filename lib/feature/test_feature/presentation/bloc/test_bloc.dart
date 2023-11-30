import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_case/begin_test_use_case.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final BeginTestUseCase beginTestUseCase;
  TestBloc({required this.beginTestUseCase}) : super(TestInitial()) {
    on<BeginTestEvent>(_beginTest);
  }

  _beginTest(BeginTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await beginTestUseCase.call(event.testInfoForBegin);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedTestState(testEntity: test));
    });
  }
}
