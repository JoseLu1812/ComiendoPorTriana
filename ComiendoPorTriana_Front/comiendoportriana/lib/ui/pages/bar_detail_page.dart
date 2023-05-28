import 'package:comiendoportriana/blocs/bar_details/bar_details_bloc.dart';
import 'package:comiendoportriana/models/bar_response.dart';
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
      switch (state.status!) {
        case BarDetailsStatus.failure:
          return Center(
              child: Column(
            children: [
              const Text('Error de carga', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  context.read<BarDetailsBloc>().add(LoadBarDetails(state.id));
                },
                child: const Text('Reintentar'),
              ),
            ],
          ));
        case BarDetailsStatus.success:
          return Scaffold(
            body: _barBody(state.bar!),
          );
        case BarDetailsStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

_barBody(BarResponse bar) {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
            child: Text(
              bar.nombre!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 10.0, 0.0),
            child: Text(
              bar.address!,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Couture',
                  color: Colors.redAccent.shade700),
              textAlign: TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
            child: Text(
              bar.descripcion!,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Couture',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
            child: Text(
              'Dueño: ${bar.owner!.fullName!}',
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Couture',
                fontWeight: FontWeight.normal
              ), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: TextButton(
              child: const Text('Reservar'),
              onPressed: () {},
            ),
          )
        ],
      ),
    ),
  );
}

