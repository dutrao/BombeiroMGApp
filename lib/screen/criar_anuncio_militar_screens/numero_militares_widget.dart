import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';

class NumeroMilitaresWidget extends StatelessWidget {

  final List<Militar> listaMilitares;
  const NumeroMilitaresWidget({super.key, required this.listaMilitares});

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
      child: Text(listaMilitares.length.toString(), style: TextStyle(color: Colors.white, fontSize: 11),),
    );
  }
}