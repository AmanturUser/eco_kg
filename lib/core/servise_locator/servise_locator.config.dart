import 'package:eco_kg/feature/auth_feature/domain/use_case/checkConfirmationCode.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/read_auth_key.dart';
import 'package:eco_kg/feature/auth_feature/domain/use_case/sign_in.dart';
import 'package:eco_kg/feature/library_feature/data/data_source/library_server.dart';
import 'package:eco_kg/feature/library_feature/data/repositories/library_repository.dart';
import 'package:eco_kg/feature/library_feature/domain/repository/repository.dart';
import 'package:eco_kg/feature/library_feature/domain/use_case/libraryIUseCase.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/test_feature/domain/use_case/begin_test_use_case.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import '../../feature/auth_feature/data/data_source/auth_server.dart';
import '../../feature/auth_feature/data/repositories/auth_repository.dart';
import '../../feature/auth_feature/domain/repository/repository.dart';
import '../../feature/auth_feature/presentation/bloc/auth_bloc.dart';
import '../../feature/library_feature/domain/use_case/paramUseCase.dart';
import '../../feature/library_feature/presentation/filter/bloc/filter_bloc.dart';
import '../../feature/library_feature/presentation/library/bloc/library_bloc.dart';
import '../../feature/test_feature/data/data_source/test_server.dart';
import '../../feature/test_feature/data/repositories/begin_test_repository.dart';
import '../../feature/test_feature/domain/repository/repository.dart';
import '../../feature/test_feature/domain/use_case/finish_test_use_case.dart';
import '../../feature/test_feature/domain/use_case/next_text_use_case.dart';
import '../../feature/test_feature/presentation/bloc/test_bloc.dart';

extension GetItInjectableX on _i1.GetIt {
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );

    gh.factory<LanguageBloc>(() => LanguageBloc());

    gh.factory<AuthSourse>(() => AuthSourse());
    gh.factory<AuthRepository>(
            () => AuthRepositoryImpl(authSourse: gh<AuthSourse>()));
    gh.factory<SignIn>(
            () => SignIn(authRepository: gh<AuthRepository>()));
    gh.factory<ReadAuthKey>(
            () => ReadAuthKey(authRepository: gh<AuthRepository>()));
    gh.factory<CheckConfirmationCode>(
            () => CheckConfirmationCode(authRepository: gh<AuthRepository>()));
    gh.factory<AuthBloc>(() => AuthBloc(
      signIn: gh<SignIn>(),
      readAuthKey: gh<ReadAuthKey>(),
      checkConfirmationCode: gh<CheckConfirmationCode>(),
    ));

    gh.factory<LibraryDataSourse>(() => LibraryDataSourse());
    gh.factory<LibraryRepository>(
            () => LibraryRepositoryImpl(libraryDataSourse: gh<LibraryDataSourse>()));
    gh.factory<LibraryUseCase>(
            () => LibraryUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<ParamUseCase>(
            () => ParamUseCase(libraryRepository: gh<LibraryRepository>()));
    gh.factory<LibraryBloc>(() => LibraryBloc(
      libraryUseCase: gh<LibraryUseCase>(),
    ));
    gh.factory<FilterBloc>(() => FilterBloc(
      paramUseCase: gh<ParamUseCase>(),
    ));


    gh.factory<TestDataSource>(() => TestDataSource());
    gh.factory<TestRepository>(
            () => TestRepositoryImpl(testDataSource: gh<TestDataSource>()));

    gh.factory<BeginTestUseCase>(
            () => BeginTestUseCase(beginTestRepository: gh<TestRepository>()));
    gh.factory<NextTestUseCase>(
            () => NextTestUseCase(beginTestRepository: gh<TestRepository>()));
    gh.factory<FinishTestUseCase>(
            () => FinishTestUseCase(beginTestRepository: gh<TestRepository>()));

    gh.factory<TestBloc>(() => TestBloc(
      beginTestUseCase: gh<BeginTestUseCase>(),
      nextTestUseCase: gh<NextTestUseCase>(),
      finishTestUseCase: gh<FinishTestUseCase>(),
    ));


    return this;
  }
}
