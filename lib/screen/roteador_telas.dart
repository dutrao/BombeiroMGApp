import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/inicio_screen.dart';
import 'package:flutter_application_1/screen/login_screen/login_screen.dart';

class RoteadorTelas extends StatefulWidget {
  const RoteadorTelas({super.key});

  @override
  State<RoteadorTelas> createState() => _RoteadorTelasState();
}

class _RoteadorTelasState extends State<RoteadorTelas> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Scaffold(
          body: Center(child: CircularProgressIndicator(),),
        );
      }if(snapshot.hasData){
        return const InicioScreen();
      }
      return const LoginScreen();
},);
  }
}