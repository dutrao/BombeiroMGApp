import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/database/anuncio_militar_diario_dao.dart';
import 'package:flutter_application_1/database/anuncio_militar_dao.dart';
import 'package:flutter_application_1/database/anuncio_ocorrencia_dao.dart';
import 'package:flutter_application_1/database/anuncio_ocorrencia_diario_dao.dart';
import 'package:flutter_application_1/database/anuncio_viatura_dao.dart';
import 'package:flutter_application_1/database/anuncio_viatura_diario_dao.dart';
import 'package:flutter_application_1/database/curso_dao.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/database/demanda_dao.dart';
import 'package:flutter_application_1/database/militar_curso_dao.dart';
import 'package:flutter_application_1/database/militar_dao.dart';
import 'package:flutter_application_1/database/ocorrencia_dao.dart';
import 'package:flutter_application_1/database/viatura_dao.dart';
import 'package:flutter_application_1/firebase_service/firebasestorage_service.dart';
import 'package:flutter_application_1/firebase_service/auth_service.dart';
import 'package:flutter_application_1/firebase_service/firestore_service.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';
import 'package:flutter_application_1/model/anuncio_ocorrencia.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';
import 'package:flutter_application_1/model/curso.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/model/destinacao_militar.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/militar_curso.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';

import '../model/viatura.dart';

class Repository {
  final AppDatabase database;
  final FirestoreService _firestoreService;
  final AuthService _authService;
  final FirebaseStorageService _firebaseStorageService;
  final MilitarDao _militarDao;
  final AnuncioOcorrenciaDiarioDao _anuncioOcorrenciaDiarioDao;
  final OcorrenciaDao _ocorrenciaDao;
  final AnuncioMilitarDao _anuncioMilitarDao;
  final AnuncioMilitarDiarioDao _anuncioDao;
  final ViaturaDao _viaturaDao;
  final AnuncioViaturaDiarioDao _anuncioViaturaDiarioDao;
  final AnuncioMilitarDiarioDao _anuncioMilitarDiarioDao;
  final AnuncioOcorrenciaDao _anuncioOcorrenciaDao;
  final AnuncioViaturaDao _anuncioViaturaDao;
  final DemandaDao _demandaDao;
  final CursoDao _cursoDao;
  final MilitarCursoDao _militarCursoDao;

  StreamSubscription<List<Militar>>? _subscription;

  bool _sincronizacaoMilitaresIniciada = false;

  Repository({required this.database})
    : _firestoreService = FirestoreService(),
      _authService = AuthService(),
      _firebaseStorageService = FirebaseStorageService(),
      _militarDao = MilitarDao(database: database),
      _anuncioOcorrenciaDiarioDao = AnuncioOcorrenciaDiarioDao(
        database: database,
      ),
      _demandaDao = DemandaDao(database: database),
      _ocorrenciaDao = OcorrenciaDao(database: database),
      _anuncioViaturaDiarioDao = AnuncioViaturaDiarioDao(appDatabase: database),
      _anuncioMilitarDiarioDao = AnuncioMilitarDiarioDao(appDatabase: database),
      _viaturaDao = ViaturaDao(database: database),
      _anuncioMilitarDao = AnuncioMilitarDao(appDatabase: database),
      _anuncioViaturaDao = AnuncioViaturaDao(database: database),
      _anuncioOcorrenciaDao = AnuncioOcorrenciaDao(database: database),
      _anuncioDao = AnuncioMilitarDiarioDao(appDatabase: database),
      _cursoDao = CursoDao(database: database),
      _militarCursoDao = MilitarCursoDao(database: database);

  ////FUNÇÕES RELACIONADAS A MILITARES
  Future<void> debugMilitares() async {
    await _militarDao.debugMilitares();
  }

  Future<void> sincronizarMilitaresFirebaseComDrift() async {
    try {
      final listaMilitares = await _firestoreService.pegarListaMilitares();
      await _militarDao.adicionarListaDeMilitaresAoDrift(listaMilitares);
      print('Lista Militares Sincronizado com sucesso');
    } on FirebaseException catch (e) {
      print('Erro ao pegar Militares no Firebase: $e');
      // TODO
    } catch (e) {
      print('Erro inesperado: $e');
    }
  }

  Future<void> debugCaminhoBanco() async {
    final result = await database.customSelect('PRAGMA database_list;').get();

    for (final row in result) {
      print(row.data);
    }
  }

  Future<void> debugAnuncioViaturaDiarioTabela() async {
    final List<Anuncio> listaAnuncio = await _anuncioViaturaDiarioDao
        .pegarAnuncios();
    print(listaAnuncio.length);
  }

  Future<List<Anuncio>> debugarListaAnuncioNaoSincronizados() async {
    return await _anuncioViaturaDiarioDao.pegarAnunciosNaoSincronizados();
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _sincronizacaoMilitaresIniciada = false;
  }

  String pegarUUIDUsuario() {
    return _authService.pegarUuidUsuario();
  }

  Future<Militar?> pegarDadosUsuario() async {
    final idMilitar = _authService.pegarUuidUsuario();
    return _militarDao.pegarDadosUsuario(idMilitar);
  }

  // Funções relacionadas a militar
  Future<void> atualizarMilitaresParaSincronizado() async {
    await _militarDao.atualizarMilitaresParaSincronizado();
  }

