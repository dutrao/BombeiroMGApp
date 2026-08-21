import 'package:flutter/material.dart';

class DemandasButtom extends StatelessWidget {
  final String texto;
  const DemandasButtom({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Ink(
          child: Row(
            children: [Icon(Icons.date_range),
            SizedBox(width: 10,),
            Text(texto)],
          ),
        ),
      ),
    );
  }
}