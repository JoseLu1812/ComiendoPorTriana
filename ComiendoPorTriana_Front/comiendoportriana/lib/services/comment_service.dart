import 'package:comiendoportriana/models/comment.dart';
import 'package:comiendoportriana/models/comment_request.dart';
import 'package:comiendoportriana/repositories/comment_repository.dart';
import 'package:get_it/get_it.dart';

class CommentService {
  late CommentRespository _commentRespository;

  CommentService() {
    _commentRespository = GetIt.I.get<CommentRespository>();
  }

  Future<Comment> postNewComment(CommentRequest body, String id) async {
    return _commentRespository.createComment(body, id);
  }
}
