import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cat_gift/core/error/failure.dart';
import 'package:cat_gift/features/cat/domain/usecases/cat_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatUseCase catUseCase;
  CatBloc({required this.catUseCase}) : super(CatInitial());

  @override
  Stream<CatState> mapEventToState(
    CatEvent event,
  ) async* {
    if (event is GetRandomGift) {
      yield LoadingState();
      final failureOrRetrived = await catUseCase.getRandomGift();
      yield* _eitherRetrivedOrErrorState(failureOrRetrived);
    }
  }

  Stream<CatState> _eitherRetrivedOrErrorState(
      Either<Failure, Uint8List> failureOrRetrived) async* {
    yield failureOrRetrived.fold(
        (failure) => ErrorState(message: failure.message),
        (gift) => GiftRetrivedState(gift: gift));
  }
}
