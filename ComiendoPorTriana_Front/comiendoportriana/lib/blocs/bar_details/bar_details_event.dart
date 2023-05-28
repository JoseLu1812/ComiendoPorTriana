part of 'bar_details_bloc.dart';

abstract class BarDetailsEvent extends Equatable {
  const BarDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadBarDetails extends BarDetailsEvent {
  LoadBarDetails(this.barId);
  String barId;
}
