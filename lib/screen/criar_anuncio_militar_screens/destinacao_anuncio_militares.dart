import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_militar_tile.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/militares_dialog.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/numero_militares_widget.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/adicionar_viatura_buttom.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DestinacaoAnuncioMilitares extends StatefulWidget {
  final ItemAnuncioMilitares itemAnuncio;

  const DestinacaoAnuncioMilitares({super.key, required this.itemAnuncio});

  @override
  State<DestinacaoAnuncioMilitares> createState() =>
      _DestinacaoAnuncioMilitaresState();
}

class _DestinacaoAnuncioMilitaresState
    extends State<DestinacaoAnuncioMilitares> {
  

  @override
  void initState(){    
    super.initState();
      }

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();

  final listaMilitaresPorDestinacao =
      storage.listaMilitaresPreAnuncioPorDestinacao(
    widget.itemAnuncio.nome,
  );

    return ExpansionTile(
      leading: widget.itemAnuncio.icon,
      title: Row(
        children: [
          Text(
            widget.itemAnuncio.nome,
            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 30),
          NumeroMilitaresWidget(listaMilitares: listaMilitaresPorDestinacao),
        ],
      ),
      subtitle: widget.itemAnuncio.descricao != null
          ? Text(widget.itemAnuncio.descricao!)
          : null,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xfffdf2f4),
          ),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listaMilitaresPorDestinacao.length,
                itemBuilder: (context, index) {
                  return AnuncioMilitarTile(
                    militar: listaMilitaresPorDestinacao[index],
                    itemAnuncio: widget.itemAnuncio,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
              const Divider(),
              AdicionarViaturaAnuncioButtom(onTap: () => mostraDialog(context)),
            ],
          ),
        ),
      ],
    );
  }

 

  Future<void> mostraDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return MilitaresDialog(
        itemAnuncio: widget.itemAnuncio,
      );
    },
  );
}
}
