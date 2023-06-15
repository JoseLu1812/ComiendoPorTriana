import 'package:equatable/equatable.dart';

enum FavouriteStatus { initial, success, failure}

class FavouritesState extends Equatable {
  const FavouritesState({this.barId});

  final String? barId;

  FavouritesState copyWih(String? barId) {
    return FavouritesState(barId: barId ?? this.barId);
  }

  @override
  List<Object> get props => [barId!];
}

class FavouritesInitial extends FavouritesState {
  const FavouritesInitial();
}

class FavouritesFailure extends FavouritesState {
  final String error;

  const FavouritesFailure({required this.error});

  @override
  List<Object> get props => [error];
}
