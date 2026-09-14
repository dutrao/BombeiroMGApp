import 'package:flutter/material.dart';

class VerificacaoDadosPerfilDialog extends StatelessWidget {
  const VerificacaoDadosPerfilDialog({super.key});

  @override
  Widget build(BuildContext context) {   

    return AlertDialog(
      title: Text('Acesso negado'),
      content: Text('Para acessar essa área, é necessário atualizar os dados do perfil'),
      actions: [ElevatedButton(onPressed: () {
        Navigator.pop(context);
      }, child: Text('Ok')),      
      ],
    );
  }
}
