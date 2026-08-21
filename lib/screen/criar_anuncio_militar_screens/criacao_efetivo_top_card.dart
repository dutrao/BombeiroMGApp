import 'package:flutter/material.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class CriacaoEfetivoTopCard extends StatefulWidget {
 
  const CriacaoEfetivoTopCard({super.key,});

  @override
  State<CriacaoEfetivoTopCard> createState() => _CriacaoEfetivoTopCardState();
}

class _CriacaoEfetivoTopCardState extends State<CriacaoEfetivoTopCard> {
  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final listaMilitares = storage.convertListaAnuncioMilitarParaListaMilitar(storage.listaProvisoriaAnuncioMilitar);
    return Material(
      color: Color(0xff8b1012),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(        
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(color: Color(0xff8b1012),),
          child: Container(
            height: 80,
            padding: EdgeInsets.all(10),            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.group, color: Colors.white, size: 35,),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        listaMilitares.length.toString(),                        
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),                      
                      Text('MILITARES', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text(
                        'EFETIVO TOTAL',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(storage.filtrarListaMilitaresPorCargo(listaMilitares, 'oficial').length.toString(), style: TextStyle(color: Colors.white)),
                      Text('Tenente', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(storage.filtrarListaMilitaresPorCargo(listaMilitares, 'subTen/sgt').length.toString(), style: TextStyle(color: Colors.white)),
                      Text('Sub/Sgt', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(storage.filtrarListaMilitaresPorCargo(listaMilitares, 'cb/sd').length.toString(), style: TextStyle(color: Colors.white)),
                      Text('Cb/Sd', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
