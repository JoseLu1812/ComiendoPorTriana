import 'package:comiendoportriana/blocs/user_form/user_form_bloc.dart';
import 'package:comiendoportriana/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:async';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFormPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFormBloc(),
      child: Builder(builder: (context) {
        final formBloc = BlocProvider.of<UserFormBloc>(context);

        return Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade800)),
            ),
          ),
          child: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(title: const Text('Registro')),
                body: FormBlocListener<UserFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    LoadingDialog.show(context);
                  },
                  onSuccess: (context, state) {
                    LoadingDialog.hide(context);

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SuccessScreen()));
                  },
                  onFailure: (context, state) {
                    LoadingDialog.hide(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failureResponse!)));
                  },
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.email,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.username,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.password,
                            decoration: const InputDecoration(
                              labelText: 'Contraseña',
                              prefixIcon: Icon(Icons.password),
                            ),
                            obscureText: true,
                            obscureTextTrueIcon: const Icon(Icons.visibility),
                            obscureTextFalseIcon: const Icon(Icons.visibility_off),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.verifiedPassword,
                            decoration: const InputDecoration(
                              labelText: 'Repite Contraseña',
                              prefixIcon: Icon(Icons.lock_reset),
                            ),
                            obscureText: true,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: formBloc.fullName,
                            decoration: const InputDecoration(
                              labelText: 'Nombre Completo',
                              prefixIcon: Icon(Icons.badge),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: formBloc.submit,
                            child: const Text('Registrarse'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

  


class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline_rounded,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            Text(
              'Registrado Correctamente',
              style: TextStyle(fontSize: 24, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
