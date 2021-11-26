import 'dart:typed_data';

import 'package:cat_gift/core/error/failure.dart';
import 'package:cat_gift/features/cat/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<Failure, Uint8List>> getRandomGift();
}

class CatUseCase implements UseCase {
  late final CatRepository repository;
  CatUseCase(this.repository);

  @override
  Future<Either<Failure, Uint8List>> getRandomGift() {
    return repository.getRandomGift();
  }
}
