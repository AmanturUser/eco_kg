import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';
import 'package:equatable/equatable.dart';
import '../../../home_feature/domain/entities/test.dart';
import '../../domain/entities/finishTestEntity.dart';
import '../../domain/entities/nextQuestionEntity.dart';
import '../../domain/entities/testIngoForNext.dart';
import '../../domain/use_case/begin_test_use_case.dart';
import '../../domain/use_case/finish_test_use_case.dart';
import '../../domain/use_case/next_text_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final BeginTestUseCase beginTestUseCase;
  final NextTestUseCase nextTestUseCase;
  final FinishTestUseCase finishTestUseCase;
  final storage = const FlutterSecureStorage();
  TestBloc({required this.nextTestUseCase,required this.finishTestUseCase, required this.beginTestUseCase}) : super(TestInitial()) {
    on<BeginTestEvent>(_beginTest);
    on<NextTestEvent>(_nextTest);
    on<FinishTestEvent>(_finishTest);
    on<TestInfoEvent>(_infoTest);
    on<ResultTestEvent>(_resultTest);
  }

  _infoTest(TestInfoEvent event,Emitter emit)async{
    emit(LoadingTestState());
    emit(LoadedInfoTestState(infoTest: event.testInfo));
  }

  _beginTest(BeginTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await beginTestUseCase.call(event.testInfoForBegin);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedTestState(testEntity: test,categoryId: event.testInfoForBegin.categoryId));
    });
  }

  _nextTest(NextTestEvent event,Emitter emit)async{
    emit(LoadingTestState());
    final either=await nextTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedNextTestState(nextTestEntity: test));
    });
  }

  _finishTest(FinishTestEvent event,Emitter emit)async{

    emit(LoadingTestState());
    final either=await finishTestUseCase.call(event.testInfoForNext);
    either.fold((error) => emit(ErrorTestState(error: error)), (test){
      emit(LoadedFinishTestState(finishTestEntity: test));
    });
  }

  _resultTest(ResultTestEvent event,Emitter emit)async{
    final String? email = await storage.read(key: 'email');
    emit(LoadingTestState());
    emit(LoadedResultTestState(finishTestEntity: event.finishTestEntity,email: email!));
  }
}
