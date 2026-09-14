import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/detalhes_militar_screen.dart';
import 'package:flutter_application_1/screen/efetivo_operacional/efetivo_top_card.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';
import 'package:flutter_application_1/model/destinacao_militar.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/efetivo_operacional/card_info_anuncio_militar.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EfetivoOperacionalScreen extends StatefulWidget {
  const EfetivoOperacionalScreen({super.key});

  @override
  State<EfetivoOperacionalScreen> createState() =>
      _EfetivoOperacionalScreenState();
}

class _EfetivoOperacionalScreenState extends State<EfetivoOperacionalScreen> {
  Anuncio? ultimoAnuncio;
  Militar? militarResponsavelAnuncio;
  List<DestinacaoMilitar> listaDestinacaoMilitar = [];

  bool carregandoImagem = true;

  final List<String> destinacoes = ['Sede Operacional', 'PA Canelas'];

  @override
  void initState() {
    super.initState();
    carregarDadosEfetivoOperacional();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String get dataHorarioTexto {
    if (ultimoAnuncio == null) return '--/--/---- --:--';

    final dataHora = ultimoAnuncio!.dataHora.toLocal();

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
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Efetivo Operacional',
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{
           await carregarDadosEfetivoOperacional();
          } ,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardInformacoesAnuncioMilitar.CardInformacoesAnuncioMilitar(
                  responsavel: militarResponsavelAnuncio == null
                      ? '---'
                      : '${militarResponsavelAnuncio!.cargo} ${militarResponsavelAnuncio!.nomeDeGuerra}',
                  dataHorario: dataHorarioTexto,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: EfetivoTopCard(listaDestinacaoMilitar: listaDestinacaoMilitar,),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                  itemCount: destinacoes.length,
                  itemBuilder: (context, index) {
                    final destinacao = destinacoes[index];
                    final listaMilitaresPorDestinacao = militaresPorDestinacao(
                      destinacao,
                    );
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ExpansionTile(
                        leading: const Icon(Icons.groups_rounded),
                        title: Text(
                          destinacao,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '${listaMilitaresPorDestinacao.length} militar(es)',
                          style: GoogleFonts.inter(fontSize: 13),
                        ),
                        children: listaMilitaresPorDestinacao.isEmpty
                            ? [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Nenhum militar nesta destinação.',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ]
                            : listaMilitaresPorDestinacao.map((
                                destinacaoMilitar,
                              ) {
                                final militar = destinacaoMilitar.militar;
                                return ListTile(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetalhesMilitarScreen(
                                            militar: militar,
                                          ),
                                    ),
                                  ),
                                  leading: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(25),                                                                                                              
                                      child: militar.urlImagem.isNotEmpty
                                          ? Image.network(fit: BoxFit.cover,
                                              militar.urlImagem,
                                              loadingBuilder:
                                                  (
                                                    context,
                                                    child,
                                                    loadingProgress,
                                                  ) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                            
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return const Icon(
                                                      Icons.person,
                                                      size: 50,
                                                    );
                                                  },
                                              width: 50,
                                              height: 50,
                                            )
                                          : const Icon(Icons.person, size: 50),
                                    ),
                                  ),
                                  title: Text(
                                    militar.nomeDeGuerra,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${militar.cargo} - BM ${militar.numeroBM}',
                                    style: GoogleFonts.inter(fontSize: 13),
                                  ),
                                  trailing: Text(
                                    militar.unidadeAtual,
                                    style: GoogleFonts.inter(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void carregarImagem() {}

  Future<void> carregarDadosEfetivoOperacional() async {
    final storage = context.read<Storage>();

    final Anuncio? anuncioMaisRecente = await storage
        .pegarAnuncioDeMilitaresMaisRecente();
    print(anuncioMaisRecente?.idAnuncio ?? 'ANUNCIO NULO');

    if (anuncioMaisRecente == null) {
      if (!mounted) return;
      ultimoAnuncio = null;
      return;
    }

    final List<AnuncioMilitar> listaAnuncioMilitar = await storage
        .pegarListaAnuncioMilitarPorIdAnuncio(anuncioMaisRecente.idAnuncio);
    print(listaAnuncioMilitar.length);

    final List<DestinacaoMilitar> listaConvertida = await storage
        .converterAnuncioMilitarEmDestinacaoMilitar(listaAnuncioMilitar);
    for (final item in listaConvertida) {
      print(
        'lista anuncioMilitar por anuncio: \n ${item.militar} - ${item.destinacaoMilitar}',
      );

      militarResponsavelAnuncio = await pegarMilitarResponsavelPorId(
        anuncioMaisRecente.idMilitarResponsavel,
      );
    }
    setState(() {
      ultimoAnuncio = anuncioMaisRecente;
      listaDestinacaoMilitar = listaConvertida;
    });
  }

  List<DestinacaoMilitar> militaresPorDestinacao(String destinacao) {
    return listaDestinacaoMilitar.where((item) {
      return item.destinacaoMilitar == destinacao;
    }).toList();
  }

  Future<Militar?> pegarMilitarResponsavelPorId(String idResponsavel) async {
    return await context.read<Storage>().buscarMilitarPorIdNoDrift(
      idResponsavel,
    );
  }
}
