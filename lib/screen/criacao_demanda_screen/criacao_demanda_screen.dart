import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/screen/criacao_demanda_screen/arquivo_selecionado_widget.dart';
import 'package:flutter_application_1/screen/criacao_demanda_screen/buscar_arquivo_buttom.dart';
import 'package:flutter_application_1/screen/criacao_demanda_screen/confirmar_envio_dialog.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CriacaoDemandaScreen extends StatefulWidget {
  const CriacaoDemandaScreen({super.key});

  @override
  State<CriacaoDemandaScreen> createState() => _CriacaoDemandaScreenState();
}

class _CriacaoDemandaScreenState extends State<CriacaoDemandaScreen> {
  TextEditingController numeroOSController = TextEditingController();
  TextEditingController nomeOSController = TextEditingController();
  TextEditingController dataInicioController = TextEditingController();
  TextEditingController dataFimController = TextEditingController();

  String idMilitarResponsavel = '';
  String idDemanda = '';
  String? urlDemanda;
  String nomeArquivo = '';

  bool carregandoDocumento = false;
  bool lancandoOS = false;

  Uint8List? bytesDocumento;

  DateTime? dataInicioDemanda;
  DateTime? dataFimDemanda;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idMilitarResponsavel = pegarUuidMilitarResponsavel();
  }

  @override
  void dispose() {
    numeroOSController.dispose();
    nomeOSController.dispose();
    dataInicioController.dispose();
    dataFimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lançamento de O.S')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.numbers, size: 40),
                            SizedBox(width: 15),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Número da O.S',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hint: Text('Digite o número da O.S'),
                                    ),
                                    controller: numeroOSController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.text_fields_outlined, size: 40),
                            SizedBox(width: 15),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Nome da O.S',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hint: Text('Digite o nome da O.S'),
                                    ),
                                    controller: nomeOSController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month, size: 40),
                            SizedBox(width: 15),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Data de início',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hint: Text('Selecione a data de início'),
                                    ),
                                    controller: dataInicioController,
                                    readOnly: true,
                                    onTap: () async {
                                      final DateTime? data =
                                          await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                          );

                                      if (data != null) {
                                        dataInicioDemanda = data;
                                        dataInicioController.text =
                                            formatarData(data);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month, size: 40),
                            SizedBox(width: 15),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Data de fim',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hint: Text('Selecione a data de fim'),
                                    ),
                                    controller: dataFimController,
                                    readOnly: true,
                                    onTap: () async {
                                      final DateTime? data =
                                          await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                          );

                                      if (data != null) {
                                        dataFimDemanda = data;
                                        dataFimController.text = formatarData(
                                          data,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    BuscarArquivoButtom(callback: pegarArquivo),
                    SizedBox(height: 10),
                    if (bytesDocumento != null) ...[
                      const SizedBox(height: 10),
                      ArquivoSelecionadoWidget(nomeArquivo: nomeArquivo),
                    ],
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          await confirmarEnvioDialog(lancarOS);
                        },
                        child: Text('Lançar O.S'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (carregandoDocumento || lancandoOS) ...[
            const ModalBarrier(dismissible: false, color: Colors.black26),
            const Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  Future<void> lancarOS() async {
    if (numeroOSController.text.trim().isEmpty ||
        nomeOSController.text.trim().isEmpty ||
        idMilitarResponsavel.isEmpty ||
        dataInicioDemanda == null ||
        dataFimDemanda == null ||
        bytesDocumento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text('Preencha todos os campos e selecione o arquivo.'),
              ),
            ],
          ),
        ),
      );

      return;
    }

    if (dataFimDemanda!.isBefore(dataInicioDemanda!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'A data final não pode ser anterior à data de início.',
                ),
              ),
            ],
          ),
        ),
      );

      return;
    }

    setState(() {
      lancandoOS = true;
    });

    Timer? timer;

    try {
      timer = Timer(const Duration(seconds: 10), () {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Serviço com lentidão. Verifique sua conexão com a internet.',
                  ),
                ),
              ],
            ),
          ),
        );
      });

      // 1. Cria ID da demanda somente agora
      idDemanda = const Uuid().v4();

      // 2. Upload para Firebase Storage
      await uploadDocumento(bytesDocumento!, idDemanda);

      // 3. Só depois do upload pega a URL
      urlDemanda = await pegarUrlDemanda(idDemanda);

      if (urlDemanda == null) {
        throw Exception('Não foi possível obter a URL do documento.');
      }

      // 4. Agora cria a demanda
      final demanda = Demanda(
        idDemanda: idDemanda,
        idMilitarResponsavel: idMilitarResponsavel,
        numeroDemanda: numeroOSController.text.trim(),
        nomeDemanda: nomeOSController.text.trim(),
        dataInicioDemanda: dataInicioDemanda!,
        dataFimDemanda: dataFimDemanda!,
        urlDemanda: urlDemanda!,
      );

      // 5. Salva local
      await adicionarDemandaLocal(demanda);

      // 6. Sincroniza com Firestore
      await context.read<Storage>().sincronizarDemandaLocalParaNuvem();

      // Terminou tudo
      timer.cancel();

      if (!mounted) return;

      setState(() {
        lancandoOS = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Sucesso ao enviar O.S'),
            ],
          ),
        ),
      );
    } on Exception catch (e) {
      timer?.cancel();

      if (!mounted) return;

      setState(() {
        lancandoOS = false;
      });

      debugPrint('Erro ao lançar OS: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Text('Erro ao enviar O.S. Tente novamente'),
            ],
          ),
        ),
      );
      
    }
  }

  Future<void> pegarArquivo() async {
    try {
      setState(() {
        carregandoDocumento = true;
      });

      final FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result == null) {
        return;
      }

      final arquivoSelecionado = result.files.single;
      final String? path = arquivoSelecionado.path;

      if (path == null) {
        return;
      }

      final File file = File(path);

      final Uint8List bytes = await file.readAsBytes();

      if (!mounted) return;

      setState(() {
        bytesDocumento = bytes;
        nomeArquivo = arquivoSelecionado.name;
      });
    } on Exception catch (e) {
      debugPrint('Erro ao selecionar arquivo: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Expanded(child: Text('Erro ao carregar o arquivo.')),
            ],
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          carregandoDocumento = false;
        });
      }
    }
  }

  String formatarData(DateTime data) {
    return '${data.day}/${data.month}/${data.year}';
  }

  String pegarUuidMilitarResponsavel() {
    return context.read<Storage>().pegarUUIDUsuario();
  }

  Future<void> uploadDocumento(Uint8List bytes, String idDemanda) async {
    await context.read<Storage>().uploadDocumentoDemanda(bytes, idDemanda);
  }

  Future<String?> pegarUrlDemanda(String idDemanda) async {
    return await context.read<Storage>().pegarUrlPorIdDemanda(idDemanda);
  }

  Future<void> adicionarDemandaLocal(Demanda demanda) async {
    await context.read<Storage>().adicionarOuAtualizarDemandaAoDrift(demanda);
  }

  Future<void> confirmarEnvioDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmarEnvioDialog(function: function),
    );
  }
}
