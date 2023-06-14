part of 'bar_details_bloc.dart';

enum BarDetailsStatus { initial, success, failure }

class BarDetailsState extends Equatable {
  const BarDetailsState({this.bar, required this.status, this.fav});

  final BarDetailsStatus status;
  final BarContent? bar;
  final FavouriteResponse? fav;

  BarDetailsState copyWith({BarDetailsStatus? status, BarContent? bar, FavouriteResponse? fav}) {
    return BarDetailsState(status: status ?? this.status, bar: bar ?? this.bar, fav: fav ?? this.fav);
  }

  @override
  List<Object> get props => [status, bar!, fav!];
}

class BarDetailsInitial extends BarDetailsState {
  const BarDetailsInitial({required super.status});
}

class BarDetailsFailure extends BarDetailsState {
  const BarDetailsFailure({required super.status});
}
