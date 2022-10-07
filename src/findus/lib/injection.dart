import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

// see https://betterprogramming.pub/flutter-clean-architecture-test-driven-development-practical-guide-445f388e8604
// and repository https://raw.githubusercontent.com/codestronaut/flutter-weather-app-sample/main/lib/injection.dart
init() {
  // bloc
  //locator.registerFactory(() => WeatherBloc(locator()));

  // repository
  // locator.registerLazySingleton<WeatherRepository>(
  //   () => WeatherRepositoryImpl(
  //     remoteDataSource: locator(),
  //   ),
  // );

  // // data source
  // locator.registerLazySingleton<RemoteDataSource>(
  //   () => RemoteDataSourceImpl(
  //     client: locator(),
  //   ),
  // );

  // // external
  // locator.registerLazySingleton(() => http.Client());

  // add further initialization code
}
