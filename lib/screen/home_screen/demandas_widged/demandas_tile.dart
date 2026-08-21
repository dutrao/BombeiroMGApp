import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/screen/demanda_screen/demanda_screen.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DemandasTile extends StatefulWidget {
  final Demanda demanda;
  const DemandasTile({super.key, required this.demanda});

  @override
  State<DemandasTile> createState() => _DemandasTileState();
}

class _DemandasTileState extends State<DemandasTile> {
  String converterData(DateTime dataHora) {
    final String data = '${dataHora.day}-${dataHora.month}-${dataHora.year}';
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DemandaScreen(demanda: widget.demanda),)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: Expanded(
                  child: Text(
                    'Nº ${widget.demanda.numeroDemanda} - ${widget.demanda.nomeDemanda}',
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                          'Inicio: ${converterData(widget.demanda.dataInicioDemanda)}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text(
                          'Fim: ${converterData(widget.demanda.dataFimDemanda)}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () async {
                    try {
                      final url = widget.demanda.urlDemanda;
      
                      if (url.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('URL do documento vazia')),
                        );
                        return;
                      }
      
                      await Permission.notification.request();
      
                      final Directory? pastaBase =
                          await getExternalStorageDirectory();
      
                      if (pastaBase == null) {
                        throw Exception(
                          'Não foi possível acessar o armazenamento.',
                        );
                      }
      
                      final String nomeArquivo =
                          limparNomeArquivo(widget.demanda.nomeDemanda);
      
                      final taskId = await FlutterDownloader.enqueue(
                        url: url,
                        savedDir: pastaBase.path,
                        fileName: nomeArquivo,
                        showNotification: true,
                        openFileFromNotification: true,
                        saveInPublicStorage: true,
                      );
      
                      print('Download iniciado: $taskId');
                      print('Pasta base: ${pastaBase.path}');
                      print('Arquivo: $nomeArquivo');
      
                      if (!mounted) return;
      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Download iniciado')),
                      );
                    } catch (e) {
                      print('Erro ao iniciar download: $e');
      
                      if (!mounted) return;
      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro ao iniciar download: $e')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String limparNomeArquivo(String nome) {
    return nome.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_').trim();
  }
}
