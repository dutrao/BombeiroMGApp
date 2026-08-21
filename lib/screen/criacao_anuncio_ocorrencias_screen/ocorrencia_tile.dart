import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class OcorrenciaTile extends StatefulWidget {
  final Ocorrencia ocorrencia;
  const OcorrenciaTile({super.key, required this.ocorrencia});

  @override
  State<OcorrenciaTile> createState() => _OcorrenciaTileState();
}

class _OcorrenciaTileState extends State<OcorrenciaTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              '${widget.ocorrencia.codigo}-${widget.ocorrencia.nomeOcorrencia}',
              style: TextStyle(fontSize: 12),
              maxLines: 3,
            ),
          ),
          IconButton(constraints: const BoxConstraints(),padding: EdgeInsets.zero,onPressed: () {
            context.read<Storage>().removerOcorrenciaPreAnuncio(widget.ocorrencia);
          }, icon: Icon(Icons.delete, color: Colors.red,size: 25,))
        ],
      ),
    );
  }
}
