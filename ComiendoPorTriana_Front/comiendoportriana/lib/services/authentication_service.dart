
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/repositories/repositories.dart';

abstract class AuthenticationService {
  Future<User?> getCurrentUser();
  Future<User> signInWithUsernameAndPassword(String username, String password);
  Future<void> signOut();
}
/*
class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<User?> getCurrentUser() async {
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      throw AuthenticationException(message: 'Wrong username or password');
    }
    return User(name: 'Test User', email: email);
  }

  @override
  Future<void> signOut() async {
    log("logout");
  }
}
*/

@Order(2)
//@Singleton(as: AuthenticationService)
@singleton
class JwtAuthenticationService extends AuthenticationService {

  late AuthenticationRepository _authenticationRepository;
  late LocalStorageService _localStorageService;
  late UserRepository _userRepository;

  JwtAuthenticationService() {
    _authenticationRepository = getIt<AuthenticationRepository>();
    _userRepository = getIt<UserRepository>();
    GetIt.I.getAsync<LocalStorageService>().then((value) => _localStorageService = value);
  }


  @override
  Future<User?> getCurrentUser() async {
    print("get current user");
    String? token = _localStorageService.getFromDisk("user_token");
    if (token != null) {
      UserResponse response = await _userRepository.me();
      return response;
    }
    return null;
  }

  @override
  Future<User> signInWithUsernameAndPassword(String username, String password) async {
    LoginResponse response = await _authenticationRepository.doLogin(username, password);
    //await _localStorageService.saveToDisk('user', jsonEncode(response.toJson()));
    await _localStorageService.saveToDisk('user_token', response.token);
    return User.fromLoginResponse(response);
  }

  @override
  Future<void> signOut() async {
    print("borrando token");
    await _localStorageService.deleteFromDisk("user_token");
  }

}