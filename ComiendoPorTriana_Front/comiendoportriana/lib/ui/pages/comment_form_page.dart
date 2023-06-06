import 'package:comiendoportriana/blocs/comment_form/comment_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentFormPage extends StatefulWidget {
  const CommentFormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentFormPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CommentFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = BlocProvider.of<CommentFormBloc>(context);

          return Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.shade800)))),
              child: Builder(builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Título',
                              icon: Icon(Icons.title_outlined),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Cuerpo',
                              icon: Icon(Icons.text_snippet_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: formBloc.submit,
                        child: const Text("Comentar"))
                  ],
                );
              }));
        }));
  }
}
