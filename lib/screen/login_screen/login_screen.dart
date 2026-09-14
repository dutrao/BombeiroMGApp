import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
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
            decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Image.asset(
                        'assets/brasao.png',
                        width: 200,
                        height: 200,
                      ),
                    ),

                    const SizedBox(width: double.infinity, height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        key: const Key('textoLogin'),
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

                        if (!value.trim().toLowerCase().endsWith(
                          '@bombeiros.mg.gov.br',
                        )) {
                          return 'Verifique seu email';
                        }

                        return null;
                      },
                      key: const ValueKey('campoEmail'),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),

                    const SizedBox(width: double.infinity, height: 20),

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
                      key: const ValueKey('campoSenha'),
                      controller: senhaController,
                      obscureText: obscureTextController,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextController = !obscureTextController;
                            });
                          },
                          icon: obscureTextController
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RecuperarSenhaScreen(),
                                ),
                              );
                            },
                            child: const Text(
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
                      key: const Key('botaoEntrar'),
                      onPressed: isLoading
                          ? null
                          : () async {
                              await fazerLogin();
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.login),
                          const SizedBox(width: 20),
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
                            builder: (context) => const CadastroUsuarioScreen(),
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
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  Future<void> fazerLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Timer? timer;

    setState(() {
      isLoading = true;
    });

    try {
      timer = Timer(const Duration(seconds: 5), () {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Serviço com lentidão. '
                    'Verifique sua conexão com a internet.',
                  ),
                ),
              ],
            ),
          ),
        );
      });

      // ==========================================
      // REALIZA O LOGIN
      // ==========================================

      final credencial = await context.read<Repository>().fazerAutenticacao(
        emailController.text.trim(),
        senhaController.text,
      );

      timer.cancel();

      final usuario = credencial.user;

      // ==========================================
      // USUÁRIO NULO
      // ==========================================

      if (usuario == null) {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 4),
            content: Row(
              children: [
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Não foi possível obter os dados da conta.'),
                ),
              ],
            ),
          ),
        );

        return;
      }

      // ==========================================
      // ATUALIZA OS DADOS DO USUÁRIO
      // ==========================================
      //
      // Importante porque o usuário pode ter acabado
      // de clicar no link de confirmação no e-mail.

      await usuario.reload();

      final usuarioAtualizado = FirebaseAuth.instance.currentUser;

      debugPrint('Usuário: ${usuarioAtualizado?.email}');

      debugPrint('Conta ativada: ${usuarioAtualizado?.emailVerified}');

      // ==========================================
      // USUÁRIO ATUALIZADO NULO
      // ==========================================

      if (usuarioAtualizado == null) {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 4),
            content: Row(
              children: [
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text('Não foi possível atualizar os dados da conta.'),
                ),
              ],
            ),
          ),
        );

        return;
      }

      // ==========================================
      // CONTA AINDA NÃO ATIVADA
      // ==========================================

      if (!usuarioAtualizado.emailVerified) {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 6),
            content: Row(
              children: [
                Icon(Icons.mark_email_unread, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Sua conta ainda não foi ativada. '
                    'Acesse o e-mail enviado para você '
                    'e clique no link para ativar sua conta.',
                  ),
                ),
              ],
            ),
          ),
        );

        return;
      }

      // ==========================================
      // CONTA ATIVADA
      // ==========================================

      debugPrint('Login autorizado. Conta ativada.');

      /*
      Não precisa usar Navigator.

      O RoteadorTelas deve detectar que:

      usuario != null
      emailVerified == true

      e abrir automaticamente a InicioScreen.
    */
    } on FirebaseAuthException catch (e) {
      timer?.cancel();

      debugPrint('FirebaseAuthException: ${e.code}');

      debugPrint('Mensagem: ${e.message}');

      String resposta = 'Algo aconteceu de errado. Tente novamente';

      switch (e.code) {
        case 'invalid-credential':
        case 'wrong-password':
        case 'user-not-found':
          resposta = 'E-mail ou senha inválidos';
          break;

        case 'invalid-email':
          resposta = 'O endereço de e-mail informado é inválido';
          break;

        case 'network-request-failed':
          resposta =
              'Erro ao conectar com a internet. '
              'Verifique sua conexão';
          break;

        case 'too-many-requests':
          resposta =
              'Muitas tentativas de login. '
              'Tente novamente mais tarde';
          break;

        case 'user-disabled':
          resposta = 'Esta conta foi desativada';
          break;
      }

      scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          content: Row(
            children: [
              const Icon(Icons.close, color: Colors.red),
              const SizedBox(width: 10),
              Expanded(child: Text(resposta)),
            ],
          ),
        ),
      );
    } catch (e, stackTrace) {
      timer?.cancel();

      debugPrint('ERRO INESPERADO NO LOGIN:');

      debugPrint(e.toString());

      debugPrint(stackTrace.toString());

      scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 4),
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Ocorreu um erro inesperado. '
                  'Tente novamente.',
                ),
              ),
            ],
          ),
        ),
      );
    } finally {
      timer?.cancel();

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
