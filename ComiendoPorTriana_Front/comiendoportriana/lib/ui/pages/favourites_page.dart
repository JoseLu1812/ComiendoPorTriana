import 'package:comiendoportriana/blocs/authentication/authentication.dart';
import 'package:comiendoportriana/blocs/profile/profile.dart';
import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/ui/pages/bar_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(FetchUserEvent()),
      child: const FavouritesUI(),
    );
  }
}

class FavouritesUI extends StatefulWidget {
  const FavouritesUI({super.key});

  @override
  State<FavouritesUI> createState() => _FavouritesUIState();
}

class _FavouritesUIState extends State<FavouritesUI> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

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
            if (state.user!.favList!.isEmpty) {
              return const Center(
                child: Text('Ningún restaurante marcado como favorito'),
              );
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return index >= state.user!.favList!.length
                  ? const Text('¡Búsqueda finalizada!')
                  : _favListView(state.user!.favList![index]);
              },
              controller: _scrollController,
            );
          case ProfileStatus.initial:
            return const CircularProgressIndicator();
        }
      },
    );
  }

    @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ProfileBloc>().add(FetchUserEvent());
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 1);
  }

  _favListView(BarContent bar) {
    return SizedBox(
      height: 100,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
}
