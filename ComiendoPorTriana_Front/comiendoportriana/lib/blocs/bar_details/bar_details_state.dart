part of 'bar_details_bloc.dart';

enum BarDetailsStatus { initial, success, failure }

class BarDetailsState extends Equatable {

  final String id;
  final BarDetailsStatus? status;
  BarResponse? bar;

  BarDetailsState({
    this.id = "", 
    this.status = BarDetailsStatus.initial, 
    this.bar
  });

  @override
  List<Object> get props => [id, status!, bar!];
}

class BarDetailsInitial extends BarDetailsState {}
