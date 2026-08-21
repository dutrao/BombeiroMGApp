import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/detalhes_viatura_screen/detalhes_viatura_screen.dart';
import 'package:flutter_application_1/screen/frota_operacional_screen/card_info_anuncio_frota.dart';
import 'package:flutter_application_1/screen/frota_operacional_screen/frota_top_card.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrotaOperacionalScreen extends StatefulWidget {
  const FrotaOperacionalScreen({super.key});

  @override
  State<FrotaOperacionalScreen> createState() => _FrotaOperacionalScreenState();
}

class _FrotaOperacionalScreenState extends State<FrotaOperacionalScreen> {
  Anuncio? anuncioViaturaDiarioMaisRecente;
  Militar? militarResponsavelAnuncio;
  List<DestinacaoViatura> listaDestinacaoViatura = [];

  final List<String> destinacoes = ['Sede Operacional', 'PA Canelas', 'DSP'];

  @override
  void initState() {
    super.initState();
    carregarListaDestinacaoViaturasEMilitarResponsavel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String get dataHorarioTexto {
    if (anuncioViaturaDiarioMaisRecente == null) return '--/--/---- --:--';

    final dataHora = anuncioViaturaDiarioMaisRecente!.dataHora.toLocal();

    final dia = dataHora.day.toString().padLeft(2, '0');
    final mes = dataHora.month.toString().padLeft(2, '0');
    final ano = dataHora.year.toString();

    final hora = dataHora.hour.toString().padLeft(2, '0');
    final minuto = dataHora.minute.toString().padLeft(2, '0');

    return '$dia/$mes/$ano $hora:$minuto';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frota Operacional',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CardInformacoesAnuncioFrota.CardInformacoesAnuncioFrota(
              responsavel: militarResponsavelAnuncio == null
                  ? '---'
                  : '${militarResponsavelAnuncio!.cargo} ${militarResponsavelAnuncio!.nomeDeGuerra}',
              dataHorario: dataHorarioTexto,
            ),
            FrotaTopCard(listaDestinacaoViatura: listaDestinacaoViatura),
            Expanded(
              child: Material(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: destinacoes.length,
                  itemBuilder: (context, index) {
                    final destinacao = destinacoes[index];
                    final viaturas = viaturasPorDestinacao(destinacao);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ExpansionTile(
                        leading: const Icon(Icons.fire_truck),
                        title: Text(
                          destinacao,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '${viaturas.length} viatura(s)',
                          style: GoogleFonts.inter(fontSize: 13),
                        ),
                        children: viaturas.isEmpty
                            ? [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Nenhuma viatura nesta destinação.',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ]
                            : viaturas.map((destinacaoViatura) {
                                final viatura = destinacaoViatura.viatura;
                                return ListTile(
                                   onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalhesViaturaScreen(
                                            viatura: viatura,
                                          ),
                                    ),
                                  ),
                                  leading: const Icon(Icons.directions_car),
                                  title: Text(
                                    viatura.prefixo,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${viatura.tipoViatura} - ${viatura.modelo}',
                                    style: GoogleFonts.inter(fontSize: 13),
                                  ),
                                  trailing: Text(
                                    viatura.categoria,
                                    style: GoogleFonts.inter(fontSize: 12),
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

  Future<void> carregarListaDestinacaoViaturasEMilitarResponsavel() async {
    final storage = context.read<Storage>();

    final List<AnuncioViatura> listaAnuncioViatura = await storage
        .pegarListaAnuncioViaturaMaisRecente();

    final List<DestinacaoViatura> listaConvertida = await storage
        .converterAnuncioViaturaEmDestinacaoViatura(listaAnuncioViatura);

    anuncioViaturaDiarioMaisRecente = await context
        .read<Storage>()
        .pegarAnuncioDeViaturaDiarioMaisRecente();

    if (anuncioViaturaDiarioMaisRecente != null) {
      militarResponsavelAnuncio = context
          .read<Storage>()
          .pegarMilitarPorId(
            anuncioViaturaDiarioMaisRecente!.idMilitarResponsavel,
          );
    }    

    if (!mounted) return;

    setState(() {
      listaDestinacaoViatura = listaConvertida;
    });
  }

  Future<void> atualizarAnuncioViaturaDiarioMaisRecente() async {
    anuncioViaturaDiarioMaisRecente = await context
        .read<Storage>()
        .pegarAnuncioDeViaturaDiarioMaisRecente();
  }

  List<DestinacaoViatura> viaturasPorDestinacao(String destinacao) {
    return listaDestinacaoViatura.where((item) {
      return item.destinacaoViatura == destinacao;
    }).toList();
  }
}
