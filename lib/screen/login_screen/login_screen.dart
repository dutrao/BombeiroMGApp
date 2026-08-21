import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_application_1/screen/login_screen/cadastro_usuario_screen.dart';
import 'package:flutter_application_1/screen/recuperar_senha_screen/recuperar_senha_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController senhaController = TextEditingController();
bool obscureTextController = true;

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/fundo_login.png'),
                fit: BoxFit.cover,
                alignment: Alignment(0, 5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(0, 160, 0, 0),
                      child: Image.asset(
                        'assets/brasao.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(width: double.infinity, height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        key: Key('textoLogin'),
                        'Login',
                        style: GoogleFonts.prompt(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite o email';
                        }
                        if (!value.endsWith('@bombeiros.mg.gov.br')) {
                          return 'Verifique seu email';
                        }
                        return null;
                      },
                      key: ValueKey('campoEmail'),
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(width: double.infinity, height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Senha',
                        style: GoogleFonts.prompt(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite a senha';
                        }
                        return null;
                      },
                      key: ValueKey('campoSenha'),
                      controller: senhaController,
                      obscureText: obscureTextController,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () => setState(() {
                            obscureTextController = !obscureTextController;
                          }),
                          icon: obscureTextController == true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /* Flexible(
                            child: Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text(
                                  'Lembrar minha senha',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecuperarSenhaScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      key: Key('botaoEntrar'),
                      onPressed: () async {
                        await fazerLogin();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login),
                          SizedBox(width: 20),
                          Text(
                            'Entrar',
                            style: GoogleFonts.prompt(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroUsuarioScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Clique aqui para criar sua conta',
                        style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
          Container(
            color: Colors.black26,
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  Future<void> fazerLogin() async {
    if (!_formKey.currentState!.validate()) return;
    final timer = Timer(Duration(seconds: 5), () {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Serviço com lentidão. Verifique sua conexão com a internet',
                ),
              ),
            ],
          ),
        ),
      );
    });
    setState(() {
      isLoading = true;
    });

    try {
      await context.read<Repository>().fazerAutenticacao(
        emailController.text,
        senhaController.text,
      );
      timer.cancel();
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch(e) {
      timer.cancel();
      setState(() {
        isLoading = false;
      });
      print('Erro ao tentar logar: ${e.code}');
      String resposta = 'Algo aconteceu de errado. Tente novamente';
      switch (e.code){
        case 'invalid-credential':
        resposta =  'Email ou senha inválidos';
        break;
        case 'network-request-failed':
        resposta =  'Erro ao conectar com a internet. Verifique sua conexão';
        break;
      }      
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 4),
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Expanded(child: Text(resposta)),
            ],
          ),
        ),
      );
    }
  }
}
