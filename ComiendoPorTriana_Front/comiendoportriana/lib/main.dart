import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/blocs/blocs.dart';
import 'package:comiendoportriana/services/services.dart';
import 'package:comiendoportriana/ui/pages/pages.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await SharedPreferences.getInstance();
  setupAsyncDependencies();
  configureDependencies();
  //await getIt.allReady();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      //GlobalContext.ctx = context;
      final authService = getIt<JwtAuthenticationService>();
      return AuthenticationBloc(authService)..add(AppLoaded());
    },
    child: MyApp(),
  ));
}

class GlobalContext {
  static late BuildContext ctx;
}

class MyApp extends StatelessWidget {
  //static late  AuthenticationBloc _authBloc;

  static late MyApp _instance;

  static Route route() {
    print("Enrutando al login");
    return MaterialPageRoute<void>(builder: (context) {
      var authBloc = BlocProvider.of<AuthenticationBloc>(context);
      authBloc.add(SessionExpiredEvent());
      return _instance;
    });
  }

  MyApp({super.key}) {
    _instance = this;
  }

  @override
  Widget build(BuildContext context) {
    //GlobalContext.ctx = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light, 
          primary: Colors.red.shade800, 
          onPrimary: Colors.white, 
          secondary: Colors.amber.shade600, 
          onSecondary: Colors.white, 
          error: Colors.blue.shade800, 
          onError: Colors.white, 
          background: Colors.red.shade400, 
          onBackground: Colors.white, 
          surface: Colors.grey, 
          onSurface: Colors.grey.shade800),
        fontFamily: 'KeepCalm'
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          GlobalContext.ctx = context;
          if (state is AuthenticationAuthenticated) {
            // show home page
            return const HomePage();
          }
          // otherwise show login page
          return const LoginPage();
        },
      ),
    );
  }
}
