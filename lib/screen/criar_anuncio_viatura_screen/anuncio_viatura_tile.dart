import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class DestinacaoViaturaTile extends StatefulWidget {
  final Viatura viatura;
  final ItemAnuncioViaturas itemAnuncio;
  const DestinacaoViaturaTile({
    super.key,
    required this.viatura,
    required this.itemAnuncio,
  });

  @override
  State<DestinacaoViaturaTile> createState() => _DestinacaoViaturaTileState();
}

class _DestinacaoViaturaTileState extends State<DestinacaoViaturaTile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Storage>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 20),
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
                SizedBox(width: 20),
                Text(widget.viatura.prefixo),
              ],
            ),
          ),
          IconButton(
            onPressed: () {  
              removerDestinacaoViaturaPreAnuncio();            
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void removerDestinacaoViaturaPreAnuncio(){
    context.read<Storage>().removerDestinacaoViaturaPreAnuncio(DestinacaoViatura(viatura: widget.viatura, destinacaoViatura: widget.itemAnuncio.nome));
  }
}
