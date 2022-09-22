import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulflow/src/module/sanctuary/data/datasource/sanctum_local_datasource.dart';
import 'package:soulflow/src/module/sanctuary/data/datasource/sanctum_local_datasource_impl.dart';
import 'package:soulflow/src/module/sanctuary/data/repository/sanctum_repository_impl.dart';

import 'src/module/sanctuary/data/repository/sanctum_repository.dart';
import 'src/module/sanctuary/domain/usecase/create_sanctum_usecase.dart';
import 'src/module/sanctuary/domain/usecase/delete_sanctum_usecase.dart';
import 'src/module/sanctuary/presentation/bloc/sanctum_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => SanctumBloc(
      createSanctum: sl(),
      deleteSanctum: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(() => CreateSanctumUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeleteSanctumUsecase(repository: sl()));

  // Repository
  sl.registerLazySingleton<SanctumRepository>(
      () => SanctumRepositoryImpl(localDatasource: sl()));

  // Datasource
  sl.registerLazySingleton<SanctumLocalDatasource>(
      () => SanctumLocalDatasourceImpl(prefs: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
