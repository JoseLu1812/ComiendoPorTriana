part of 'bar_details_bloc.dart';

enum BarDetailsStatus { initial, success, failure }

class BarDetailsState extends Equatable {
  const BarDetailsState({this.bar, required this.status});

  final BarDetailsStatus status;
  final BarContent? bar;

  BarDetailsState copyWith({BarDetailsStatus? status, BarContent? bar}) {
    return BarDetailsState(status: status ?? this.status, bar: bar ?? this.bar);
  }

  @override
  List<Object> get props => [status, bar!];
}

class BarDetailsInitial extends BarDetailsState {
  const BarDetailsInitial({required super.status});}
