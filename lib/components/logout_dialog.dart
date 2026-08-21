import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_service/firestore_service.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:provider/provider.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreService service = FirestoreService();

    return AlertDialog(
      title: Text('Encerrar Login'),
      content: Text('Deseja mesmo encerrar o Login?'),
      actions: [ElevatedButton(onPressed: () {
        Navigator.pop(context);
      }, child: Text('Não')),
      ElevatedButton(onPressed: () {
        context.read<Repository>().deslogar();
        Navigator.pop(context);        
      }, child: Text('Sim'))

      ],
    );
  }
}
