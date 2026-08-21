import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/confirm_anuncio_viatura_dialog.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/criacao_viatura_screen.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/criacao_anuncio_frota_top_card.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/destinacao_anuncio_viatura.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriacaoViaturaAnuncioScreen extends StatefulWidget {
  const CriacaoViaturaAnuncioScreen({super.key});

  @override
  State<CriacaoViaturaAnuncioScreen> createState() =>
      _CriacaoViaturaAnuncioScreenState();
}

class _CriacaoViaturaAnuncioScreenState
    extends State<CriacaoViaturaAnuncioScreen> {
  bool enviandoAnuncio = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itensAnuncio = [
      ItemAnuncioViaturas(icon: Icon(Icons.person), nome: 'Sede Operacional'),
      ItemAnuncioViaturas(icon: Icon(Icons.person), nome: 'PA Canelas'),
      ItemAnuncioViaturas(icon: Icon(Icons.person), nome: 'DSP'),
      //ItemAnuncio(icon: Icon(Icons.person), topico: 'OBSERVAÇÕES',),
    ];

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Criar Anúncio Viaturas',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CriacaoAnuncioFrotaTopCard(),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DestinacaoViaturasExpandedTile(
                          itemAnuncio: itensAnuncio[index],
                        );
                      },
                      itemCount: itensAnuncio.length,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                       await confirmarEnvioDialog(mandarAnuncio);                       
                      },
                      child: Text('Mandar Anúncio'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CriacaoViaturaScreen(),
                          ),
                        );
                      },
                      child: Text('Cadastrar Viatura'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (enviandoAnuncio) ...[
          ModalBarrier(color: Colors.black26, dismissible: false),Center(child: CircularProgressIndicator())
        ],        
      ],
    );
  }

  Future<void> mandarAnuncio() async {
     final timer = Timer(Duration(seconds: 5), () {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    'Serviço com lentidão. Verifique sua conecção com a internet',
                  ),
                ),
              ],
            ),
          ),
        );
        setState(() {
          enviandoAnuncio = false;
        });
      });
    try {
      setState(() {
        enviandoAnuncio = true;
      });
     
      await context.read<Storage>().salvarAnuncioViaturaNoDrift();
      await context
          .read<Storage>()
          .sincronizarAnuncioViaturaDiarioLocalParaNuvem();
      await context.read<Storage>().sincronizarAnuncioViaturaLocalParaNuvem();
      timer.cancel();
      setState(() {
        enviandoAnuncio = false;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: 10,),
              Expanded(child: Text('Sucesso ao enviar anúncio de frota')),
            ],
          ),
        ),
      );
    } on Exception {
      timer.cancel();
      setState(() {
        enviandoAnuncio = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.close),
              SizedBox(width: 10,),
              Expanded(child: Text('Erro ao enviar anúncio de frota')),
            ],
          ),
        ),
      );
      // TODO
    }
  }

   Future<void> confirmarEnvioDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmarEnvioAnuncioViaturaDialog(function: function),
    );
  }
}
