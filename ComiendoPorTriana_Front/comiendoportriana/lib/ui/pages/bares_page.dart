import 'package:comiendoportriana/blocs/bar/bar.dart';
import 'package:comiendoportriana/blocs/blocs.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/models.dart';
import 'package:comiendoportriana/ui/pages/bar_detail_page.dart';
import 'package:comiendoportriana/ui/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String imgBase = "http://localhost:8080/download/";

class BaresPage extends StatelessWidget {
  const BaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    Title(color: Colors.black, child: const Text('BARES'));
    return Scaffold(
      body: BlocProvider(
        create: (context) => BarBloc()..add(BarFetched()),
        child: const BaresBody(),
      ),
    );
  }
}

class BaresBody extends StatefulWidget {
  const BaresBody({super.key});

  @override
  State<BaresBody> createState() => _BaresBodyState();
}

class _BaresBodyState extends State<BaresBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarBloc, BarState>(builder: (context, state) {
      switch (state.status) {
        case BarStatus.failure:
          return Center(
              child: Column(
            children: [
              const Text('Error de carga', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  context.read<BarBloc>().add(BarFetched());
                },
                child: const Text('Reintentar'),
              ),
            ],
          ));
        case BarStatus.success:
          if (state.bar!.isEmpty) {
            return const Center(child: Text('No hay restaurantes'));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.bar!.length
                  ? const BottomLoader()
                  : _barItem(state.bar![index]);
            },
            itemCount:
                state.hasReachedMax ? state.bar!.length : state.bar!.length + 1,
            controller: _scrollController,
          );
        case BarStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  _barItem(BarContent bar) {
    return SizedBox(
      height: 300,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: Image.network(
                  imgBase + bar.image!,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
              child: Text(
                bar.name!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 10.0, 0.0),
              child: Text(
                bar.address!,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LouisCafe',
                    color: Colors.redAccent.shade700),
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
              child: Text(
                bar.description! + '..',
                style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'LouisCafe',
                    fontWeight: FontWeight.normal),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextButton.icon(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BarDetailPage(barId: bar.id!)),
                          ),
                        },
                        style: const ButtonStyle(alignment: Alignment.center),
                        label: const Text('Ver Más'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton.icon(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MapPage(lat: bar.lat, lng: bar.lng)))
                        },
                        icon: const Icon(Icons.map_outlined),
                        label: const Text("Mapa"),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
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
    if (_isBottom) context.read<BarBloc>().add(BarFetched());
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

void pushToBarDetails(String id){

}


class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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