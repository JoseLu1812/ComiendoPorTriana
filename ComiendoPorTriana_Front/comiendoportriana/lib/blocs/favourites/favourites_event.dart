import 'package:equatable/equatable.dart';

abstract class FavouritesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class AddToFavourites extends FavouritesEvent {
  String id;
  AddToFavourites(this.id);
}

// ignore: must_be_immutable
class RemoveFromFavourites extends FavouritesEvent {
  String id;
  RemoveFromFavourites(this.id);
}
