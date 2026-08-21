import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:flutter_application_1/screen/ocorrencias_screen/card_info_anuncio_ocorrencia.dart';
import 'package:flutter_application_1/screen/ocorrencias_screen/ocorrencia_top_card.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OcorrenciasScreen extends StatefulWidget {
  const OcorrenciasScreen({super.key});

  @override
  State<OcorrenciasScreen> createState() => _OcorrenciasScreenState();
}

class _OcorrenciasScreenState extends State<OcorrenciasScreen> {
  List<Ocorrencia> listaOcorrenciasUltimoAnuncio = [];
  Militar? militarResponsavel;
  Anuncio? anuncioOcorrenciaMaisRecente;

  final List<String> listaTipoDeOcorrencia = [
    'APH',
    'Socorro',
    'Salvamento',
    'Prevenção e Vistoria',
    'Ações de Defesa Social',
    'Proteção e Defesa Civil',
    'Rotinas Administrativas',
    'Comunicações, Denuncias, Reclamações e Solicitações Diversas',
    'Coordeção e Controle Operacional e Administrativo ',
    'Demonstrações, Palestras e Treinamentos',
    'Operações de Defesa Social',
  ];

  @override
  void initState() {
    super.initState();
    atualizarListaDeOcorrenciaUltimoAnuncio();
    carregarDadosMilitarResponsavelAnuncioMaisRecente();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String get dataHorarioTexto {
    if (anuncioOcorrenciaMaisRecente == null) return '--/--/---- --:--';

    final dataHora = anuncioOcorrenciaMaisRecente!.dataHora.toLocal();

    final dia = dataHora.day.toString().padLeft(2, '0');
    final mes = dataHora.month.toString().padLeft(2, '0');
    final ano = dataHora.year.toString();

    final hora = dataHora.hour.toString().padLeft(2, '0');
    final minuto = dataHora.minute.toString().padLeft(2, '0');

    return '$dia/$mes/$ano $hora:$minuto';
  }

  @override
  Widget build(BuildContext context) {
    listaOcorrenciasUltimoAnuncio = context
        .read<Storage>()
        .listaOcorrenciasDeAnuncioMaisRecente;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Relatório Ocorrencias',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CardInformacoesAnuncioOcorrencia(
              responsavel: militarResponsavel == null
                  ? '---'
                  : '${militarResponsavel!.cargo} ${militarResponsavel!.nomeDeGuerra}',
              dataHorario: dataHorarioTexto,
            ),
            OcorrenciasTopCard(),
            Expanded(
              child: Material(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: listaTipoDeOcorrencia.length,
                  itemBuilder: (context, index) {
                    final tipoDeOcorrencia = listaTipoDeOcorrencia[index];
                    final listaOcorrenciasPorTipo =
                        pegarListaOcorrenciasPorTipo(tipoDeOcorrencia);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ExpansionTile(
                        leading: const Icon(Icons.fire_truck),
                        title: Text(
                          tipoDeOcorrencia,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '${listaOcorrenciasPorTipo.length} ocorrencia(s)',
                          style: GoogleFonts.inter(fontSize: 13),
                        ),
                        children: listaOcorrenciasPorTipo.isEmpty
                            ? [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Nenhuma ocorrencia dessa natureza.',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ]
                            : listaOcorrenciasPorTipo.map((ocorrencia) {
                                return ListTile(
                                  leading: const Icon(Icons.directions_car),
                                  title: Text(
                                    ocorrencia.codigo,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    ocorrencia.nomeOcorrencia,
                                    style: GoogleFonts.inter(fontSize: 13),
                                  ),
                                );
                              }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> carregarDadosMilitarResponsavelAnuncioMaisRecente() async {
    anuncioOcorrenciaMaisRecente = await context
        .read<Storage>()
        .pegarAnuncioOcorrenciaDiarioMaisRecente();
    if (anuncioOcorrenciaMaisRecente != null) {
      final idMilitarResponsavel =
          anuncioOcorrenciaMaisRecente!.idMilitarResponsavel;
      militarResponsavel = context.read<Storage>().pegarMilitarPorId(
        idMilitarResponsavel,
      );
    }
    setState(() {      
    });
  }

  Future<void> atualizarListaDeOcorrenciaUltimoAnuncio() async {
    await context.read<Storage>().atualizarListaDeOcorrenciaUltimoAnuncio();
    setState(() {});
  }

  List<Ocorrencia> pegarListaOcorrenciasPorTipo(String tipoOcorrencia) {
    return listaOcorrenciasUltimoAnuncio.where((item) {
      return item.tipo == tipoOcorrencia;
    }).toList();
  }
}
