part of 'cat_bloc.dart';

@immutable
abstract class CatState {}

class CatInitial extends CatState {}

class GiftRetrivedState extends CatState {
  final Uint8List gift;
  GiftRetrivedState({required this.gift});
}

class LoadingState extends CatState {}

class ErrorState extends CatState {
  final String message;
  ErrorState({required this.message});
}
