import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';
import 'package:flutter_application_1/model/anuncio_ocorrencia.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';
import 'package:flutter_application_1/model/curso.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/model/destinacao_militar.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/militar_curso.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:uuid/uuid.dart';

class Storage extends ChangeNotifier {
  final Repository repository;

  Storage({required this.repository}) {
    repository.sincronizarMilitaresDriftComFirebase();
  }

  List<Militar> listaTotalMilitares = [];
  List<AnuncioMilitar> listaCompletaAnuncio = [];
  List<AnuncioMilitar> listaProvisoriaAnuncioMilitar = [];
  List<Viatura> listaTotalViaturas = [];
  List<DestinacaoViatura> listaPreAnuncioDestinacaoViatura = [];
  List<Demanda> listaDemandas = [];
  List<Ocorrencia> listaTipoDeOcorrencia = [];
  List<Ocorrencia> listaPreAnuncioOcorrencia = [];
  List<Ocorrencia> listaOcorrenciasDeAnuncioMaisRecente = [];
  List<AnuncioOcorrencia> listaAnuncioOcorrencia = [];
  List<Curso> listaCursos = [];
  String idAnuncioMaisRecente = '';

  StreamSubscription<List<Militar>>? _militaresSubscription;

  @override
  void dispose() {
    _militaresSubscription?.cancel();
    super.dispose();
  }

  ////FUNÇÕES RELACIONADAS A AUTENTICAÇÃO
  bool verificaSeUsuarioLogado() {
    return repository.verificaSeUsuarioLogado();
  }

  ////FUNÇÕES RELACIONADAS AO ANUNCIO DE MILITARES DIARIO
  Future<void> sincronizarAnuncioMilitarDiarioLocalParaNuvem() async {
    await repository.sincronizarAnuncioMilitarDiarioLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioMilitarDiarioNuvemParaLocal() async {
    await repository.sincronizarAnuncioMilitarDiarioNuvemParaLocal();
  }

  Future<void> atualizarIdAnuncioMilitarMaisRecente() async {
    idAnuncioMaisRecente = await repository.pegarIdAnuncioMilitarMaisRecente();
  }

  //DEGUBAR
  void debugarAnuncioViaturaDiarioTabela() {
    repository.debugAnuncioViaturaDiarioTabela();
  }

  //Funções relacionadas a militar

  Future<String> pegarIdMilitarUsuario() async {
    final Militar? militar = await pegarDadosUsuario();
    if (militar == null) {
      return '';
    }
    return militar.idMilitar;
  }

  Future<void> atualizarMilitaresParaSincronizado() async {
    await repository.atualizarMilitaresParaSincronizado();
  }

  Future<void> adicionarOuAtualizarMilitarNoDrift(Militar militar) async {
    await repository.adicionarMilitarLocal(militar);
  }

  Future<void> adicionarOuAtualizarDadosUsuarioNaNuvem() async {
    await repository.adicionarOuAtualizarMilitarUsuarioNaNuvem();
  }

  Future<void> sincronizarMilitarLocalComNuvem() async {
    await repository.sincronizarMilitaresFirebaseComDrift();
  }

  Future<void> sincronizarMilitarLocalparaNuvem() async {
    try {
      await repository.sincronizarMilitaresComFirebase();
      await atualizarMilitaresParaSincronizado();
    } on FirebaseException catch (e) {
      print('erro firebase: $e');
      // TODO
    } catch (e) {
      print('erro inesperado');
    }
  }

  String pegarUUIDUsuario() {
    return repository.pegarUUIDUsuario();
  }

  Future<void>solicitarSenhaPorEmail(String email)async{
   await repository.solicitarSenhaPorEmail(email);
  }

  Future<Militar?> pegarDadosUsuario() async {
    return repository.pegarDadosUsuario();
  }

  Future<void> adicionarAnuncioMilitarDiarioAoDrift(
    String idMilitarResponsavel,
  ) async {
    await repository.adicionarAnuncioMilitarDiarioAoDrift(
      idMilitarResponsavel: idMilitarResponsavel,
    );
    notifyListeners();
  }

  ////FUNÇÕES RELACIONADAS A ANUNCIO MILITAR

  Future<void> debugarTabelaAnuncioMilitar() async {
    final results = await repository.pegarListaAnuncioMilitarLocal();

    for (final result in results) {
      print(
        '${result.idAnuncio} - ${result.idMilitar} - ${result.destinacaoMilitar} - ${result.sincronizado}',
      );
    }
  }

  List<Militar> convertListaAnuncioMilitarParaListaMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) {
    return listaAnuncioMilitar
        .map((anuncio) {
          return pegarMilitarPorId(anuncio.idMilitar);
        })
        .whereType<Militar>()
        .toList();
  }

