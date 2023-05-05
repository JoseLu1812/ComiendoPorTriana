import 'package:comiendoportriana/blocs/bar_details/bar_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarDetailPage extends StatelessWidget {
  const BarDetailPage({super.key, required});

  @override
  Widget build(BuildContext context) {
    Title(color: Colors.black, child: child);
    return BlocProvider(
      create: (context) => BarDetailsBloc()..add(LoadBarDetails()),
      child: ,
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarDetailsBloc, BarDetailsState>(builder: (context, state){
      switch (state.status) {
        case BarDetailsStatus.failure:
          return Center(
              child: Column(
            children: [
              Text('Error de carga', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  context.read<BarDetailsBloc>().add(LoadBarDetails());
                },
                child: Text('Reintentar'),
              ),
            ],
          ));
        case BarDetailsStatus.success:
          return Scaffold(
            
          );
        case BarDetailsStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
