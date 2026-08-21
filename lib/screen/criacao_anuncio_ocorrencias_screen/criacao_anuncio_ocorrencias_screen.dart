import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:flutter_application_1/screen/criacao_anuncio_ocorrencias_screen/confirm_anuncio_ocorrencias_dialog.dart';
import 'package:flutter_application_1/screen/criacao_anuncio_ocorrencias_screen/ocorrencia_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class CriacaoAnuncioOcorrenciasScreen extends StatefulWidget {
  const CriacaoAnuncioOcorrenciasScreen({super.key});

  @override
  State<CriacaoAnuncioOcorrenciasScreen> createState() =>
      _CriacaoAnuncioOcorrenciasScreenState();
}

class _CriacaoAnuncioOcorrenciasScreenState
    extends State<CriacaoAnuncioOcorrenciasScreen> {
  TextEditingController codigoController = TextEditingController();
  final FocusNode codigoFocusNode = FocusNode();

  bool enviandoAnuncio = false;

  @override
  void initState() {
    super.initState();
    sincronizarEPegarListaOcorrencia();
  }

  @override
  void dispose() {
    codigoController.dispose();
    codigoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Ocorrencia> listaOcorrencia = context
        .watch<Storage>()
        .listaTipoDeOcorrencia;
    List<Ocorrencia> listaPreAnuncioOcorrencia = context
        .watch<Storage>()
        .listaPreAnuncioOcorrencia;
    print(listaOcorrencia.length);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFFF5F6FA),
          appBar: AppBar(title: Text('Anúncio Ocorrências')),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,16),
                              child: Text('Adicione as ocorrências', style: TextStyle(fontSize: 20),),
                            ),
                            Autocomplete<Ocorrencia>(
                              textEditingController: codigoController,
                              focusNode: codigoFocusNode,

                              displayStringForOption: (ocorrencia) {
                                return ocorrencia.codigo;
                              },

                              fieldViewBuilder:
                                  (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onFieldSubmitted,
                                  ) {
                                    return TextFormField(
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        labelText: 'Código',
                                        hintText: 'Ex.: O 01.001',
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Color(0xff8b1012),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0xff8b1012),
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text.isEmpty) {
                                  return const Iterable<Ocorrencia>.empty();
                                }

                                final pesquisaNormalizada = textEditingValue
                                    .text
                                    .toLowerCase()
                                    .replaceAll(RegExp(r'\s+'), '');

                                return listaOcorrencia.where((ocorrencia) {
                                  final codigoNormalizado = ocorrencia.codigo
                                      .toLowerCase()
                                      .replaceAll(RegExp(r'\s+'), '');

                                  return codigoNormalizado.startsWith(
                                    pesquisaNormalizada,
                                  );
                                });
                              },

                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        elevation: 4,
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width -
                                              32,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: options.length,
                                            itemBuilder: (context, index) {
                                              final ocorrencia = options
                                                  .elementAt(index);

                                              return ListTile(
                                                title: Text(
                                                  ocorrencia.codigo,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  ocorrencia.nomeOcorrencia,
                                                ),
                                                onTap: () {
                                                  onSelected(ocorrencia);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                              onSelected: (ocorrencia) {
                                codigoController.text = ocorrencia.codigo;
                              },
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await adicionarOcorrenciaAoPreAnuncio(
                                    codigoController.text,
                                  );
                                  setState(() {});
                                },
                                child: Text('Adicionar ao anúncio'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Número total de ocorrências: ${listaPreAnuncioOcorrencia.length}',
                            ),
                            SizedBox(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => OcorrenciaTile(
                                  ocorrencia: listaPreAnuncioOcorrencia[index],
                                ),
                                itemCount: listaPreAnuncioOcorrencia.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await confirmarEnvioDialog(
                              enviarAnuncioOcorrencias,
                            );
                          },
                          child: Text('Mandar anúncio'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<Storage>()
                                .listaPreAnuncioOcorrencia
                                .clear();
                            setState(() {});
                          },
                          child: Text('Limpar lista'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (enviandoAnuncio) ...[
          ModalBarrier(dismissible: false, color: Colors.black26),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

  Future<void> enviarAnuncioOcorrencias() async {
    final timer = Timer(Duration(seconds: 5), () {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Serviço com lentidão. Verifique sua conexão com a internet',
                ),
              ),
            ],
          ),
        ),
      );
      setState(() {
        enviandoAnuncio = false;
      });
    });
    try {
      setState(() {
        enviandoAnuncio = true;
      });

      await salvarAnuncioOcorrenciaNoDrift();
      await debugarListaAnuncioOcorrencia();
      await sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem();
      await sincronizarAnuncioOcorrenciaLocalParaNuvem();
      timer.cancel();
      setState(() {
        enviandoAnuncio = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Expanded(child: Text('Anúncio enviado com sucesso')),
            ],
          ),
        ),
      );
    } on Exception {
      timer.cancel();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: Text('Erro ao realizar enviar anúncio. Tente novamente'),
              ),
            ],
          ),
        ),
      );
      // TODO
    }
  }

  Future<void> sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem() async {
    await context
        .read<Storage>()
        .sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioOcorrenciaLocalParaNuvem() async {
    await context.read<Storage>().sincronizarAnuncioOcorrenciaLocalParaNuvem();
  }

  Future<void> debugarListaAnuncioOcorrencia() async {
    await context.read<Storage>().pegarTodosAnuncioOcorrenciaDrift();
  }

  Future<void> salvarAnuncioOcorrenciaNoDrift() async {
    await context.read<Storage>().salvarAnuncioOcorrenciaNoDrift();
  }

  Future<void> adicionarOcorrenciaAoPreAnuncio(String codigo) async {
    await context.read<Storage>().adicionarOcorrenciaAoPreAnuncio(codigo);
  }

  Future<void> sincronizarEPegarListaOcorrencia() async {
    await context.read<Storage>().sincronizarOcorrenciaNuvemParaLocal();
    await context.read<Storage>().atualizarListaOcorrencias();
  }

  Future<void> confirmarEnvioDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) =>
          ConfirmarEnvioAnuncioOcorrenciaDialog(function: function),
    );
  }
}
