import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/confirm_anuncio_militar_dialog.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/criacao_efetivo_top_card.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/efetivo_criar_anuncio_tile.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarAnuncioMilitarScreen extends StatefulWidget {
  const CriarAnuncioMilitarScreen({super.key});

  @override
  State<CriarAnuncioMilitarScreen> createState() => _CriarAnuncioMilitarScreenState();
}

class _CriarAnuncioMilitarScreenState extends State<CriarAnuncioMilitarScreen> {

  bool enviandoAnuncio = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await atualizarListaTodosMilitares();
    });
  }

  @override
  Widget build(BuildContext context) {
    final itensAnuncio = [
      ItemAnuncioMilitares(icon: Icon(Icons.person), nome: 'Sede Operacional'),
      ItemAnuncioMilitares(icon: Icon(Icons.person), nome: 'PA Canelas'),
      /*ItemAnuncioMilitares(
        icon: Icon(Icons.person),
        nome: 'Sobreaviso',
        
      ),
      ItemAnuncioMilitares(
        icon: Icon(Icons.person),
        nome: 'Reforço Operacional',
      ),
      //ItemAnuncio(icon: Icon(Icons.person), topico: 'FÉRIAS PRÊMIO', ),
      ItemAnuncioMilitares(
        icon: Icon(Icons.person),
        nome: 'DSP',)*/

      /* ItemAnuncio(icon: Icon(Icons.person), topico: 'DISPENSA', ),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'BANCO DE HORAS (24H)',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'BANCO DE HORAS (ATÉ 20H)',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'BANCO DE HORAS (APÓS 20H)',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'CHAVE PELG',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'CHAVE E CONTROLE DO PORTÃO DO SESC',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'LICENÇA MÉDICA',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'PERMUTA (24H)',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'PERMUTA (12H)',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'OFICIAL A DISPOSIÇÃO DO PEMAD',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'COORDENADOR 4 COB E 7º BBM',),
    ItemAnuncio(icon: Icon(Icons.person), topico: 'OBSERVAÇÕES',),*/
    ];

    return Stack(
      children: [Scaffold(
        appBar: AppBar(
          title: Text(
            'Criar Anúncio',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CriacaoEfetivoTopCard(),
              Expanded(
                child: Material(
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DestinacaoExpansionTile(
                        itemAnuncio: itensAnuncio[index],
                      );
                    },
                    itemCount: itensAnuncio.length,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                 await confirmarEnvioDialog(mandarAnuncioMilitares);
                
                },
                child: Text('Mandar Anúncio'),
              ),
            ],
          ),
        ),
      ),
    if(enviandoAnuncio)...[ModalBarrier(color: Colors.black26, dismissible: false,),Center(child: CircularProgressIndicator())]]);
  }

  Future<void> mandarAnuncioMilitares() async {
    final timer = Timer(Duration(seconds: 5), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Serviço com lentidão. Verifique a sua conexão a internet',
                  ),
                ),
              ],
            ),
          ),
        );
        if(!mounted)return;
        setState(() {
          enviandoAnuncio = false;
        });
      });
    try {
      setState(() {
        enviandoAnuncio = true;
      });
      
      await adicionarAnuncioMilitarDiarioAoDrift();
      await context.read<Storage>().adicionarListaAnuncioMilitar();
      await sincronizarAnuncioMilitarDiarioLocalParaNuvem();
      await sincronizarAnuncioMilitarLocalParaNuvem();
      await context.read<Storage>().debugarTabelaAnuncioMilitar();
      timer.cancel();
      if(!mounted)return;
      setState(() {
        enviandoAnuncio = false;
      });
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Anuncio enviado com sucesso',
                  ),
                ),
              ],
            ),
          ),
        );
    } on Exception {
      timer.cancel();
      if(!mounted)return;
        setState(() {
          enviandoAnuncio = false;
        });
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Erro ao enviar anúncio. Verifique novamente',
                  ),
                ),
              ],
            ),
          ),
        );      
      // TODO
    }
  }

  Future<void> atualizarListaTodosMilitares() async {
    await context.read<Storage>().atualizarListaTodosMilitares();
  }

  Future<void> sincronizarAnuncioMilitarDiarioLocalParaNuvem() async {
    await context
        .read<Storage>()
        .sincronizarAnuncioMilitarDiarioLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioMilitarLocalParaNuvem() async {
    await context.read<Storage>().sincronizarAnuncioMilitarLocalParaNuvem();
  }

  Future<void> adicionarAnuncioMilitarDiarioAoDrift() async {
    final storage = context.read<Storage>();
    final responsavel = await storage.pegarDadosUsuario();
    await storage.adicionarAnuncioMilitarDiarioAoDrift(responsavel!.idMilitar);
  }

   Future<void> confirmarEnvioDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmarEnvioAnuncioMilitarDialog(function: function),
    );
  }
}
