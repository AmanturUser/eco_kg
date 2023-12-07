part of 'library_bloc.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();
}

class LibraryInitial extends LibraryState {
  @override
  List<Object> get props => [];
}

class LoadingLibraryState extends LibraryState{
  @override
  List<Object> get props=>[];
}

class LoadedLibraryState extends LibraryState{
  final LibraryEntity library;
  const LoadedLibraryState({required this.library});
  @override
  List<Object> get props=>[library];
}

class LoadedDetailLibraryState extends LibraryState{
  final DataProvider detailLibrary;
  const LoadedDetailLibraryState({required this.detailLibrary});
  @override
  List<Object> get props=>[detailLibrary];
}

class ErrorLibraryState extends LibraryState{
  final Object error;
  const ErrorLibraryState({required this.error});
  @override
  List<Object> get props=>[error];
}
