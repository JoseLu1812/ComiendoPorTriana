import 'package:bloc/bloc.dart';
import 'package:comiendoportriana/blocs/favourites/favourites_event.dart';
import 'package:comiendoportriana/blocs/favourites/favourites_state.dart';
import 'package:comiendoportriana/services/services.dart';


class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  late final BarService _barService;

  FavouritesBloc(BarService barService)
      : super(const FavouritesInitial()) {
    on<FavouritesEvent>((event, emit) {});
    on<AddToFavourites>(_AddToFavourites);
    on<RemoveFromFavourites>(_RemoveFromFavourites);
  }

  // ignore: non_constant_identifier_names
  void _AddToFavourites(
      AddToFavourites event, Emitter<FavouritesState> emit) async {
    try {
      await _barService.addToFavourites(event.id);
      emit(FavouritesState(barId: event.id));
      return;
    } on Exception catch (e) {
      emit(FavouritesFailure(error: e.toString()));
    }
  }

  // ignore: non_constant_identifier_names
  void _RemoveFromFavourites(
      RemoveFromFavourites event, Emitter<FavouritesState> emit) async {
    try {
      await _barService.deleteFromFavourites(event.id);
      emit(FavouritesState(barId: event.id));
    } on Exception catch (e) {
      emit(FavouritesFailure(error: e.toString()));
    }
  }
}
