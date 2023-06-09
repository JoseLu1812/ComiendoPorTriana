import 'package:bloc/bloc.dart';
import 'package:comiendoportriana/rest/rest_client.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../authentication/authentication.dart';
import '../../services/services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : assert(authenticationBloc != null),
        assert(authenticationService != null),
        _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(LoginInitial()) {
    on<LoginInWithUsernameButtonPressed>(__onLogingInWithEmailButtonPressed);
  }

  __onLogingInWithEmailButtonPressed(
    LoginInWithUsernameButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await _authenticationService.signInWithUsernameAndPassword(
          event.username, event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        emit(LoginSuccess());
        emit(LoginInitial());
      } else {
        emit(LoginFailure(error: 'Something very weird just happened'));
      }
    } on AuthenticationException catch (e) {
      emit(LoginFailure(error: e.message));
    } on CustomException catch (err) {
      emit(LoginFailure(error: 'An unknown error occurred ${err.message}'));
    }
  }
}
