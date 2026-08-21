import 'package:flutter/material.dart';

class BuscarArquivoButtom extends StatefulWidget {
  final Future<void> Function() callback;
  const BuscarArquivoButtom({super.key, required this.callback});

  @override
  State<BuscarArquivoButtom> createState() => _BuscarArquivoButtomState();
}

class _BuscarArquivoButtomState extends State<BuscarArquivoButtom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
         await widget.callback();
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.folder, size: 50,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buscar Arquivo',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Selecione o arquivo relacionado à O.S',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),                    
                      ],
                    )
                  ],
                ),Icon(Icons.forward)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