  List<Militar> listaMilitaresUltimoAnuncioPorDestinacao(String destinacao) {
    List<Militar> listaMilitaresNaDestinacao = [];
    final listaAnuncioMilitarDestinacao = listaCompletaAnuncio.where((
      anuncioMilitar,
    ) {
      return anuncioMilitar.destinacaoMilitar == destinacao;
    });
    for (final anuncioMilitar in listaAnuncioMilitarDestinacao) {
      final Militar? militar = pegarMilitarPorId(anuncioMilitar.idMilitar);
      if (militar != null) {
        listaMilitaresNaDestinacao.add(militar);
      }
    }

    return listaMilitaresNaDestinacao;
  }

  Future<void> adicionarListaAnuncioMilitar() async {
    await atualizarIdAnuncioMilitarMaisRecente();
    final List<AnuncioMilitar> listaAnuncioMilitarComIdAnuncio =
        listaProvisoriaAnuncioMilitar.map((anuncioMilitar) {
          return AnuncioMilitar(
            idMilitar: anuncioMilitar.idMilitar,
            idAnuncio: idAnuncioMaisRecente,
            destinacaoMilitar: anuncioMilitar.destinacaoMilitar,
          );
        }).toList();
    for (final anuncioMilitar in listaAnuncioMilitarComIdAnuncio) {
      print(
        '${anuncioMilitar.idAnuncio} - ${anuncioMilitar.idMilitar} - ${anuncioMilitar.destinacaoMilitar} - ${anuncioMilitar.sincronizado}',
      );
    }
    await repository.adicionarListaAnuncioMilitar(
      listaAnuncioMilitarComIdAnuncio,
    );
  }

  AnuncioMilitar converterMilitarEmAnuncioMilitar(
    Militar militar,
    String destinacao,
  ) {
    return AnuncioMilitar(
      idAnuncio: '',
      idMilitar: militar.idMilitar,
      destinacaoMilitar: destinacao,
      sincronizado: false,
    );
  }

