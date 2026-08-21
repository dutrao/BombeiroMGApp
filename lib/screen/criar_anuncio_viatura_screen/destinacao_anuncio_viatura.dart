import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/adicionar_viatura_buttom.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/anuncio_viatura_tile.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/numero_viaturas_widget.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/viatura_dialog.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DestinacaoViaturasExpandedTile extends StatelessWidget {
  final ItemAnuncioViaturas itemAnuncio;

  const DestinacaoViaturasExpandedTile({super.key, required this.itemAnuncio});

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final listaViaturasPorDestinacao = storage.converterListaDestinacaoViaturaEmListaViatura(
      storage.listaPreAnuncioDestinacaoViatura,
      itemAnuncio,
    );
    return ExpansionTile(
      leading: itemAnuncio.icon,
      title: Row(
        children: [
          Text(
            itemAnuncio.nome,
            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 30),
          NumeroViaturasWidget(listaViatura: listaViaturasPorDestinacao),
        ],
      ),
      subtitle: itemAnuncio.descricao != null
          ? Text(itemAnuncio.descricao!)
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
                itemCount: listaViaturasPorDestinacao.length,
                itemBuilder: (context, index) {
                  return DestinacaoViaturaTile(
                    viatura: listaViaturasPorDestinacao[index],
                    itemAnuncio: itemAnuncio,
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

  void mostraDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ViaturaDialog(itemAnuncio: itemAnuncio);
      },
    );
  }
}
