import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/inicio_screen/inicio_screen.dart';
import 'package:flutter_application_1/screen/login_screen/login_screen.dart';

class RoteadorTelas extends StatefulWidget {
  const RoteadorTelas({super.key});

  @override
  State<RoteadorTelas> createState() => _RoteadorTelasState();
}

class _RoteadorTelasState extends State<RoteadorTelas> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final usuario = snapshot.data;

        // Não está autenticado
        if (usuario == null) {
          return const LoginScreen();
        }

        // Está autenticado, mas ainda não confirmou o e-mail
        if (!usuario.emailVerified) {
          return const LoginScreen();
        }

        // Está autenticado E confirmou o e-mail
        return const InicioScreen();
      },
    );
  }
}
