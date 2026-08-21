import 'package:flutter/material.dart';

class ConfirmarEnvioAnuncioMilitarDialog extends StatelessWidget {
  final Future<void> Function() function;  
  const ConfirmarEnvioAnuncioMilitarDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Deseja mesmo enviar esse anúncio?'),
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