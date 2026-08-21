import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_militar_tile.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/numero_militares_widget.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemAnuncioTile extends StatelessWidget {
  final ItemAnuncioMilitares itemAnuncio;

  const ItemAnuncioTile({
    super.key,
    required this.itemAnuncio,
  });

  @override
  Widget build(BuildContext context) {
    final List<Militar> militaresPorDestinacao = [];
   // final storage = context.watch<Storage>().

    return ExpansionTile(
      leading: itemAnuncio.icon,
      title: Row(
        children: [
          Text(
            itemAnuncio.nome,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 30),
          NumeroMilitaresWidget(
            listaMilitares: militaresPorDestinacao,
          ),
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
          child: militaresPorDestinacao.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Não há militares nesta destinação.'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: militaresPorDestinacao.length,
                  itemBuilder: (context, index) {
                    return AnuncioMilitarTile(
                      itemAnuncio: itemAnuncio,
                      militar: militaresPorDestinacao[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
        ),
      ],
    );
  }
}