  Future<List<Militar>> pegarListaTodosMilitares() async {
    final listaMilitares = await _militarDao.pegarTodosMilitares();

    return listaMilitares;
  }

  Future<void> adicionarMilitarLocal(Militar militar) async {
    await _militarDao.adicionarMilitarNoDrift(militar);
  }

  Future<void> adicionarOuAtualizarMilitarUsuarioNaNuvem() async {
    try {
      final String uuidUsuario = pegarUUIDUsuario();
      Militar? militarUsuario = await _militarDao.buscarMilitarPorIdNoDrift(
        uuidUsuario,
      );
      if (militarUsuario != null) {
        await _firestoreService.inserirOuAtualizarDadosFirebase(militarUsuario);
      }
      print('Sucesso ao adicionar ou atualizar militar usuario');
    } on Exception catch (e) {
      print('Erro ao adicionar ou atualizar militar usuario: $e');
      // TODO
    }
  }

  //Buscar militares não sincronizados no Drift e mandar para o FireStore

  Future<void> sincronizarMilitaresComFirebase() async {
    final listaMilitaresNaoSincronizados = await _militarDao
        .pegarMilitaresNaoSincronizados();

    for (final militar in listaMilitaresNaoSincronizados) {
      await _firestoreService.inserirOuAtualizarDadosFirebase(militar);
    }
  }

  Future<void> sincronizarMilitaresDriftComFirebase() async {
    if (_sincronizacaoMilitaresIniciada) return;

    _sincronizacaoMilitaresIniciada = true;

    _subscription = _firestoreService.streamMilitares().listen(
      (militaresFirebase) async {
        await _militarDao.adicionarListaDeMilitaresAoDrift(militaresFirebase);

        print(
          'Sincronização executada. ${militaresFirebase.length} militares recebidos.',
        );
      },
      onError: (e) {
        print('Erro de sincronização: $e');
        _sincronizacaoMilitaresIniciada = false;
      },
    );
  }

  Stream<List<Militar>> observarTodosMilitaresDrift() {
    return _militarDao.observarTodosMilitares();
  }

  Future<void> fazerUploadImagemUsuario(bytes) async {
    await _firebaseStorageService.uploadFotoUsuario(bytes);
  }

  Future<void> salvarUrlFotoUsuarioNoDrift(String idMilitar) async {
    final urlImagem = await _firebaseStorageService.pegarUrlFotoUsuario();

    if (urlImagem != null) {
      await _militarDao.atualizarCampoMilitarDrift(idMilitar, urlImagem);
    }
  }

  Future<String?> pegarUrlFotoUsuario() async {
    return _firebaseStorageService.pegarUrlFotoUsuario();
  }

  Future<void> fazerAutenticacao(String email, String password) async {
    await _authService.autenticarUsuario(email, password);
  }

  Future<void>solicitarSenhaPorEmail(String email)async{
   await _authService.solicitarSenhaPorEmail(email);
  }

  Future<void>enviarEmailconfirmacao()async{

  }

  Future<void> cadastrarUsuario(String email, String password) async {
    await _authService.cadastrarUsuario(email, password);
  }

  bool verificaSeUsuarioLogado() {
    return _authService.verificarSeUsuarioLogado();
  }

  void deslogar() {
    _authService.deslogar();
  }

  //FUNÇÕES RELACIONADAS A ANUNCIO MILITAR DIARIO

  Future<void> sincronizarAnuncioMilitarDiarioLocalParaNuvem() async {
    try {
      final resultado = await _anuncioMilitarDiarioDao
          .pegarListaAnunciosMilitarDiarioNaoSincronizados();
      final listaComCampoSincronizado = await _anuncioMilitarDiarioDao
          .converterAnuncioMilitarDiarioParaSincronizado(resultado);
      await _firestoreService.adicionarListaAnuncioMilitarDiario(
        listaComCampoSincronizado,
      );
      await _anuncioMilitarDiarioDao
          .atualizarTodosAnuncioMilitarDiarioParaSincronizado();
      print('sucesso ao sincronizar lista anuncio militar diario');
    } on FirebaseException catch (e) {
      print(
        'Erro ao adicionar lista de anuncio militares diario ao Firebase: ${e.code}',
      );
      // TODO
    } catch (e) {
      print('erro inesperado $e');
    }
  }

  Future<String> pegarIdAnuncioMilitarMaisRecente() async {
    return await _anuncioMilitarDiarioDao.pegarIdAnuncioMilitarMaisRecente();
  }

  Future<void> sincronizarAnuncioMilitarDiarioNuvemParaLocal() async {
    final listaAnuncioMilitarDiario = await _firestoreService
        .pegarListaAnuncioMilitarDiarioMaisRecente();
    await _anuncioMilitarDiarioDao
        .substituirListAnuncioMilitarDiarioLocalPorNuvem(
          listaAnuncioMilitarDiario,
        );
  }

  Future<void> adicionarAnuncioMilitarDiarioAoDrift({
    required String idMilitarResponsavel,
  }) async {
    await _anuncioMilitarDiarioDao.adicionarAnuncioMilitarDiario(
      idMilitarResponsavel: idMilitarResponsavel,
    );
  }

  Future<List<AnuncioMilitar>> pegarMilitaresUltimoAnuncioDoDiaFirebase(
    DateTime data,
  ) async {
    return _firestoreService.buscarMilitaresUltimoAnuncioDoDiaFirebase(data);
  }

