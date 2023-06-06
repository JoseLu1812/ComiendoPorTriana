import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/comment_request.dart';
import 'package:comiendoportriana/services/comment_service.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get_it/get_it.dart';


class CommentFormBloc extends FormBloc<String, String> {
  late final CommentService _commentService;

  final title = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  final body = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  final barId = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );

  CommentFormBloc() {
    _commentService = getIt<CommentService>();
    addFieldBlocs(fieldBlocs: [title, body, barId]);
  }

  @override
  void onSubmitting() async {
    try {
      await _commentService.postNewComment(
          CommentRequest(title.value, body.value), barId.value);
      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
