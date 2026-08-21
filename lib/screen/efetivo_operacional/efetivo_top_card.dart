import 'package:flutter/material.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class EfetivoTopCard extends StatelessWidget {
  const EfetivoTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();

    final listaMilitares = storage.convertListaAnuncioMilitarParaListaMilitar(
      storage.listaCompletaAnuncio,
    );
    return Material(
      color: Color(0xff8b1012),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(        
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(color: Color(0xff8b1012)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.group, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Anúncio efetivo Sede/Canelas',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [                   
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              context
                                  .watch<Storage>()
                                  .listaCompletaAnuncio
                                  .length
                                  .toString(),
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              'MILITARES',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              'EFETIVO TOTAL',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        color: Colors.white,
                        width: 10,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storage
                                  .filtrarListaMilitaresPorCargo(
                                    listaMilitares,
                                    'oficial',
                                  )
                                  .length
                                  .toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Tenente',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        color: Colors.white,
                        width: 10,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storage
                                  .filtrarListaMilitaresPorCargo(
                                    listaMilitares,
                                    'subTen/sgt',
                                  )
                                  .length
                                  .toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Sub/Sgt',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        color: Colors.white,
                        width: 10,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              storage
                                  .filtrarListaMilitaresPorCargo(
                                    listaMilitares,
                                    'cb/sd',
                                  )
                                  .length
                                  .toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('Cb/Sd', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
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
