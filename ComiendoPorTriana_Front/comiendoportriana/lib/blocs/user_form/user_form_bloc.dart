import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/user_register.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class UserFormBloc extends FormBloc<String, String> {
  late final UserService _userService;

  final email = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final username = TextFieldBloc(
    validators: [FieldBlocValidators.required],
  );
  final password = TextFieldBloc(validators: [FieldBlocValidators.required]);
  final verifiedPassword =
      TextFieldBloc(validators: [FieldBlocValidators.required]);
  final fullName = TextFieldBloc(validators: [FieldBlocValidators.required]);

  UserFormBloc() {
    _userService = getIt<UserService>();
    addFieldBlocs(fieldBlocs: [email, username, password, verifiedPassword, fullName]);
  }

  @override
  void onSubmitting() async {
    try {
      await _userService.createUser(UserRegister(email.value, username.value, password.value,
          verifiedPassword.value, fullName.value));
      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
