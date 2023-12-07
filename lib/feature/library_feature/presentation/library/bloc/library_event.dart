part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();
}

class GetLibraryEvent extends LibraryEvent{
  @override
  List<Object> get props=>[];
}

class DetailLibaryEvent extends LibraryEvent{

  final DataProvider detailLibrary;

  const DetailLibaryEvent({required this.detailLibrary});

  @override
  List<Object> get props=>[detailLibrary];
}