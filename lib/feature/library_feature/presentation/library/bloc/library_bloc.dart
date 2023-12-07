import 'package:bloc/bloc.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../domain/use_case/libraryIUseCase.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryUseCase libraryUseCase;
  LibraryBloc({required this.libraryUseCase}) : super(LibraryInitial()) {
    on<GetLibraryEvent>(_getLibrary);
    on<DetailLibaryEvent>(_detailLibrary);
  }
  _getLibrary(GetLibraryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    final either=await libraryUseCase.call(NoParams());
    either.fold((error) => emit(ErrorLibraryState(error: error)), (library){
      print('len of products ${library.dataProvider.length}');
      emit(LoadedLibraryState(library: library));
    });
  }
  _detailLibrary(DetailLibaryEvent event,Emitter emit)async{
    emit(LoadingLibraryState());
    emit(LoadedDetailLibraryState(detailLibrary: event.detailLibrary));
  }
}