  Future<List<AnuncioMilitar>> pegarMilitaresUltimoAnuncioDoDia(
    DateTime data,
  ) async {
    final anuncio = await _anuncioDao.pegarUltimoAnuncioDoDia(data);

    if (anuncio == null) {
      return [];
    }

    return _anuncioMilitarDao.pegarMilitaresPorAnuncioId(anuncio.idAnuncio);
  }

  Future<void> adicionarAnuncioMilitar(AnuncioMilitar anuncioMilitar) async {
    await _anuncioMilitarDao.adicionarAnuncioMilitar(anuncioMilitar);
  }

  Future<void> adicionarListaAnuncioMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    await _anuncioMilitarDao.adicionarListaAnuncioMilitar(listaAnuncioMilitar);
  }

  Future<void> removerAnuncioMilitar(AnuncioMilitar anuncioMilitar) async {
    await _anuncioMilitarDao.removerAnuncioMilitar(anuncioMilitar);
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarLocal() async {
    return _anuncioMilitarDao.pegarListaAnuncioMilitarLocal();
  }

  Future<List<Militar>> converterListaAnuncioMilitaremMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    List<Militar> listaMilitares = [];
    for (final anuncioMilitar in listaAnuncioMilitar) {
      Militar? militar = await _militarDao.buscarMilitarPorIdNoDrift(
        anuncioMilitar.idMilitar,
      );
      if (militar != null) {
        listaMilitares.add(militar);
      }
    }
    return listaMilitares;
  }

  Future<void> salvarPreAnuncioNoDrift(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    await _anuncioMilitarDao.adicionarListaAnuncioMilitarNoDrift(
      listaAnuncioMilitar,
    );
  }

  Stream<List<AnuncioMilitar>> observarAnunciosMilitaresPendentesDrift() {
    return (database.select(
      database.anuncioMilitarTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).watch().map((rows) {
      return rows.map((row) {
        return AnuncioMilitar(
          idAnuncio: row.idAnuncio,
          idMilitar: row.idMilitar,
          destinacaoMilitar: row.destinacaoMilitar,
          sincronizado: row.sincronizado,
        );
      }).toList();
    });
  }

  ////FUNÇÕES VINCULADA A GESTÃO DE VIATURA
  //Adicionar viatura ao Drift
  Future<void> adicionarViaturaNoDrift(Viatura viatura) async {
    await _viaturaDao.adicionarViaturaNoDrift(viatura);
  }

  Future<List<Viatura>> pegarViaturasNoDrift() async {
    return _viaturaDao.pegarViaturasNoDrift();
  }

  Future<void> sincronizarViaturasLocalParaNuvem() async {
    final viaturasPendentes = await _viaturaDao
        .buscarViaturasNaoSincronizadas();
    await _firestoreService.adicionarListaViaturasNoFirestore(
      viaturasPendentes,
    );
  }

  Future<Anuncio?> pegarAnuncioDeViaturaDiarioMaisRecente() async {
    return await _anuncioViaturaDiarioDao
        .pegarAnuncioViaturaDiarioMaisRecente();
  }

  Future<void> sincronizarViaturaNuvemParaLocal() async {
    try {
      final listaViaturas = await _firestoreService.pegarListaViaturasNuvem();
      await _viaturaDao.sincronizarViaturaNuvemParaLocal(listaViaturas);
      print('Sucesso ao sincronizar viaturas nuvem com local');
    } on FirebaseException catch (e) {
      print('Erro ao sincronizar viaturas nuvem com local: ${e.code} ');
      // TODO
    } catch (e) {
      print('Erro ao sincronizar viaturas nuvem com local: $e');
    }
  }

  StreamSubscription sincronizarViaturasFirestoreEDrift() {
    return _firestoreService.ouvirMudancasViaturaFirestore().listen((
      snapshot,
    ) async {
      for (final change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final data = change.doc.data();
            if (data == null) continue;

            final viatura = Viatura.fromMap(data);
            await _viaturaDao.adicionarViaturaNoDrift(viatura);
            break;

          case DocumentChangeType.modified:
            final data = change.doc.data();
            if (data == null) continue;

            final viatura = Viatura.fromMap(data);
            await _viaturaDao.atualizarDadosViaturaNoDrift(viatura);
            break;

          case DocumentChangeType.removed:
            await _viaturaDao.deletarViaturaNoDriftFisico(change.doc.id);
            break;
        }
      }
    });
  }

  ////FUNÇÕES DE ANUNCIO DE VIATURA
  Future<void> salvarAnuncioViaturaNoDrift(
    Anuncio anuncio,
    List<AnuncioViatura> listaAnuncioViatura,
  ) async {
    _anuncioViaturaDiarioDao.salvarAnuncioComViaturas(
      anuncio: anuncio,
      listaDestinacaoViaturas: listaAnuncioViatura,
    );
  }

  Future<void> sincronizarAnuncioViaturaDiarioLocalParaNuvem() async {
    try {
      final List<Anuncio> listaAnuncioNaoSincronizado =
          await _anuncioViaturaDiarioDao.pegarAnunciosNaoSincronizados();

      final listaConvertidaParaSincronizado = await _anuncioViaturaDiarioDao
          .converterListaAnuncioViaturaDiarioParaSincronizado(
            listaAnuncioNaoSincronizado,
          );

      await _firestoreService.adicionarAnuncioViaturaDiarioNoFirestore(
        listaConvertidaParaSincronizado,
      );
      await _anuncioViaturaDiarioDao
          .atualizarTodosAnuncioViaturaDiarioParaSincronizado();
      print(
        'Sincronização de anuncio viatura diario local para numvem com sucesso',
      );
    } on Exception {
      print(
        'erro ao tentar sincronizar anuncio viatura diario local para nuvem',
      );
      rethrow;
      // TODO
    }
  }

  Future<void> sincronizarAnuncioViaturaDiarioNuvemParaLocal() async {
    try {
      final listaAnuncioViaturaDiario = await _firestoreService
          .pegarListaAnuncioViauraDiarioMaisRecente();
      await _anuncioViaturaDiarioDao.sincronizarAnuncioViaturaDiario(
        listaAnuncioViaturaDiario,
      );
      print(
        'sincronização anuncio viatura diario nuvem para local com sucesso',
      );
    } on Exception {
      print(
        'erro ao tentar sincronizar anuncio viatura diario nuvem para local',
      );
      // TODO
    }
  }

  Future<String> pegarIdAnuncioDeViaturaDiarioMaisRecente() async {
    final listaAnuncioViaturaDiario = await _firestoreService
        .pegarListaAnuncioViauraDiarioMaisRecente();
    return listaAnuncioViaturaDiario[0].idAnuncio;
  }

  Future<void> sincronizarAnuncioViaturaNuvemParaLocal() async {
    try {
      final idAnuncioMaisRecente =
          await pegarIdAnuncioDeViaturaDiarioMaisRecente();
      final listaAnuncioViatura = await _firestoreService
          .pegarListaAnuncioViaturaPorIdAnuncio(idAnuncioMaisRecente);
      for (final anuncio in listaAnuncioViatura) {
        print(
          '${anuncio.idAnuncio} - ${anuncio.idViatura} - ${anuncio.destinacaoViatura} - ${anuncio.sincronizado}',
        );
      }
      await _anuncioViaturaDao.sincronizarAnuncioViaturaNuvemParaLocal(
        listaAnuncioViatura,
      );
      print('Sucesso ao sincronizar anuncioViatura nuvem com local');
    } on Exception catch (e) {
      print('Erro ao sincronizar anuncioViatura nuvem com local: $e');
      // TODO
    }
  }

  Future<void> sincronizarAnuncioViaturaLocalParaNuvem() async {
    try {
      final listaAnuncioViatura = await _anuncioViaturaDao
          .pegarListaAnuncioViaturaNaoSincronizado();
      final listaConvertida = _anuncioViaturaDao
          .convertListaAnuncioViaturaParaSincronizado(listaAnuncioViatura);
      await _firestoreService.adicionarListaAnuncioViaturas(listaConvertida);
      await _anuncioViaturaDao.atualizarTodosAnuncioViaturaParaSincronizado();
      print('Sucesso ao sincronizar anuncioViatura local com nuvem');
    } on Exception catch (e) {
      print('Erro ao sincronizar anuncioViatura local com nuvem: $e');
      rethrow;
      // TODO
    }
  }

  Future<void> atualizarCampoAnuncioViaturaParaSincronizado() async {
    final List<Anuncio> listaAnuncioNaoSincronizado =
        await _anuncioViaturaDiarioDao.pegarAnunciosNaoSincronizados();
    await _anuncioViaturaDiarioDao
        .converterListaAnuncioViaturaDiarioParaSincronizado(
          listaAnuncioNaoSincronizado,
        );
  }

  Future<List<AnuncioViatura>> pegarListAnuncioViaturaMaisRecente() async {
    final Anuncio? ultimoAnuncio = await _anuncioViaturaDiarioDao
        .pegarAnuncioViaturaDiarioMaisRecente();
    List<AnuncioViatura> listaAnuncioViatura = [];
    if (ultimoAnuncio != null) {
      final List<AnuncioViatura> listaAnuncioViatura = await _anuncioViaturaDao
          .pegarListaAnuncioViaturaPorIdAnuncio(ultimoAnuncio.idAnuncio);
      return listaAnuncioViatura;
    }
    return listaAnuncioViatura;
  }

  ////FUNÇÕES RELACIONADA A VIATURA
  //Converter AnuncioViatura em DestinacaoViatura
  Future<List<DestinacaoViatura>> converterAnuncioViaturaEmDestinacaoViatura(
    List<AnuncioViatura> listaAnuncioViatura,
  ) async {
    if (listaAnuncioViatura.isEmpty) {
      return [];
    }

    final idsViaturas = listaAnuncioViatura
        .map((anuncioViatura) => anuncioViatura.idViatura)
        .toList();

    final listaViaturaRow = await (database.select(
      database.viaturaTabela,
    )..where((tbl) => tbl.idViatura.isIn(idsViaturas))).get();

    final mapaViaturas = {
      for (final row in listaViaturaRow)
        row.idViatura: Viatura(
          idViatura: row.idViatura,
          prefixo: row.prefixo,
          tipoViatura: row.tipoViatura,
          marca: row.marca,
          modelo: row.modelo,
          ano: row.ano,
          combustivel: row.combustivel,
          categoria: row.categoria,
          sincronizado: row.sincronizado,
          placa: row.placa,
          deletado: row.deletado,
        ),
    };

    final listaDestinacaoViatura = <DestinacaoViatura>[];

    for (final anuncioViatura in listaAnuncioViatura) {
      final viatura = mapaViaturas[anuncioViatura.idViatura];

      if (viatura != null) {
        listaDestinacaoViatura.add(
          DestinacaoViatura(
            viatura: viatura,
            destinacaoViatura: anuncioViatura.destinacaoViatura,
          ),
        );
      }
    }

    return listaDestinacaoViatura;
  }

  Future<void> deletarViaturaNoDriftLogico(String idViatura)async{
   await _viaturaDao.deletarViaturaNoDriftLogico(idViatura);
  }

  ////FUNÇÃO RELACIONADA A MILITAR
  Future<List<DestinacaoMilitar>> converterAnuncioMilitarEmDestinacaoMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    if (listaAnuncioMilitar.isEmpty) {
      return [];
    }

    final idsMilitares = listaAnuncioMilitar
        .map((anuncioMilitar) => anuncioMilitar.idMilitar)
        .toList();

    final listaMilitarRow = await (database.select(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.isIn(idsMilitares))).get();

    final mapaMilitares = {
      for (final row in listaMilitarRow)
        row.idMilitar: Militar(
          idMilitar: row.idMilitar,
          numeroBM: row.numeroBM,
          nomeCompleto: row.nomeCompleto,
          nomeDeGuerra: row.nomeDeGuerra,
          cargo: row.cargo,
          credencialMotorista: row.credencialMotorista,
          dataNascimento: row.dataNascimento,
          estadoCivil: row.estadoCivil,
          unidadeAtual: row.unidadeAtual,
          telefone: row.telefone,
          urlImagem: row.urlImagem,
          email: row.email,
          obs: row.obs,
          sincronizado: row.sincronizado,
          cpf: row.cpf,
          rua: row.rua,
          bairro: row.bairro,
          cidade: row.cidade,
          numeroResidencia: row.numero,
          cep: row.cep,
          naturalidade: row.naturalidade,
          funcao: row.funcao,
          numeroConta: row.numeroConta,
          banco: row.banco,
          numeroAg: row.numeroAg,
          quantidadeAdi: row.quantidadeAdi,
          complementoEndereco: row.complementoEndereco,
        ),
    };

    final listaDestinacaoMilitar = <DestinacaoMilitar>[];

    for (final anuncioMilitar in listaAnuncioMilitar) {
      final militar = mapaMilitares[anuncioMilitar.idMilitar];

      if (militar != null) {
        listaDestinacaoMilitar.add(
          DestinacaoMilitar(
            militar: militar,
            destinacaoMilitar: anuncioMilitar.destinacaoMilitar,
          ),
        );
      }
    }

    return listaDestinacaoMilitar;
  }

  Future<Militar?> buscarMilitarPorIdNoDrift(String idMilitar) async {
    return await _militarDao.buscarMilitarPorIdNoDrift(idMilitar);
  }

  ////FUNÇÕES DE ANUNCIO MILITAR
  StreamSubscription sincronizarMilitarFirestoreEDrift() {
    return _firestoreService.ouvirMudancasMilitarFirestore().listen((
      snapshot,
    ) async {
      for (final change in snapshot.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            final data = change.doc.data();
            if (data == null) continue;

            final militar = Militar.fromMap(data);
            await _militarDao.adicionarMilitarNoDrift(militar);
            break;

          case DocumentChangeType.modified:
            final data = change.doc.data();
            if (data == null) continue;

            final militar = Militar.fromMap(data);
            await _militarDao.atualizarDadosMilitarNoDrift(militar);
            break;

          case DocumentChangeType.removed:
            await _militarDao.deletarMilitarNoDrift(change.doc.id);
            break;
        }
      }
    });
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarPorId(
    String idAnuncio,
  ) async {
    return await _anuncioMilitarDao.pegarMilitaresPorAnuncioId(idAnuncio);
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarMaisRecente() async {
    final Anuncio? ultimoAnuncio = await _anuncioMilitarDiarioDao
        .pegarUltimoAnuncioFeito();

    if (ultimoAnuncio == null) {
      return [];
    }

    final List<AnuncioMilitar> listaAnuncioMilitar = await _anuncioMilitarDao
        .pegarMilitaresPorAnuncioId(ultimoAnuncio.idAnuncio);

    return listaAnuncioMilitar;
  }

  //FUNÇÕES RELACIONADAS A ANUNCIO DE MILITAR
  Future<Anuncio?> pegarAnuncioDeMilitareMaisRecente() async {
    return await _anuncioMilitarDiarioDao.pegarUltimoAnuncioFeito();
  }

  Future<void> sincronizarAnuncioMilitarNuvemParaLocal() async {
    try {
      final Anuncio? anuncioDeMilitarMaisRecente =
          await pegarAnuncioDeMilitareMaisRecente();
      if (anuncioDeMilitarMaisRecente != null) {
        final listaAnuncioMilitar = await _firestoreService
            .pegarListaAnuncioMilitarMaisRecente(
              anuncioDeMilitarMaisRecente.idAnuncio,
            );
        final listaConvertidaParaSincronizado = _anuncioMilitarDao
            .converterListaAnuncioMilitarParaSincronizado(listaAnuncioMilitar);

        await _anuncioMilitarDao.sincronizarAnuncioMilitarNuvemParaLocal(
          listaConvertidaParaSincronizado,
        );
        await _anuncioMilitarDao
            .atualizarTodosAnuncioMilitarLocalParaSincronizado();
      }
      print('Sucesso ao sincronizar anuncio militar nuvem com local');
    } on FirebaseException catch (e) {
      print('Erro ao sincronização anuncio militar firestore: ${e.code}');
      // TODO
    } catch (e) {
      print('Erro ao inesperado anuncio militar : $e');
    }
  }

  Future<void> sincronizarAnuncioMilitarLocalParaNuvem() async {
    try {
      final listaNaoSincronizada = await _anuncioMilitarDao
          .pegarListaAnuncioMilitarNaoSincronizado();
      final listaConvertidaParaSincronizado = _anuncioMilitarDao
          .converterListaAnuncioMilitarParaSincronizado(listaNaoSincronizada);
      await _firestoreService.adicionarListaAnuncioMilitarNuvem(
        listaConvertidaParaSincronizado,
      );
      for (final result in listaConvertidaParaSincronizado) {
        print(
          'lista Anuncio Militar Convertido para sincronizado \n ${result.idAnuncio} - ${result.idMilitar} - ${result.destinacaoMilitar} - ${result.sincronizado}',
        );
      }

      await _anuncioMilitarDao
          .atualizarTodosAnuncioMilitarLocalParaSincronizado();
      print('Sucesso ao sincronizar anuncio militar local para nuvem');
    } on FirebaseException catch (e) {
      print('Erro ao sincronizar anuncio militar local para nuvem: ${e.code}');
      // TODO
    } catch (e) {
      print('Erro ao sincronizar anuncio militar local para nuvem: $e');
    }
  }

  //FUNÇÕES RELACIONADAS A DEMANDA

  Future<void> adicionarOuAtualizarDemandaAoDrift(Demanda demanda) async {
    await _demandaDao.inserirDemandaNoDrift(demanda);
  }
  Future<void> deletarDemandaNoDriftLogico(String idDemanda) async {
   await _demandaDao.deletarDemandaNoDriftLogico(idDemanda);
  }

  Future<void> deletarDemandaDoDrift(String idDemanda) async {
    await _demandaDao.deletarDemandaNoDrift(idDemanda);
  }

  Future<void> uploadDocumentoDemanda(bytes, String idDemanda) async {
    await _firebaseStorageService.uploadDemanda(bytes, idDemanda);
  }

  Future<String?> pegarUrlPorIdDemanda(String idDemanda) async {
    return await _firebaseStorageService.pegarUrlDemandaPorId(idDemanda);
  }

  Future<List<Demanda>> pegarListaDemanda() async {
    return await _demandaDao.pegarListaDemanda();
  }

  Future<void> sincronizarDemandaLocalParaNuvem() async {
    try {
      List<Demanda> listaDemandas = await _demandaDao
          .pegarListaDemandasNaoSincronizadas();
      final listaConvertida = _demandaDao
          .converterListaOcorrenciaParaSincronizado(listaDemandas);
      await _firestoreService.adicionarListaDemandaNuvem(listaConvertida);
      await _demandaDao.atualizarTodasDemandasParaSincronizado();
      print('Sucesso ao sincronizar demanda local para nuvem');
    } on FirebaseException catch (e) {
      print('Erro ao sincronizar demanda local para nuvem: ${e.code}');
      // TODO
    } catch (e) {
      print('Erro ao sincronizar demanda local para nuvem: $e');
    }
  }

  Future<void> sincronizarDemandaNuvemParaLocal() async {
    try {
      final listaDemandas = await _firestoreService
          .pegarListaDemandasVigentes();
      print('Demandas nuvem');
      print(listaDemandas.length);
      await _demandaDao.sicronizarDemandasNuvemParaLocal(listaDemandas);
      await _demandaDao.atualizarTodasDemandasParaSincronizado();
      print('Sucesso ao sincronizar demanda nuvem para local');
    } on FirebaseException catch (e) {
      print('Erro ao sincronizar demanda nuvem para local: ${e.code}');
      // TODO
    } catch (e) {
      print('Erro ao sincronizar demanda nuvem para local: $e');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> ouvirMudancasDemandasFirestore() {
    return _firestoreService.ouvirMudancasDemandasFirestore();
  }

  ////FUNÇÕES RELACIONADAS A OCORRÊNCIA
  Future<List<Ocorrencia>> pegarListaOcorrenciasDrift() async {
    final resultado = await _ocorrenciaDao.pegarListaOcorrenciasDrift();
    return resultado;
  }

  Future<List<Ocorrencia>> pegarListaOcorrenciasFirestore() async {
    final resultado = await _firestoreService.pegarListaOcorrenciasFirestore();
    return resultado;
  }

  Future<void> sincronizarAnuncioOcorrenciaDiarioLocalParaNuvem() async {
    try {
      final listaAnuncioOcorrenciaDiarioNaoSincronizado =
          await _anuncioOcorrenciaDiarioDao
              .pegarListaAnuncioOcorrenciaDiarioNaoSincronizados();
      final listaConvertidaParaSincronizado = await _anuncioOcorrenciaDiarioDao
          .converterAnuncioOcorrenciaDiarioParaSincronizado(
            listaAnuncioOcorrenciaDiarioNaoSincronizado,
          );
      await _firestoreService.adicionarListaAnuncioOcorrenciaDiarioNaNuvem(
        listaConvertidaParaSincronizado,
      );
      print(
        'sincronização anuncio Ocorrencia Diario Local Para Nuvem com sucesso',
      );
    } on FirebaseException catch (e) {
      print(
        'Erro ao adicionar lista de anuncio ocorrencia diario ao firebase: ${e.code}',
      );
      // TODO
    } catch (e) {
      print('erro desconhecido: $e');
    }
  }

  Future<void> sincronizarAnuncioOcorrenciaDiarioNuvemParaLocal() async {
    final listaAnuncioOcorrenciaDiario = await _firestoreService
        .pegarListAnuncioDeOcorrenciaDiarioMaisRecente();
    await _anuncioOcorrenciaDiarioDao.sincronizarListaAnuncioOcorrenciasDiario(
      listaAnuncioOcorrenciaDiario,
    );
  }

  Future<void> sincronizarOcorrenciaNuvemParaLocal() async {
    try {
      final resultados = await pegarListaOcorrenciasFirestore();
      await _ocorrenciaDao.adicionarOuAtualizarListaDrift(resultados);
      print('sincronização de tipos de ocorrencia com sucesso');
    } on FirebaseException catch (e) {
      print('Erro tipos de ocorrencia: ${e.code}');
      // TODO
    } catch (e) {
      print('Erro tipos de ocorrencia: $e');
    }
  }

  Future<Ocorrencia> pegarOcorrenciaPorCodigoDrift(String codigo) async {
    return await _ocorrenciaDao.pegarOcorrenciaPorCodigo(codigo);
  }

  Future<void> salvarAnuncioOcorrenciaNoDrift(
    List<Ocorrencia> listaOcorrencia,
  ) async {
    Militar? militar = await pegarDadosUsuario();
    await _anuncioOcorrenciaDiarioDao.adicionarAnuncioOcorrencia(
      militar!.idMilitar,
      listaOcorrencia,
    );
  }

  Future<List<AnuncioOcorrenciaTabelaData>>
  pegarListaAnuncioOcorrenciaDataDriftPorIdAnuncio(String idAnuncio) async {
    return _anuncioOcorrenciaDao
        .pegarListaAnuncioOcorrenciaDataDriftPorIdAnuncio(idAnuncio);
  }

  Future<List<AnuncioOcorrenciaTabelaData>>
  pegarListaAnuncioOcorrenciaDataDrift() async {
    final resultados = await _anuncioOcorrenciaDao
        .pegarListaAnuncioOcorrenciaDataDrift();
    for (final resultado in resultados) {
      print('${resultado.idAnuncioOcorrencia} - ${resultado.idOcorrencia}');
    }
    return resultados;
  }

  Future<List<Ocorrencia>> converterListaAnuncioOcorrenciaDataEmListaOcorrencia(
    List<AnuncioOcorrenciaTabelaData> listaAnuncioOcorrenciaTabelaData,
  ) async {
    List<Ocorrencia> listaOcorrencia = [];
    for (final anuncioOcorrenciaTabelaData
        in listaAnuncioOcorrenciaTabelaData) {
      final ocorrencia = await _ocorrenciaDao.pegarOcorrenciaPorId(
        anuncioOcorrenciaTabelaData.idOcorrencia,
      );
      listaOcorrencia.add(ocorrencia);
    }
    return listaOcorrencia;
  }

  ////FUNÇÃO RELACIONADA A ANUNCIO OCORRENCIA DIARIO
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
  _subscriptionAnuncioOcorrencia;

  void sincronizarAnuncioOcorrenciaDriftComFirestore() {
    _subscriptionAnuncioOcorrencia?.cancel();

    _subscriptionAnuncioOcorrencia = _firestoreService
        .ouvirMudancasAnuncioOcorrenciaFirestore()
        .listen(
          (snapshot) async {
            for (final change in snapshot.docChanges) {
              final dados = change.doc.data();

              if (dados == null) continue;

              final anuncioOcorrencia = AnuncioOcorrencia.fromMap(dados);

              switch (change.type) {
                case DocumentChangeType.added:
                case DocumentChangeType.modified:
                  await _anuncioOcorrenciaDao
                      .adicionarOuAtualizarAnuncioOcorrencia(anuncioOcorrencia);
                  break;

                case DocumentChangeType.removed:
                  break;
              }
            }
          },
          onError: (erro) {
            print('Erro na stream de AnuncioOcorrencia: $erro');
          },
        );
  }

  Future<List<Ocorrencia>> pegarListaDeOcorrenciaMaisRecente() async {
    final Anuncio? anuncio = await _anuncioOcorrenciaDiarioDao
        .pegarUltimoAnuncioDeOcorrenciaFeito();
    if (anuncio != null) {
      final listaAnuncioOcorrenciaTabelaData =
          await pegarListaAnuncioOcorrenciaDataDriftPorIdAnuncio(
            anuncio.idAnuncio,
          );
      final listaAnuncioOcorrencia =
          await converterListaAnuncioOcorrenciaDataEmListaOcorrencia(
            listaAnuncioOcorrenciaTabelaData,
          );
      return listaAnuncioOcorrencia;
    } else {
      return [];
    }
  }

  Future<Anuncio?> pegarAnuncioOcorrenciaDiarioMaisRecente() async {
    final resultados = await _firestoreService
        .pegarListAnuncioDeOcorrenciaDiarioMaisRecente();
    return resultados[0];
  }

  Future<void> adicionarOuAtualizarListaAnuncioOcorrenciaDrift(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) async {
    await _anuncioOcorrenciaDao.adicionarOuAtualizarListaAnuncioOcorrenciaDrift(
      listaAnuncioOcorrencia,
    );
  }

  ////FUNÇÃO RELACIONADA A ANUNCIO DE OCORRENCIA
  Future<Anuncio?> pegarUltimoAnunicoDeOcorrencia() async {
    return await _anuncioOcorrenciaDiarioDao
        .pegarUltimoAnuncioDeOcorrenciaFeito();
  }

  Future<void> sincronizarAnuncioOcorrenciaLocalParaNuvem() async {
    try {
      final listaNaoSincronizada = await _anuncioOcorrenciaDao
          .pegarListaAnuncioOcorrenciaNaoSincronizados();
      final listaConvertida = _anuncioOcorrenciaDao
          .converterListaAnuncioOcorrenciaParaSincronizado(
            listaNaoSincronizada,
          );
      await _firestoreService.adicionarListaAnuncioOcorrenciaNuvem(
        listaConvertida,
      );
      await _anuncioOcorrenciaDao
          .atualizarTodosAnuncioOcorrenciaParaSincronizado();
      print('Sucesso ao sincronizar anuncioOcorrencia local para nuvem');
    } on FirebaseException catch (e) {
      print(
        'Erro ao sincronizar anuncioOcorrencia local para nuvem: ${e.code}',
      );
      // TODO
    } catch (e) {
      print('Erro ao sincronizar anuncioOcorrencia local para nuvem: $e');
    }
  }

  Future<void> sincronizarAnuncioOcorrenciaNuvemParaLocal() async {
    try {
      final listaAnuncioMaisRecente = await _firestoreService
          .pegarListAnuncioDeOcorrenciaDiarioMaisRecente();
      final listaAnuncioOcorrencia = await _firestoreService
          .pegarListaAnuncioOcorrenciaPorIdAnuncio(
            listaAnuncioMaisRecente[0].idAnuncio,
          );
      await _anuncioOcorrenciaDao.sincronizarAnuncioOcorrenciaNuvemParaLocal(
        listaAnuncioOcorrencia,
      );

      print('Sucesso ao sincronizar anuncioOcorrencia nuvem para local');
    } on FirebaseException catch (e) {
      print(
        'Erro ao sincronizar anuncioOcorrencia nuvem para local: ${e.code}',
      );
      // TODO
    } catch (e) {
      print('Erro ao sincronizar anuncioOcorrencia nuvem para local: $e');
    }
  }

  ////FUNÇÕES RELACIONADAS A MILITARCURSO

  Future<void> sincronizarMilitarCursoLocalParaNuvem() async {
    try {
      final listaNaoSincronizada = await _militarCursoDao
          .pegarListaMilitarCursoNaoSincronizados();
      final listaConvertida = _militarCursoDao
          .converterListaMilitarCursoSincronizado(listaNaoSincronizada);
      await _firestoreService.adicionarListaMilitarCursoNuvem(listaConvertida);
      await _militarCursoDao.atualizarTodosMilitarCursosSincronizado();
      print('Sucesso ao sincronizar militarCurso na nuvem');
    } on Exception catch (e) {
      print('erro ao tentar adicionar lista MilitarCurso a nuvem: $e');
      // TODO
    }
  }

  Future<void> sincronizarMilitarCursoNuvemParaLocal() async {
    try {
      final listaMilitarCurso = await _firestoreService
          .pegarListaMilitarCursoNuvem();
      print('numero militar curso: ${listaMilitarCurso.length}');
      await _militarCursoDao.sincronizarMilitarCursoNuvemParaLocal(
        listaMilitarCurso,
      );
      print('Sucesso ao sincronizar Militar Curso Nuvem para local');
    } on Exception catch (e) {
      print('Erro ao sincronizar Militar Curso Nuvem para local: $e');
      // TODO
    }
  }

  Future<void> atualizarTodosMilitarCursosNaoSincronizado() async {
    await _militarCursoDao.atualizarTodosMilitarCursosNaoSincronizado();
  }

  Future<void> adicionarMilitarCursoLocal(MilitarCurso militarCurso) async {
    await _militarCursoDao.adicionarMilitarCurso(militarCurso);
  }

  Future<void> removerMilitarCursoLocal(MilitarCurso militarCurso) async {
    await _militarCursoDao.removerMilitarCurso(militarCurso);
  }

  ////FUNÇÕES RELACIONADAS A CURSO
  Future<List<Militar>> buscarMilitaresPorListaCurso(
    List<String> listaNomeCursos,
  ) async {
    return await _militarCursoDao.buscarMilitaresPorListaCurso(listaNomeCursos);
  }

  Future<void> sincronizarCursoNuvemParaLocal() async {
    try {
      final listaCursos = await _firestoreService.pegarListaTodosCursos();
      await _cursoDao.sincronizarCursoNuvemParaLocal(listaCursos);
      print('Sucesso ao sincronizar cursos nuvem com local');
    } on Exception {
      // TODO
      print('Erro ao sincronizar cursos nuvem com local');
    }
  }

  Future<List<Curso>> pegarListaCurso() async {
    return await _cursoDao.pegarListaCursos();
  }

  Future<List<String>> pegarListaNomeCursoPorIdMilitar(String idMilitar) async {
    return await _militarCursoDao.pegarListaNomeCursoPorIdMilitar(idMilitar);
  }
}
