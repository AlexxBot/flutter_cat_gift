import 'package:cat_gift/core/network/network_info.dart';
import 'package:cat_gift/features/cat/data/datasources/cat_remote_data.dart';
import 'package:cat_gift/features/cat/domain/repository/cat_repository.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;

import 'features/cat/data/repository/cat_repository_imple.dart';
import 'features/cat/domain/usecases/cat_usecase.dart';
import 'features/cat/presentation/bloc/cat_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: ".env");

  sl.registerFactory(() => CatBloc(catUseCase: sl()));

  sl.registerLazySingleton(() => CatUseCase(sl()));

  sl.registerLazySingleton<CatRepository>(
      () => CatRepositoryImple(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<CatRemoteData>(
      () => CatRemoteDataImple(client: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl(), dotenv.env['URL']!));

  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());
}
