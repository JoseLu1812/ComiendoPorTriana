import 'package:comiendoportriana/blocs/bar_details/bar_details_bloc.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/comment.dart';
import 'package:comiendoportriana/ui/pages/bares_page.dart';
import 'package:comiendoportriana/ui/pages/comment_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String imgBase = "http://localhost:8080/download/";

// ignore: must_be_immutable
class BarDetailPage extends StatelessWidget {
  BarDetailPage({super.key, required this.barId});

  String barId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarDetailsBloc()..add(LoadBarDetails(barId)),
      child: const BarDetailsBody(),
    );
  }
}

class BarDetailsBody extends StatefulWidget {
  const BarDetailsBody({super.key});

  @override
  State<BarDetailsBody> createState() => _BarDetailsBodyState();
}

class _BarDetailsBodyState extends State<BarDetailsBody> {
  @override
  Widget build(BuildContext context) {
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
            persistentFooterButtons: <Widget>[
              TextButton.icon(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CommentFormPage()))
                        },
                    icon: const Icon(Icons.abc),
                    label: const Text("Comentar")),
            ]
          );
        case BarDetailsStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
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
            )
          ),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                child: FavoriteWidget(),
              ),
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
              onPressed: () => {},
              icon: const Icon(Icons.table_restaurant_outlined),
              label: const Text("Reservar")
            ),
          )
        ],
      ),
    ),
  );
}

_commentsCard(BuildContext context){
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
    elevation: 5,
    margin: const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /*Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
          child: bar.comments!.isEmpty 
          ? _commentsListEmptyBody()
          : _commentsListBody(bar.comments!),
        ),*/
        TextButton.icon(
          onPressed: () => {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CommentFormPage())
            )
          }, 
          icon: const Icon(Icons.abc), 
          label: const Text("Comentar")
        ),
        FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CommentFormPage())
            )
          },                    
          backgroundColor: Colors.red.shade800,
          foregroundColor: Colors.white,
          hoverColor: Colors.red.shade400,
          elevation: 10,
          child: const Icon(Icons.add),
        ),
      ],
    ),
  );
}


_commentsListBody(List<Comment>? lista) {
  return ListView.builder(
    itemCount: lista!.length,
    itemBuilder: (context, index) {
      final comment = lista[index];

      return Card(
        child: ListTile(
          leading: Title(
              color: Colors.red.shade800, child: Text(comment.username!)),
          title: Text(comment.title!),
          subtitle: Text(comment.body!),
        ),
      );
    }
  );
}

_commentsListEmptyBody() {
  return const Card(
    child: Text("No existen comentarios"),
  );
}


class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border)),
            color: Colors.red.shade800,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}
