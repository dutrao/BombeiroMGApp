import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class DialogMilitarTile extends StatefulWidget {
  final Militar militar;
  final ItemAnuncioMilitares itemAnuncio;
  const DialogMilitarTile({
    super.key,
    required this.militar,
    required this.itemAnuncio,
  });

  @override
  State<DialogMilitarTile> createState() => _DialogMilitarTileState();
}

class _DialogMilitarTileState extends State<DialogMilitarTile> {
  bool checkboxState = false;
  @override
  Widget build(BuildContext context) {
    final storage = context.read<Storage>();
    return Material(
      child: InkWell(
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Checkbox(
                  value: checkboxState,
                  onChanged: (value) {
                    if (value == null) return;

                    final storage = context.read<Storage>();

                    final militarConvertido = storage
                        .converterMilitarEmAnuncioMilitar(
                          widget.militar,
                          widget.itemAnuncio.nome,
                        );

                    if (value) {
                      if (storage.verificarMilitarEmDuasDestinacoes(
                        militarConvertido,
                      )) {
                        mostraDialogMilitarEmOutraDestinacao();

                        setState(() {
                          checkboxState = false;
                        });

                        return;
                      }

                      storage.adicionarAnuncioMilitarPreAnuncio(
                        militarConvertido,
                      );
                    } else {
                      storage.removerAnuncioMilitarPreAnuncio(
                        militarConvertido,
                      );
                    }

                    setState(() {
                      checkboxState = value;
                    });
                  },
                  shape: CircleBorder(),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff6d6da),
                  ),
                  child: Text(
                    widget.militar.cargo,
                    style: TextStyle(
                      color: Color(0xffd45e60),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
        ),
      ),
    );
  }

  //Abrir Dialog informando que militar já está em outra destinação

  void mostraDialogMilitarEmOutraDestinacao() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Este militar já foi adicionado em outra destinação'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
