import 'package:flutter/material.dart';

class ConfirmarCriacaoViaturaDialog extends StatelessWidget {
  final Future<void> Function() function;  
  const ConfirmarCriacaoViaturaDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Deseja mesmo criar essa viatura?'),
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