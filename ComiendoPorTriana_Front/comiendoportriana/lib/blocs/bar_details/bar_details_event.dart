part of 'bar_details_bloc.dart';

abstract class BarDetailsEvent extends Equatable {
  const BarDetailsEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoadBarDetails extends BarDetailsEvent {
  String barId;
  LoadBarDetails(this.barId);
}
