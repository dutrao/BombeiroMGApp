import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/model_detalhes_militar_tile.dart';
import 'package:flutter_application_1/screen/detalhes_viatura_screen/confirm_deletar_viatura_dialog.dart';
import 'package:flutter_application_1/screen/detalhes_viatura_screen/lista_detalhes_viatura.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class DetalhesViaturaScreen extends StatefulWidget {
  final Viatura viatura;
  const DetalhesViaturaScreen({super.key, required this.viatura});

  @override
  State<DetalhesViaturaScreen> createState() => _DetalhesViaturaScreenState();
}

Map<String, List<ModelDetalhesMilitarTile>> dadosMilitar = {
  'dadosPessoais': [
    ModelDetalhesMilitarTile(
      iconData: Icons.factory_outlined,
      nomeDado: 'Marca',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.directions_car_outlined,
      nomeDado: 'Modelo',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.calendar_month_outlined,
      nomeDado: 'Ano',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.local_gas_station_outlined,
      nomeDado: 'Combustível',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.sell_outlined,
      nomeDado: 'Categoria',
    ),
    ModelDetalhesMilitarTile(iconData: Icons.pin, nomeDado: 'Placa'),
  ],
};

class _DetalhesViaturaScreenState extends State<DetalhesViaturaScreen> {
  bool deletandoViatura = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Dados da viatura')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          escolherImagem(widget.viatura.tipoViatura),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Prefixo',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      2,
                                      0,
                                      4,
                                    ),
                                    child: Text(
                                      '${widget.viatura.tipoViatura}-${widget.viatura.prefixo}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                  ListaDetalhesViatura(
                    viatura: widget.viatura,
                    nomeLista: 'Dados Gerais',
                    listaInformacoesTile: dadosMilitar['dadosPessoais']!,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await confirmarDelecaoDialog(
                        deletarViaturaESincronizarLocalParaNuvem,
                      );
                      Navigator.pop(context);
                    },
                    child: Text('Deletar viatura'),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (deletandoViatura) ...[
          ModalBarrier(dismissible: false, color: Colors.black26),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

  Image escolherImagem(String tipoViatura) {
    switch (tipoViatura) {
      case 'ASL':
        return Image.asset('assets/ASL.png', height: 100, width: 100);

      case 'UR':
        return Image.asset('assets/UR.png', height: 100, width: 100);

      case 'ABTS':
        return Image.asset('assets/ABTS.png', height: 100, width: 100);

      case 'APF':
        return Image.asset('assets/APF.png', height: 100, width: 100);

      case 'TC':
        return Image.asset('assets/TC.png', height: 100, width: 100);

      case 'K9':
        return Image.asset('assets/K9.png', height: 100, width: 100);

      case 'ASM':
        return Image.asset('assets/ASM.png', height: 100, width: 100);

      default:
        return Image.asset('assets/APF.png', height: 100, width: 100);
    }
  }

  Future<void> deletarViaturaESincronizarLocalParaNuvem() async {
    final timer = Timer(Duration(seconds: 5), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  'Serviço com lentidão. Verifique a conexão com a internet',
                ),
              ],
            ),
          ),
        );
      });
    try {
      setState(() {
        deletandoViatura = true;
      }); 
      
      await context.read<Storage>().deletarViaturaNoDriftLogico(
        widget.viatura.idViatura,
      );
      await context.read<Storage>().sincronizarViaturaLocalParaNuvem();
      await context.read<Storage>().atualizarListaTotalViaturas();
      timer.cancel();
      setState(() {
        deletandoViatura = false;
      }); 
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Deleção realizada com sucesso',
                ),
              ],
            ),
          ),
        );
    } on Exception {
      timer.cancel();
      setState(() {
        deletandoViatura = false;
      });      
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Erro ao realizar a deleção. Tente novamente',
                ),
              ],
            ),
          ),
        );
      // TODO
    }
  }

  Future<void> confirmarDelecaoDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmarDeletarViaturaDialog(function: function),
    );
  }
}
