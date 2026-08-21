import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/adicionar_militar_anuncio_buttom.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_militar_tile.dart';

import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/numero_militares_widget.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/militares_dialog.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DestinacaoExpansionTile extends StatefulWidget {
  final ItemAnuncioMilitares itemAnuncio;

  const DestinacaoExpansionTile({super.key, required this.itemAnuncio});

  @override
  State<DestinacaoExpansionTile> createState() =>
      _DestinacaoExpansionTileState();
}

class _DestinacaoExpansionTileState extends State<DestinacaoExpansionTile> {
  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final List<Militar> listaMilitaresNaDestinacao = storage
        .listaMilitaresPreAnuncioPorDestinacao(widget.itemAnuncio.nome);
    return ExpansionTile(
      leading: widget.itemAnuncio.icon,
      title: Row(
        children: [
          Text(
            widget.itemAnuncio.nome,
            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 30),
          NumeroMilitaresWidget(listaMilitares: listaMilitaresNaDestinacao),
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
                itemCount: listaMilitaresNaDestinacao.length,
                itemBuilder: (context, index) {
                  return AnuncioMilitarTile(
                    itemAnuncio: widget.itemAnuncio,
                    militar: listaMilitaresNaDestinacao[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
              const Divider(),
              AdicionarMilitarAnuncioButtom(onTap: () => mostraDialog(context)),
            ],
          ),
        ),
      ],
    );
  }

  void mostraDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MilitaresDialog(itemAnuncio: widget.itemAnuncio);
      },
    );
  }
}
