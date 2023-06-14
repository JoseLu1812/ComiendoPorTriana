import 'dart:math';

import 'package:comiendoportriana/blocs/bar_details/bar_details_bloc.dart';
import 'package:comiendoportriana/blocs/favourites/favourites_bloc.dart';
import 'package:comiendoportriana/blocs/favourites/favourites_event.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/services/bar_service.dart';
import 'package:comiendoportriana/ui/pages/comment_form_page.dart';
import 'package:comiendoportriana/ui/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String imgBase = "http://localhost:8080/download/";

// ignore: must_be_immutable
class BarDetailPage extends StatefulWidget {
  const BarDetailPage({super.key, required this.barId});
  final String barId;

  @override
  _BarDetailsBodyState createState() => _BarDetailsBodyState();
}

class _BarDetailsBodyState extends State<BarDetailPage> {
  late final String barId;
  bool _isFavorited = false;
  late BarService barService;
  late BarDetailsBloc _barDetailsBloc;

  @override
  void initState() {
    barService = getIt<BarService>();
    super.initState();
  }

  @override
  void dispose() {
    _barDetailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                BarDetailsBloc()..add(LoadBarDetails(widget.barId))),
        BlocProvider(create: (context) => FavouritesBloc(barService))
      ],
      child: Scaffold(
        body: createBody(context),
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return BlocBuilder<BarDetailsBloc, BarDetailsState>(
        builder: (context, state) {
      switch (state.status) {
        case BarDetailsStatus.failure:
          return Center(
              child: Column(
            children: [
              const Text('Error de carga', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<BarDetailsBloc>()
                      .add(LoadBarDetails(state.bar!.id!));
                },
                child: const Text('Reintentar'),
              ),
            ],
          ));
        case BarDetailsStatus.success:
          _isFavorited = state.fav!.favorito;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red.shade800,
              title: Image.asset(
                'assets/images/logo-title.png',
                height: 170,
                color: Colors.white,
              ),
              centerTitle: true,
            ),
            body: _barBody(state.bar!),
          );
        case BarDetailsStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget favorite(BarContent bar) {
    if (_isFavorited) {
      return Container(
        padding: const EdgeInsets.all(0),
        child: IconButton(
          icon: const Icon(Icons.favorite_border),
          color: Colors.red.shade800,
          onPressed: () {
            setState(() {
              _isFavorited = false;
            });
            BlocProvider.of<FavouritesBloc>(context)
                .add(RemoveFromFavourites(bar.id!));
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        BarDetailPage(barId: bar.id!)));
          },
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(0),
        child: IconButton(
          icon: const Icon(Icons.favorite),
          color: Colors.red.shade800,
          onPressed: () {
            setState(() {
              _isFavorited = true;
            });
            BlocProvider.of<FavouritesBloc>(context)
                .add(AddToFavourites(bar.id!));
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        BarDetailPage(barId: bar.id!)));
          },
        ),
      );
    }
  }

  _barBody(BarContent bar) {
    return SizedBox(
      height: 600,
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
                flex: 1,
                child: Image.network(
                  imgBase + bar.image!,
                  fit: BoxFit.cover,
                )),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  child: Text(
                    bar.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                favorite(bar)
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 10.0, 0.0),
              child: Text(
                bar.address!,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'LouisCafe',
                    color: Colors.redAccent.shade700),
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
              child: Text(
                bar.description!,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'LouisCafe',
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
              child: Text(
                'Dueño: ${bar.owner!.fullName!}',
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'LouisCafe',
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextButton.icon(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MapPage(lat: bar.lat, lng: bar.lng)))
                      },
                  icon: const Icon(Icons.map_outlined),
                  label: const Text("Mapa")),
            ),
          ],
        ),
      ),
    );
  }
}
