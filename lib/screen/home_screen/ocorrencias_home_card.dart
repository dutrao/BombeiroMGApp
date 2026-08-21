import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:flutter_application_1/screen/ocorrencias_screen/ocorrencias_screen.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class OcorrenciasHomeCard extends StatefulWidget {
  const OcorrenciasHomeCard({super.key});

  @override
  State<OcorrenciasHomeCard> createState() => _OcorrenciasHomeCardState();
}

class _OcorrenciasHomeCardState extends State<OcorrenciasHomeCard> {
  List<Ocorrencia> listaOcorrenciasDeAnuncioMaisRecente = [];

  @override
  Widget build(BuildContext context) {
    listaOcorrenciasDeAnuncioMaisRecente = context
        .watch<Storage>()
        .listaOcorrenciasDeAnuncioMaisRecente;
    return Material(
      color: Color(0xff8b1012),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OcorrenciasScreen()),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(color: Color(0xff8b1012)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.fire_truck, color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Relatório Ocorrências',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ],
                ),
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,                    
                      children: [
                        SizedBox(
                          child: Column(                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                listaOcorrenciasDeAnuncioMaisRecente.length
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Ocorrências',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'TOTAL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colors.white,
                          width: 0,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context
                                    .read<Storage>()
                                    .pegarListaOcorrenciasPorTipo(
                                      listaOcorrenciasDeAnuncioMaisRecente,
                                      'APH',
                                    )
                                    .length
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text('APH', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colors.white,
                          width: 0,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context
                                    .read<Storage>()
                                    .pegarListaOcorrenciasPorTipo(
                                      listaOcorrenciasDeAnuncioMaisRecente,
                                      'Salvamento',
                                    )
                                    .length
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Salvamento',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colors.white,
                          width: 0,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context
                                    .read<Storage>()
                                    .pegarListaOcorrenciasPorTipo(
                                      listaOcorrenciasDeAnuncioMaisRecente,
                                      'Socorro',
                                    )
                                    .length
                                    .toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Socorro',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
