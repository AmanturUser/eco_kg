import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/param_entity.dart';
import '../../../../core/error_journal/error_journal.dart';

abstract interface class LibraryRepository{
  Future<Either<Failure,LibraryEntity>> postLibrary();
  Future<Either<Failure,ParamEntity>> getParam(String lanCode);
}
