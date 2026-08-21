import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/constants/constants.dart';

class CadastroUsuarioScreen extends StatefulWidget {
  const CadastroUsuarioScreen({super.key});

  @override
  State<CadastroUsuarioScreen> createState() => _CadastroUsuarioScreenState();
}

class _CadastroUsuarioScreenState extends State<CadastroUsuarioScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();
  bool obscureTextConfirmaSenhaController = true;
  bool obscureTextSenhaController = true;
  final _formKey = GlobalKey<FormState>();
  bool cadastrando = false;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    confirmacaoSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff9e0f20), Color(0xffe35033)],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Image.asset(
                      'assets/brasao.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Cadastro',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Preencha os dados abaixo para criar sua conta',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Text('Email', style: TextStyle(fontSize: 18)),
                        TextFormField(
                          key: ValueKey(Constants.cadastroEmailTextFormField),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Obrigatório';
                            }

                            if (!value.endsWith('@bombeiros.mg.gov.br')) {
                              return 'Email inválido. Use o email funcional';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hint: Text('Digite seu email'),
                          ),
                          controller: emailController,
                        ),
                        SizedBox(height: 20),
                        Text('Senha', style: TextStyle(fontSize: 18)),
                        TextFormField(
                          obscureText: obscureTextSenhaController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureTextSenhaController =
                                      !obscureTextSenhaController;
                                });
                              },
                              icon: obscureTextSenhaController == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            hint: Text('Digite sua senha'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          key: ValueKey(Constants.cadastroSenhaTextFormField),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Obrigatório';
                            }
                            if (confirmacaoSenhaController.text !=
                                senhaController.text) {
                              return 'Senhas estão diferentes';
                            }
                            return null;
                          },
                          controller: senhaController,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Confirme a senha',
                          style: TextStyle(fontSize: 18),
                        ),
                        TextFormField(
                          obscureText: obscureTextConfirmaSenhaController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureTextConfirmaSenhaController =
                                      !obscureTextConfirmaSenhaController;
                                });
                              },
                              icon: obscureTextConfirmaSenhaController == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            hint: Text('Confirme sua senha'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          key: ValueKey(Constants.cadastroConfirmTextFormField),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Obrigatório';
                            }
                            if (senhaController.text !=
                                confirmacaoSenhaController.text) {
                              return 'Senhas estão diferentes';
                            }
                            return null;
                          },
                          controller: confirmacaoSenhaController,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool validacao = _formKey.currentState!
                                    .validate();
                                if (validacao) {
                                  try {
                                    setState(() {
                                      cadastrando = true;
                                    });
                                    await context
                                        .read<Repository>()
                                        .cadastrarUsuario(
                                          emailController.text,
                                          senhaController.text,
                                        );
                                    if (!mounted) return;
                                    setState(() {
                                      cadastrando = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 4),
                                        content: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                'Cadastro realizado com sucesso. Faça confirmação do cadastro no link do email fornecido para realizar o acesso.',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } on Exception catch (e) {
                                    setState(() {
                                      cadastrando = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 4),
                                        content: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                'Erro ao tentar criar sua conta: $e',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                    // TODO
                                  }
                                }
                              },
                              child: Text('Cadastrar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (cadastrando) ...[
          ModalBarrier(dismissible: false, color: Colors.black26),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }
}
