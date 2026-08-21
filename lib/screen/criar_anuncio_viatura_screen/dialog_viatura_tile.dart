import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';
import '../../model/viatura.dart';

class DialogViaturaTile extends StatefulWidget {
  final Viatura viatura;
  final ItemAnuncioViaturas itemAnuncio;
  const DialogViaturaTile({
    super.key,
    required this.viatura,
    required this.itemAnuncio,
  });

  @override
  State<DialogViaturaTile> createState() => _DialogViaturaTileState();
}

class _DialogViaturaTileState extends State<DialogViaturaTile> {
  bool checkboxState = false;
  @override
  Widget build(BuildContext context) {
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
                    if (value == true) {
                      context
                          .read<Storage>()
                          .adicionarDestinacaoViaturaPreAnuncio(
                            DestinacaoViatura(
                              viatura: widget.viatura,
                              destinacaoViatura: widget.itemAnuncio.nome,
                            ),
                          );
                    } else {
                      context
                          .read<Storage>()
                          .removerDestinacaoViaturaPreAnuncio(
                            DestinacaoViatura(
                              viatura: widget.viatura,
                              destinacaoViatura: widget.itemAnuncio.nome,
                            ),
                          );
                    }
                    setState(() {
                      checkboxState = value!;
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
                    widget.viatura.tipoViatura,
                    style: TextStyle(
                      color: Color(0xffd45e60),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.viatura.prefixo,
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
}
