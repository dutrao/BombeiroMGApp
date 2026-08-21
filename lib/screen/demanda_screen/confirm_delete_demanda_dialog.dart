import 'package:flutter/material.dart';

class ConfirmarDeletarDemandaDialog extends StatelessWidget {
  final Future<void> Function() function;  
  const ConfirmarDeletarDemandaDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Deseja mesmo deletar essa O.S?'),
      actions: [TextButton(onPressed: () {
        function();
        Navigator.pop(context);                 
      }, child: Text('Sim')),
      TextButton(onPressed: () {
        Navigator.pop(context);        
      }, child: Text('Não'))],
    );
  }
}