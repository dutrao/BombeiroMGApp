import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/screen/demanda_screen/card_item_demanda.dart';
import 'package:flutter_application_1/screen/demanda_screen/confirm_delete_demanda_dialog.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class DemandaScreen extends StatefulWidget {
  final Demanda demanda;
  const DemandaScreen({super.key, required this.demanda});

  @override
  State<DemandaScreen> createState() => _DemandaScreenState();
}

class _DemandaScreenState extends State<DemandaScreen> {
  bool deletandoOS = false;
  @override
  Widget build(BuildContext context) {
    
    String? nomeResponsavel = context.read<Storage>().pegarMilitarPorId(widget.demanda.idMilitarResponsavel)?.nomeCompleto;
    List<String> nomeDadosOS = [
      'Número',
      'Nome',
      'Data início',
      'Data fim',
      'Responsável',
    ];
    List<String> dadosOS = [
      widget.demanda.numeroDemanda,
      widget.demanda.nomeDemanda,
      widget.demanda.dataInicioDemandaFormatada,
      widget.demanda.dataFimDemandaFormatada,
      nomeResponsavel ?? '',
    ];
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Descrição Demanda')),
          body: SafeArea(
            child: SingleChildScrollView(             
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: nomeDadosOS.length,
                      itemBuilder: (context, index) => CardItemDemanda(
                        nomeItem: nomeDadosOS[index],
                        dadoOS: dadosOS[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                         await confirmarDelecaoDialog(removerOSEAtualizarDemandas);                     
                          
                        },
                        child: Text('Deletar O.S'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (deletandoOS) ...[
          ModalBarrier(color: Colors.black26, dismissible: false),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

  Future<void> removerOSEAtualizarDemandas() async {
    final timer = Timer(Duration(seconds: 8), () {
        if(!mounted)return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  'Serviço está lento. Verifique sua conexão com a internet',
                ),
              ],
            ),
          ),
        );
      });
    try {
      setState(() {
        deletandoOS = true;
      });
      
      await context.read<Storage>().deletarDemandaNoDriftLogico(
        widget.demanda.idDemanda,
      );
      await context.read<Storage>().sincronizarDemandaLocalParaNuvem();
      await context.read<Storage>().atualizarDemandas();
      timer.cancel();
      setState(() {
        deletandoOS = false;
      });
      if(!mounted)return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Sucesso a deletar a O.S'),
            ],
          ),
        ),
      );
      Navigator.pop(context);
    } on Exception {
      timer.cancel;
      setState(() {
        deletandoOS = false;
      });
      if(!mounted)return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Text('Erro ao deletar a O.S. Tente novamente'),
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
      builder: (context) => ConfirmarDeletarDemandaDialog(function: function),
    );
  }
}
