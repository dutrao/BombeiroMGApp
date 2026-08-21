import 'package:flutter/material.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class RecuperarSenhaScreen extends StatefulWidget {
  const RecuperarSenhaScreen({super.key});

  @override
  State<RecuperarSenhaScreen> createState() => _RecuperarSenhaScreenState();
}

class _RecuperarSenhaScreenState extends State<RecuperarSenhaScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

@override
void dispose(){
  emailController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Recuperação de senha'),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ícone
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_reset_rounded,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 28),

              // Título
              Text(
                'Esqueceu sua senha?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 12),

              // Explicação
              Text(
                'Informe seu e-mail funcional. '
                'Enviaremos um link para você criar uma nova senha.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
              ),

              const SizedBox(height: 36),

              Text(
                'E-mail funcional',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [
                  AutofillHints.email,
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe seu e-mail';
                  }

                  if (!value.trim().toLowerCase().endsWith(
                        '@bombeiros.mg.gov.br',
                      )) {
                    return 'Use apenas o e-mail funcional';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'nome@bombeiros.mg.gov.br',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await enviarPedidoSenha();
                  },
                  icon: const Icon(Icons.send_outlined),
                  label: const Text(
                    'Enviar link de recuperação',
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 18,
                ),
                label: const Text('Voltar para o login'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Future<void> enviarPedidoSenha() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      await context.read<Storage>().solicitarSenhaPorEmail(
        emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Link de recuperação enviado com sucesso ao email.',
                ),
              ),
            ],
          ),
        ),
      );
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Não foi possível enviar link de recuperação via email. Tente novamente',
                ),
              ),
            ],
          ),
        ),
      );
      // TODO
    }
  }
}
