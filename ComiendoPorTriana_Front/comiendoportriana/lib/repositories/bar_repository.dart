import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

import 'package:injectable/injectable.dart';

const String urlBase = '/bar';

@Order(-5)
@singleton
class BarRepository {
  late RestAuthenticatedClient _rest;

  BarRepository() {
    _rest = GetIt.I.get<RestAuthenticatedClient>();
  }

  Future<List<BarContent>> getListaBares(int pag) async {
    String url = '$urlBase?page=$pag';
    var response = await _rest.get(url);
    final bares = BarList.fromJson(jsonDecode(response));
    return bares.content!;
  }

  Future<BarContent> getBarContent(String barId) async {
    String url = '$urlBase/$barId';
    var response = await _rest.get(url);
    return BarContent.fromJson(jsonDecode(response));
  }

  Future<void> addToFavourites(String id) async {
    String url = '$urlBase/favourites/add/$id';
    var response = await _rest.post(url, id);
    return response;
  }

  Future<void> deleteFromFavourites(String id) async {
    String url = '$urlBase/favourites/delete/$id';
    var response = await _rest.delete(url, id);
    return response;
  }
}
