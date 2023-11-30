import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/repository/repository.dart';

@injectable
class LibraryUseCase extends UseCase<LibraryEntity,NoParams>{
  final LibraryRepository libraryRepository;
  LibraryUseCase({required this.libraryRepository});

  @override
  Future<Either<Failure, LibraryEntity>> call(NoParams params) async{
    return await libraryRepository.postLibrary();
  }
}