part of 'cat_bloc.dart';

@immutable
abstract class CatState {}

class CatInitial extends CatState {}

class GiftRetrivedState extends CatState {
  final Uint8List gift;
  GiftRetrivedState({required this.gift});
}
