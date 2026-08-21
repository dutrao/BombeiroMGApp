import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  final IconData icone;
  final String cardName;
  final Widget tela;
  const HomeCards({super.key, required this.cardName, required this.icone, required this.tela});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => tela,));
        },        
        child: Ink(         
          width: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Icon(icone, size: 30,),
            Text(cardName, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),textAlign: TextAlign.center,)
          ]
          ),
        ),
      ),
    );
  }
}