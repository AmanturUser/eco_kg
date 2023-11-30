part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();
}

class FilterInitial extends FilterState {
  @override
  List<Object> get props => [];
}

class LoadingFilterState extends FilterState{
  @override
  List<Object> get props=>[];
}

class LoadedFilterState extends FilterState{
  final ParamEntity param;
  LoadedFilterState({required this.param});
  @override
  List<Object> get props=>[param];
}

class ErrorFilterState extends FilterState{
  final Object error;
  ErrorFilterState({required this.error});
  @override
  List<Object> get props=>[error];
}

