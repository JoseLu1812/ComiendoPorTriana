part of 'bar_details_bloc.dart';

enum BarDetailsStatus { initial, success, failure }

class BarDetailsState extends Equatable {
  final BarResponse? response;
  final BarDetailsStatus? status;

  const BarDetailsState({this.response, this.status});

  BarDetailsState copyWith({BarResponse? response, User? user, BarDetailsStatus? status}) {
    return BarDetailsState(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [response ?? BarResponse];
}

class BarDetailsInitial extends BarDetailsState {}
