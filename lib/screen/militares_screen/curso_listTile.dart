import 'package:flutter/material.dart';

class CursoListTile extends StatelessWidget {
  final String nomeCurso;
  const CursoListTile({super.key, required this.nomeCurso});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nomeCurso),
      trailing: Checkbox(value: false, onChanged: (value) {
        
      },),
    );
  }
}