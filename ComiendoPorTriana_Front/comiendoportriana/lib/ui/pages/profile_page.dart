import 'package:comiendoportriana/blocs/profile/profile_bloc.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/user.dart';
import 'package:comiendoportriana/ui/pages/bar_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/blocs/authentication/authentication.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(FetchUserEvent()),
      child: const ProfileUI(),
    );
  }
}

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case ProfileStatus.failure:
            return Center(
                child: Column(
              children: [
                const Text('Fallo al cargar'),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(UserLoggedOut());
                  },
                  child: const Text("Reintentar"),
                )
              ],
            ));
          case ProfileStatus.standard:
            return _profileBody(state.user!);
          case ProfileStatus.initial:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  _profileBody(User user) {
    return SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Text(
                user.username!,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
              ),
              Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Nombre Completo:',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(' ${user.fullName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Email:',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(' ${user.email}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Fecha de creación:',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text('${user.createdAt}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.all(5),
                child: OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(UserLoggedOut());
                    },
                    child: const Text(
                      "Cerrar Sesión",
                    )),
              ),
            ]),
          ),
        ));
  }

  /*Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(10),
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= user.favList!.length
            ? _bottomLoader()
            : _favListView(user.favList![index]);
      },
    ),
  ),*/

  _favListView(BarContent bar) {
    return SizedBox(
      height: 100,
      child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    bar.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BarDetailPage(barId: bar.id!)),
                      ),
                    },
                    style: const ButtonStyle(alignment: Alignment.center),
                    child: const Text('Ver Más'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    child: const Text('Reservar'),
                    onPressed: () {},
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  _bottomLoader() {
    const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    ));
  }
}
