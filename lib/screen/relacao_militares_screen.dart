import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/card_militar.dart';
import 'package:flutter_application_1/model/militar.dart';

class RelacaoMilitaresScreen extends StatelessWidget {
  final List<Militar> listaMilitares;
  const RelacaoMilitaresScreen({super.key, required this.listaMilitares});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Relação Militares'),),
      body: SafeArea(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return CardMilitar(militar: listaMilitares[index]);
        }, itemCount: listaMilitares.length),
      ) 
      ),
    );
  }
}