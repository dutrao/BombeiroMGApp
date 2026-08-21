import 'package:flutter/material.dart';

class ConfirmarEnvioDialog extends StatelessWidget {
  final Future<void> Function() function;  
  const ConfirmarEnvioDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Deseja mesmo enviar essa O.S?'),
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