  Future<List<Militar>> converterListaAnuncioMilitarEmMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    return repository.converterListaAnuncioMilitaremMilitar(
      listaAnuncioMilitar,
    );
  }

  void adicionarAnuncioMilitarPreAnuncio(AnuncioMilitar anuncioMilitar) {
    final jaExiste = listaProvisoriaAnuncioMilitar.any((item) {
      return item.idMilitar == anuncioMilitar.idMilitar;
    });

    if (jaExiste) {
      debugPrint('Militar ${anuncioMilitar.idMilitar} já está no pré-anúncio.');
      return;
    }

    listaProvisoriaAnuncioMilitar.add(anuncioMilitar);
    notifyListeners();
  }

  bool verificarMilitarEmDuasDestinacoes(AnuncioMilitar anuncioMilitar) {
    return listaProvisoriaAnuncioMilitar.any((item) {
      return item.idMilitar == anuncioMilitar.idMilitar &&
          item.destinacaoMilitar != anuncioMilitar.destinacaoMilitar;
    });
  }

  void removerAnuncioMilitarPreAnuncio(AnuncioMilitar anuncioMilitar) {
    listaProvisoriaAnuncioMilitar.removeWhere((item) {
      return item.idMilitar == anuncioMilitar.idMilitar &&
          item.destinacaoMilitar == anuncioMilitar.destinacaoMilitar;
    });

    notifyListeners();
  }

  void limparPreAnuncio() {
    listaProvisoriaAnuncioMilitar.clear();
    notifyListeners();
  }

  void debugarPreanuncio() {
    debugPrint(
      'Pré-anúncio: ${listaProvisoriaAnuncioMilitar.length} militares',
    );

    for (final anuncio in listaProvisoriaAnuncioMilitar) {
      debugPrint(
        '${anuncio.idAnuncio} - ${anuncio.idMilitar} - ${anuncio.destinacaoMilitar}',
      );
    }
  }

  Future<void> carregarListaAnuncioMilitarCompleta() async {
    listaCompletaAnuncio = await repository.pegarListaAnuncioMilitarLocal();
    print('lista anuncio militar local: ${listaCompletaAnuncio.length}');
    notifyListeners();
  }

  List<Militar> filtrarListaMilitaresPorCargo(
    List<Militar> listaMilitares,
    String cargo,
  ) {
    final List<Militar> militaresPorCargo = [];

    if (cargo == 'oficial') {
      for (final militar in listaMilitares) {
        if (militar.cargo == '1º Ten' || militar.cargo == '2º Ten') {
          militaresPorCargo.add(militar);
        }
      }
    } else if (cargo == 'subTen/sgt') {
      for (final militar in listaMilitares) {
        if (militar.cargo == 'Sub Ten' ||
            militar.cargo == '1º Sgt' ||
            militar.cargo == '2º Sgt' ||
            militar.cargo == '3º Sgt') {
          militaresPorCargo.add(militar);
        }
      }
    } else {
      for (final militar in listaMilitares) {
        if (militar.cargo == 'Cb' || militar.cargo == 'Sd') {
          militaresPorCargo.add(militar);
        }
      }
    }
    return militaresPorCargo;
  }

  Future<int> numeroMilitaresPorCargo(String cargo) async {
    final List<Militar> militaresPorCargo = [];

    final List<Militar> listaMilitares =
        await converterListaAnuncioMilitarEmMilitar(listaCompletaAnuncio);
    print('lista antes da conversão:${listaCompletaAnuncio.length}');
    print('Militares no anuncio: ${listaMilitares.length}');
    print('Militares no anuncio: ${listaMilitares[0].cargo}');

    if (cargo == 'oficial') {
      for (final militar in listaMilitares) {
        if (militar.cargo == '1º Ten' || militar.cargo == '2º Ten') {
          militaresPorCargo.add(militar);
        }
      }
    } else if (cargo == 'subTen/sgt') {
      for (final militar in listaMilitares) {
        if (militar.cargo == 'Sub Ten' ||
            militar.cargo == '1º Sgt' ||
            militar.cargo == '2º Sgt' ||
            militar.cargo == '3º Sgt') {
          militaresPorCargo.add(militar);
        }
      }
    } else {
      for (final militar in listaMilitares) {
        if (militar.cargo == 'Cb' || militar.cargo == 'Sd') {
          militaresPorCargo.add(militar);
        }
      }
    }
    return militaresPorCargo.length;
  }

  Future<List<Militar>> listaMilitaresPorDestinacao(String destinacao) async {
    final anunciosFiltrados = listaCompletaAnuncio.where((anuncio) {
      return anuncio.destinacaoMilitar == destinacao;
    }).toList();
    return await converterListaAnuncioMilitarEmMilitar(anunciosFiltrados);
  }

  List<Militar> listaMilitaresPreAnuncioPorDestinacao(String destinacao) {
    final anunciosDaDestinacao = listaProvisoriaAnuncioMilitar.where((anuncio) {
      return anuncio.destinacaoMilitar == destinacao;
    });

    return anunciosDaDestinacao
        .map((anuncio) {
          return pegarMilitarPorId(anuncio.idMilitar);
        })
        .whereType<Militar>()
        .toList();
  }

  /* Future<List<Militar>> militaresPreAnuncioPorDestinacao(String destinacao) async {
    final anunciosDaDestinacao = listaProvisoriaAnuncioMilitar.where((anuncio) {
      return anuncio.destinacaoMilitar == destinacao;
    }).toList(); 
    return  await converterListaAnuncioMilitarEmMilitar(anunciosDaDestinacao);
  }*/

  Militar? pegarMilitarPorId(String idMilitar) {
    try {
      return listaTotalMilitares.firstWhere(
        (militar) => militar.idMilitar == idMilitar,
      );
    } catch (e) {
      return null;
    }
  }

  Militar? pegarMilitarPorNumeroBM(String numeroBM) {
    try {
      return listaTotalMilitares.firstWhere(
        (militar) => militar.numeroBM == numeroBM,
      );
    } catch (e) {
      return null;
    }
  }

  ////FUNÇÕES RELACIONADAS A ANUNCIO DE VIATURA DIARIO
  void removerDestinacaoMilitarPreAnuncio(DestinacaoMilitar destinacaoMilitar) {
    listaProvisoriaAnuncioMilitar.removeWhere((item) {
      return item.idMilitar == destinacaoMilitar.militar.idMilitar &&
          item.destinacaoMilitar == destinacaoMilitar.destinacaoMilitar;
    });

    notifyListeners();
  }

  ////FUNÇÕES RELACIONADAS A ANUNCIO VIATURA
  Future<void> sincronizarAnuncioViaturaNuvemParaLocal() async {
    await repository.sincronizarAnuncioViaturaNuvemParaLocal();
  }

  Future<void> sincronizarAnuncioViaturaLocalParaNuvem() async {
    await repository.sincronizarAnuncioViaturaLocalParaNuvem();
  }

  ////FUNÇÕES VINCULADAS A VIATURA

  List<DestinacaoViatura> pegarListaDestinacaoViaturaPorTipoViatura(
    String tipoViatura,
    List<DestinacaoViatura> listaDestinacaoViatura,
  ) {
    List<DestinacaoViatura> listaViaturaPorTipoViatura = [];
    for (final destinacaoViatura in listaDestinacaoViatura) {
      if (destinacaoViatura.viatura.tipoViatura == tipoViatura) {
        listaViaturaPorTipoViatura.add(destinacaoViatura);
      }
    }
    return listaViaturaPorTipoViatura;
  }

  Future<void> sincronizarViaturaNuvemParaLocal() async {
    await repository.sincronizarViaturaNuvemParaLocal();
  }

  //adicionar viatura ao drift
  Future<void> adicionarViaturaNoDrift(Viatura viatura) async {
    await repository.adicionarViaturaNoDrift(viatura);
  }

  Future<void>deletarViaturaNoDriftLogico(String idViatura)async{
    repository.deletarViaturaNoDriftLogico(idViatura);
  }

  //Sincronizar viaturas do drift com firebase
  Future<void> sincronizarViaturaLocalParaNuvem() async {
    await repository.sincronizarViaturasLocalParaNuvem();
  }

  //Abrir canal de Sincronizção de viaturas Firestore com  o drift
  StreamSubscription ouvirMudancasViaturaFirestore() {
    final subscription = repository.sincronizarViaturasFirestoreEDrift();
    return subscription;
  }

  //Pegar lista de viaturas no drift
  Future<void> atualizarListaTotalViaturas() async {
    listaTotalViaturas = await repository.pegarViaturasNoDrift();
    notifyListeners();
  }

  //Converter lista de DestinacaoViatura em lista de Viatura
  List<Viatura> converterListaDestinacaoViaturaEmListaViatura(
    List<DestinacaoViatura> listaDestinacaoViatura,
    ItemAnuncioViaturas itemAnuncio,
  ) {
    List<Viatura> resultadoConversao = [];
    for (var destinacaoViatura in listaDestinacaoViatura) {
      if (destinacaoViatura.destinacaoViatura == itemAnuncio.nome) {
        resultadoConversao.add(destinacaoViatura.viatura);
      }
    }
    return resultadoConversao;
  }

  //Adicionar Destinação viatura a lista de PréAnuncio
  void adicionarDestinacaoViaturaPreAnuncio(
    DestinacaoViatura destinacaoViatura,
  ) {
    final jaExiste = listaPreAnuncioDestinacaoViatura.any((item) {
      return item.viatura.idViatura == destinacaoViatura.viatura.idViatura;
    });

    if (jaExiste) {
      debugPrint('Viatura já está no pré-anúncio.');
      return;
    }

    listaPreAnuncioDestinacaoViatura.add(destinacaoViatura);
    notifyListeners();
  }

  //Remover Destinação Viatura do Pré Anuncio
  void removerDestinacaoViaturaPreAnuncio(DestinacaoViatura destinacaoViatura) {
    listaPreAnuncioDestinacaoViatura.removeWhere((item) {
      return item.viatura.idViatura == destinacaoViatura.viatura.idViatura &&
          item.destinacaoViatura == destinacaoViatura.destinacaoViatura;
    });
    notifyListeners();
  }

  //FUNÇÕES DE ANUNCIO VIATURA
  Future<void> salvarAnuncioViaturaNoDrift() async {
    final uuidUsuario = pegarUUIDUsuario();
    final uuidAnuncio = Uuid().v4();
    List<AnuncioViatura> listaAnuncioViatura = [];
    for (final destinacaoViatura in listaPreAnuncioDestinacaoViatura) {
      final anuncioViatura = AnuncioViatura(
        idAnuncio: uuidAnuncio,
        idViatura: destinacaoViatura.viatura.idViatura,
        destinacaoViatura: destinacaoViatura.destinacaoViatura,
      );
      listaAnuncioViatura.add(anuncioViatura);
    }
    await repository.salvarAnuncioViaturaNoDrift(
      Anuncio(
        idAnuncio: uuidAnuncio,
        dataHora: DateTime.now(),
        idMilitarResponsavel: uuidUsuario,
      ),
      listaAnuncioViatura,
    );
  }

  Future<void> sincronizarAnuncioViaturaDiarioLocalParaNuvem() async {
    await repository.sincronizarAnuncioViaturaDiarioLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioViaturaDiarioNuvemParaLocal() async {
    await repository.sincronizarAnuncioViaturaDiarioNuvemParaLocal();
  }

  Future<Anuncio?> pegarAnuncioDeViaturaDiarioMaisRecente() async {
    return await repository.pegarAnuncioDeViaturaDiarioMaisRecente();
  }

  Future<void> debugarListaAnuncioNaoSincronizados() async {
    final listaAnuncio = await repository.debugarListaAnuncioNaoSincronizados();
    print(listaAnuncio.length);
  }

  Future<List<AnuncioViatura>> pegarListaAnuncioViaturaMaisRecente() async {
    return await repository.pegarListAnuncioViaturaMaisRecente();
  }

  //FUNÇÕES LIGADAS A DESTINAÇÃO VIATURA
  Future<List<DestinacaoViatura>> converterAnuncioViaturaEmDestinacaoViatura(
    List<AnuncioViatura> listaAnuncioViatura,
  ) async {
    return await repository.converterAnuncioViaturaEmDestinacaoViatura(
      listaAnuncioViatura,
    );
  }

  ////FUNÇÕES LIGADAS ANUNCIO MILITAR
  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarMaisRecente() async {
    return await repository.pegarListaAnuncioMilitarMaisRecente();
  }

  Future<void> sincronizarAnuncioMilitarNuvemParaLocal() async {
    await repository.sincronizarAnuncioMilitarNuvemParaLocal();
  }

  Future<void> sincronizarAnuncioMilitarLocalParaNuvem() async {
    await repository.sincronizarAnuncioMilitarLocalParaNuvem();
  }

  ////FUNÇÕES LIGADAS A MILITAR
  Future<void> atualizarListaTodosMilitares() async {
    listaTotalMilitares = await repository.pegarListaTodosMilitares();
    notifyListeners();
  }

  Future<Militar?> buscarMilitarPorIdNoDrift(String idMilitar) async {
    return await repository.buscarMilitarPorIdNoDrift(idMilitar);
  }

  Future<Anuncio?> pegarAnuncioDeMilitaresMaisRecente() async {
    return await repository.pegarAnuncioDeMilitareMaisRecente();
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarPorIdAnuncio(
    String idAnuncio,
  ) async {
    return await repository.pegarListaAnuncioMilitarPorId(idAnuncio);
  }

  Future<List<DestinacaoMilitar>> converterAnuncioMilitarEmDestinacaoMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    return await repository.converterAnuncioMilitarEmDestinacaoMilitar(
      listaAnuncioMilitar,
    );
  }

  StreamSubscription ouvirMudancasMilitarFirestore() {
    final subscription = repository.sincronizarViaturasFirestoreEDrift();
    return subscription;
  }

  ////FUNÇÕES LIGADAS A DEMANDA
  Future<void> adicionarOuAtualizarDemandaAoDrift(Demanda demanda) async {
    await repository.adicionarOuAtualizarDemandaAoDrift(demanda);
  }
  Future<void> deletarDemandaNoDriftLogico(String idDemanda) async {
  await repository.deletarDemandaNoDriftLogico(idDemanda);
  }

  Future<void> uploadDocumentoDemanda(bytes, String idDemanda) async {
    await repository.uploadDocumentoDemanda(bytes, idDemanda);
  }

  Future<String?> pegarUrlPorIdDemanda(String idDemanda) async {
    return await repository.pegarUrlPorIdDemanda(idDemanda);
  }

  Future<List<Demanda>> pegarListaDemanda() async {
    return await repository.pegarListaDemanda();
  }

  Future<void> sincronizarDemandaLocalParaNuvem() async {
    await repository.sincronizarDemandaLocalParaNuvem();
  }

  Future<void> sincronizarDemandaNuvemParaLocal() async {
    await repository.sincronizarDemandaNuvemParaLocal();
  }

  Future<void> atualizarDemandas() async {
    listaDemandas = await repository.pegarListaDemanda();
    print('Demandas');
    for (final demanda in listaDemandas) {
      print(demanda.idDemanda);
    }
    notifyListeners();
  }

  StreamSubscription ouvirDemandasFirestore() {
    return repository.ouvirMudancasDemandasFirestore().listen((snapshot) async {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.removed) {
          await repository.deletarDemandaDoDrift(change.doc.id);
          continue;
        }

        final demanda = Demanda.fromMap({
          ...change.doc.data()!,
          'idDemanda': change.doc.id,
        });

        await repository.adicionarOuAtualizarDemandaAoDrift(demanda);
      }

      await atualizarDemandas();
    });
  }

  ////FUNÇÕES RELACIONADAS A OCORRENCIA
  ///
  List<Ocorrencia> pegarListaOcorrenciasPorTipo(
    List<Ocorrencia> listaOcorrencias,
    String tipoOcorrencia,
  ) {
    return listaOcorrencias.where((item) {
      return item.tipo == tipoOcorrencia;
    }).toList();
  }

  Future<void> atualizarListaDeOcorrenciaUltimoAnuncio() async {
    listaOcorrenciasDeAnuncioMaisRecente = await repository
        .pegarListaDeOcorrenciaMaisRecente();
    notifyListeners();
  }

  Future<void> atualizarListaOcorrencias() async {
    final resultados = await repository.pegarListaOcorrenciasDrift();
    listaTipoDeOcorrencia = resultados;
    notifyListeners();
  }

  Future<void> sincronizarOcorrenciaNuvemParaLocal() async {
    await repository.sincronizarOcorrenciaNuvemParaLocal();
  }

  Future<Ocorrencia> pegarOcorrenciaPorCodigoDrift(String codigo) async {
    return await repository.pegarOcorrenciaPorCodigoDrift(codigo);
  }

  Future<void> adicionarOcorrenciaAoPreAnuncio(String codigo) async {
    final Ocorrencia ocorrencia = await pegarOcorrenciaPorCodigoDrift(codigo);
    listaPreAnuncioOcorrencia.add(ocorrencia);
    notifyListeners();
  }

  void removerOcorrenciaPreAnuncio(Ocorrencia ocorrencia) {
    listaPreAnuncioOcorrencia.remove(ocorrencia);
    notifyListeners();
  }

  Future<void> salvarAnuncioOcorrenciaNoDrift() async {
    await repository.salvarAnuncioOcorrenciaNoDrift(listaPreAnuncioOcorrencia);
  }

  Future<List<Ocorrencia>> pegarListaOcorrencia() async {
    final resultado = await repository.pegarListaAnuncioOcorrenciaDataDrift();
    return await repository
        .converterListaAnuncioOcorrenciaDataEmListaOcorrencia(resultado);
  }

  Future<void> adicionarOuAtualizarAnuncioOcorrencia() async {
    await repository.adicionarOuAtualizarListaAnuncioOcorrenciaDrift(
      listaAnuncioOcorrencia,
    );
  }

  //FUNÇÕES VINCULADAS A ANUNCIO DE OCORRENCIA DIARIO

  Future<Anuncio?> pegarUltimoAnuncioDeOcorrenciaFeito() async {
    return await repository.pegarUltimoAnunicoDeOcorrencia();
  }

  Future<void> sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem() async {
    await repository.sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioOcorrenciaDiarioNuvemParaLocal() async {
    await repository.sincronizarAnuncioOcorrenciaDiarioNuvemParaLocal();
  }

  Future<Anuncio?> pegarAnuncioOcorrenciaDiarioMaisRecente() async {
    return await repository.pegarAnuncioOcorrenciaDiarioMaisRecente();
  }

  //FUNÇÕES RELACIONADAS A ANUNCIOOCORRENCIA

  Future<void> pegarTodosAnuncioOcorrenciaDrift() async {
    repository.pegarListaAnuncioOcorrenciaDataDrift();
  }

  Future<void> sincronizarAnuncioOcorrenciaLocalParaNuvem() async {
    await repository.sincronizarAnuncioOcorrenciaLocalParaNuvem();
  }

  Future<void> sincronizarAnuncioOcorrenciaNuvemParaLocal() async {
    await repository.sincronizarAnuncioOcorrenciaNuvemParaLocal();
  }

  ////FUNÇÕES RELACIONADAS A MILITARCURSO
  Future<void> sincronizarMilitarCursoLocalParaNuvem() async {
    await repository.sincronizarMilitarCursoLocalParaNuvem();
  }

  Future<void> sincronizarMilitarCursoNuvemParaLocal() async {
    await repository.sincronizarMilitarCursoNuvemParaLocal();
  }

  Future<void> adicionarMilitarCursoLocal(MilitarCurso militarCurso) async {
    await repository.adicionarMilitarCursoLocal(militarCurso);
  }

  Future<void> removerMilitarCursoLocal(MilitarCurso militarCurso) async {
    await repository.removerMilitarCursoLocal(militarCurso);
  }

  Future<void> atualizarTodosMilitarCursosNaoSincronizado() async {
    await repository.atualizarTodosMilitarCursosNaoSincronizado();
  }

  ////FUNÇÕES RELACIONADAS A CURSO

  Future<List<Militar>> buscarMilitaresPorListaCurso(
    List<String> listaNomeCursos,
  ) async {
    return await repository.buscarMilitaresPorListaCurso(listaNomeCursos);
  }

  Future<void> sincronizarCursoNuvemParaLocal() async {
    await repository.sincronizarCursoNuvemParaLocal();
  }

  Future<void> atualizarListaCursos() async {
    listaCursos = await repository.pegarListaCurso();
    notifyListeners();
  }

  Future<List<String>> pegarListaNomeCursosPorMilitar(String idMilitar) async {
    return await repository.pegarListaNomeCursoPorIdMilitar(idMilitar);
  }
}
