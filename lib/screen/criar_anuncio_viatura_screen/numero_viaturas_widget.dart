import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';

class NumeroViaturasWidget extends StatelessWidget {

  final List<Viatura> listaViatura;
  const NumeroViaturasWidget({super.key, required this.listaViatura});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xff8d1917) ,                
        shape: BoxShape.circle,
      ),
      child: Text(listaViatura.length.toString(), style: TextStyle(color: Colors.white, fontSize: 11),),
    );
  }
}