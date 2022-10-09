import 'package:findus/data/dataprovider/findus_api.dart';
import 'package:findus/ui/animal/cubit/animal_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:findus/data/repository/animal_repository.dart';
import 'package:dio/dio.dart';

final locator = GetIt.instance;

// see https://betterprogramming.pub/flutter-clean-architecture-test-driven-development-practical-guide-445f388e8604
// and repository https://raw.githubusercontent.com/codestronaut/flutter-weather-app-sample/main/lib/injection.dart
init() {
  // cubit for animals
  locator.registerFactory(() => AnimalCubit(locator()));

  // repository

  locator.registerLazySingleton<AnimalRepository>(
      () => AnimalRepository(findusApi: locator()));

  // data source
  locator.registerLazySingleton<FindusAPI>(
    () => FindusAPI(dio: locator()),
  );

  // add further initialization code
  // external
  locator.registerLazySingleton(() => Dio());
}
