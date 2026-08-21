import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/destinacao_militar.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class AnuncioMilitarTile extends StatefulWidget {
  final Militar militar;
  final ItemAnuncioMilitares itemAnuncio;
  const AnuncioMilitarTile({
    super.key,
    required this.militar,
    required this.itemAnuncio,
  });

  @override
  State<AnuncioMilitarTile> createState() => _AnuncioMilitarTileState();
}

class _AnuncioMilitarTileState extends State<AnuncioMilitarTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.person),

                const SizedBox(width: 12),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfff6d6da),
                  ),
                  child: Text(
                    widget.militar.cargo,
                    style: const TextStyle(
                      color: Color(0xffd45e60),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    widget.militar.nomeCompleto,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              removerDestinacaoViaturaPreAnuncio();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void removerDestinacaoViaturaPreAnuncio() {
    context.read<Storage>().removerDestinacaoMilitarPreAnuncio(
      DestinacaoMilitar(
        militar: widget.militar,
        destinacaoMilitar: widget.itemAnuncio.nome,
      ),
    );
  }
}
