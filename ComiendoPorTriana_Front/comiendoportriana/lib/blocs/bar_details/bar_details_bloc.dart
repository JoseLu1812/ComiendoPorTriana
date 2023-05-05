import 'package:bloc/bloc.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bar_details_event.dart';
part 'bar_details_state.dart';

class BarDetailsBloc extends Bloc<BarDetailsEvent, BarDetailsState> {
  late final BarService _barService;

  late String bar_id;

  BarDetailsBloc() : super(BarDetailsInitial()) {
    _barService = getIt<BarService>();
    on<BarDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
