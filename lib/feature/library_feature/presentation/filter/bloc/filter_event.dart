part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class GetParamEvent extends FilterEvent{
  final String lanCode;
  const GetParamEvent({required this.lanCode});
  @override
  List<Object> get props=>[lanCode];
}