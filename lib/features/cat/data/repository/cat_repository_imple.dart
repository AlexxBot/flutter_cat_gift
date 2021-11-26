import 'package:cat_gift/core/error/exception.dart';
import 'package:cat_gift/core/error/failure.dart';
import 'package:cat_gift/core/network/network_info.dart';
import 'package:cat_gift/features/cat/data/datasources/cat_remote_data.dart';
import 'dart:typed_data';

import 'package:cat_gift/features/cat/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImple extends CatRepository {
  final CatRemoteData remoteDataSource;
  final NetworkInfo networkInfo;
  CatRepositoryImple(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Uint8List>> getRandomGift() async {
    if (await networkInfo.isConnected) {
      try {
        final accesos = await remoteDataSource.getRandomGift();
        return Right(accesos);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(message: m.message));
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
