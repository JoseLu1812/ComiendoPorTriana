import 'package:comiendoportriana/ui/pages/bares_page.dart';
import 'package:comiendoportriana/ui/pages/login_page.dart';
import 'package:comiendoportriana/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/blocs/authentication/authentication.dart';
//import 'package:go_router/go_router.dart';


/*final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'bares',
          builder: (BuildContext context, GoRouterState state) {
            return const BaresPage();
          },
        ),
      ],
    ),
  ],
);*/


List<Widget> _widgetOptions = <Widget>[
  BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
    if (state is AuthenticationNotAuthenticated) {
      return const LoginPage();
    } else if (state is AuthenticationAuthenticated) {
      return const BaresPage();
    }
    return const Text("Loading");
  }),
  const ProfilePage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo-title.png',
            height: 170, 
            color: Colors.white,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () => {authBloc.add(UserLoggedOut())},
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurantes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
