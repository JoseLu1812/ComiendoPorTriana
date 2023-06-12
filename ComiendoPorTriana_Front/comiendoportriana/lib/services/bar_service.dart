import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/repositories/bar_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@Order(5)
@singleton
class BarService {
  late BarRepository _barRepository;

  BarService() {
    _barRepository = GetIt.I.get<BarRepository>();
  }

  Future<List<BarContent>> getListaBares([int pag = 0]) async {
    return _barRepository.getListaBares(pag);
  }

  Future<BarContent> getBarContent(String barId) async {
    return _barRepository.getBarContent(barId);
  }

  Future<void> addToFavourites(String id) async {
    return _barRepository.addToFavourites(id);
  }

  Future<void> deleteFromFavourites(String id) async {
    return _barRepository.deleteFromFavourites(id);
  }
}
