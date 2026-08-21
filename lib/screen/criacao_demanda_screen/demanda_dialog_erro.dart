import 'package:flutter/material.dart';

class DemandaDialogErro extends StatelessWidget {
  
  const DemandaDialogErro({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Erro ao criar demanda. Verifique os campos e sua conecção com a internet'),
      actions: [TextButton(onPressed: () {
        
      }, child: Text('Ok'))],
    );
  }
}