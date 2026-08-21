import 'package:flutter/material.dart';

class DemandaDialogSucesso extends StatelessWidget {
  
  const DemandaDialogSucesso({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Sucesso ao criar demanda. Deseja criar nova demanda?'),
      actions: [TextButton(onPressed: () {
        Navigator.pop(context);        
      }, child: Text('Sim')), TextButton(onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);        
      }, child: Text('Não'))],
    );
  }
}