import 'package:dartz/dartz.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/beginTestEntity.dart';
import 'package:eco_kg/feature/test_feature/domain/entities/testIngoForBegin.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../entities/finishTestEntity.dart';
import '../entities/nextQuestionEntity.dart';
import '../entities/testIngoForNext.dart';

abstract interface class BeginTestRepository{
  Future<Either<Failure,BeginTestEntity>> beginTest(TestInfoForBegin testInfoForBegin);
  Future<Either<Failure,NextQuestionEntity>> nextTest(TestInfoForNext testInfoForBegin);
  Future<Either<Failure,FinishTestEntity>> finishTest(TestInfoForNext testInfoForBegin);
}