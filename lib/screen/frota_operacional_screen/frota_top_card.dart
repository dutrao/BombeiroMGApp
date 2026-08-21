import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class FrotaTopCard extends StatelessWidget {  
  final List<DestinacaoViatura> listaDestinacaoViatura;
  const FrotaTopCard({super.key, required this.listaDestinacaoViatura,});

  @override
  Widget build(BuildContext context) {

    final storage = context.watch<Storage>();
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
                        '${listaDestinacaoViatura.length}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text('FROTA', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text(
                        'TOTAL',
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
                      Text(storage.pegarListaDestinacaoViaturaPorTipoViatura('UR', listaDestinacaoViatura).length.toString(), style: TextStyle(color: Colors.white)),
                      Text('UR', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(storage.pegarListaDestinacaoViaturaPorTipoViatura('ABTS', listaDestinacaoViatura).length.toString(), style: TextStyle(color: Colors.white)),
                      Text('ABTS', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(storage.pegarListaDestinacaoViaturaPorTipoViatura('ASL', listaDestinacaoViatura).length.toString(), style: TextStyle(color: Colors.white)),
                      Text('ASL', style: TextStyle(color: Colors.white)),
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
