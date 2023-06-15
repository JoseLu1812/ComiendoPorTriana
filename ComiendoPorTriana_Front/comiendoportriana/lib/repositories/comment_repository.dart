import 'dart:convert';

import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class CommentRespository {
  late RestAuthenticatedClient _rest;

  CommentRespository() {
    _rest = GetIt.I.get<RestAuthenticatedClient>();
  }

  Future<Comment> createComment(CommentRequest body, String id) async {
    String url = '/bar/$id/comment';
    var response = await _rest.post(url, body);
    return Comment.fromJson(jsonDecode(response));
  }

  
}
