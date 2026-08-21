import 'package:flutter/material.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class CriacaoAnuncioFrotaTopCard extends StatefulWidget {
  const CriacaoAnuncioFrotaTopCard({super.key});

  @override
  State<CriacaoAnuncioFrotaTopCard> createState() =>
      _CriacaoAnuncioFrotaTopCardState();
}

class _CriacaoAnuncioFrotaTopCardState
    extends State<CriacaoAnuncioFrotaTopCard> {
  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final listaViaturas = storage.listaPreAnuncioDestinacaoViatura;
    return Material(
      color: Color(0xff8b1012),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(color: Color(0xff8b1012)),
          child: Container(
            height: 80,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.group, color: Colors.white, size: 35),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${listaViaturas.length}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'FROTA',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
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
                      Text(
                        storage
                            .pegarListaDestinacaoViaturaPorTipoViatura(
                              'UR',
                              listaViaturas,
                            )
                            .length
                            .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('UR', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        storage
                            .pegarListaDestinacaoViaturaPorTipoViatura(
                              'ABTS',
                              listaViaturas,
                            )
                            .length
                            .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('ABTS', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                VerticalDivider(thickness: 2, color: Colors.white, width: 10),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        storage
                            .pegarListaDestinacaoViaturaPorTipoViatura(
                              'ASL',
                              listaViaturas,
                            )
                            .length
                            .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
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
