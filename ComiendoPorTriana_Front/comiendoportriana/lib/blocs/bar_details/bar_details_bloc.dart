import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:equatable/equatable.dart';

part 'bar_details_event.dart';
part 'bar_details_state.dart';

class BarDetailsBloc extends Bloc<BarDetailsEvent, BarDetailsState> {
  late final BarService _barService;

  BarDetailsBloc() : super(const BarDetailsInitial(status: BarDetailsStatus.initial)) {
    _barService = getIt<BarService>();
    on<LoadBarDetails>(
      _onLoadBarDetails,
    );
  }

  FutureOr<void> _onLoadBarDetails(
      LoadBarDetails event, Emitter<BarDetailsState> emit) async {
    try {
      final barDetail = await _barService.getBarContent(event.barId);
      return emit(BarDetailsState(bar: barDetail , status: BarDetailsStatus.success));
    } catch (_) {
      emit(const BarDetailsFailure(status: BarDetailsStatus.failure));
    }
  }


}
