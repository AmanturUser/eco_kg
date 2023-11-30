import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/param_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_case/paramUseCase.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final ParamUseCase paramUseCase;
  FilterBloc({required this.paramUseCase}) : super(FilterInitial()) {
    on<GetParamEvent>(_getParam);
  }
  _getParam(GetParamEvent event,Emitter emit)async{
    emit(LoadingFilterState());
    final either=await paramUseCase.call(event.lanCode);
    either.fold((error) => emit(ErrorFilterState(error: error)), (param){
      emit(LoadedFilterState(param: param));
    });
  }
}
