import 'dart:typed_data';

import 'package:cat_gift/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, Uint8List>> getRandomGift();
}
