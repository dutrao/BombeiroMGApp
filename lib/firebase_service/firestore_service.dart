import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';
import 'package:flutter_application_1/model/anuncio_ocorrencia.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';
import 'package:flutter_application_1/model/curso.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/militar_curso.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';

import '../model/viatura.dart';

class FirestoreService {
  late FirebaseFirestore firestore;
  late FirebaseAuth auth;

  FirestoreService({FirebaseFirestore? firestore, FirebaseAuth? auth}) {
    (firestore != null)
        ? this.firestore = firestore
        : this.firestore = FirebaseFirestore.instance;
    (auth != null) ? this.auth = auth : this.auth = FirebaseAuth.instance;
  }

  ////FUNÇÕES RELACIONADAS A ANUNCIO MILITAR DIARIO
  Future<void> adicionarListaAnuncioMilitarDiario(
    List<Anuncio> listaAnuncioMilitarDiario,
  ) async {
    final batch = firestore.batch();

    for (final anuncioMilitarDiario in listaAnuncioMilitarDiario) {
      final docRef = firestore.collection('anuncioMilitarDiario').doc();
      batch.set(docRef, anuncioMilitarDiario.toMap());
    }
    await batch.commit();
  }

  Future<List<Anuncio>> pegarListaAnuncioMilitarDiarioMaisRecente() async {
    final resultados =
        await (firestore
                .collection('anuncioMilitarDiario')
                .orderBy('dataHora', descending: true))
            .limit(1)
            .get();
    List<Anuncio> listaAnuncio = [];
    for (final resultado in resultados.docs) {
      listaAnuncio.add(Anuncio.fromMap(resultado.data()));
    }
    return listaAnuncio;
  }

  ////FUNÇÕES RELACIONADAS A MILITAR
  Stream<List<Militar>> streamMilitares() {
    return firestore.collection('militares').snapshots().map((event) {
      return event.docs.map((doc) {
        final data = doc.data();
        data['idMilitar'] ??= doc.id;

        return Militar.fromMap(data);
      }).toList();
    });
  }

  Future<void> atualizarDadosMilitarUsuario() async {}

  Future<List<Militar>> pegarListaMilitares() async {
    final resultados = await firestore.collection('militares').get();
    List<Militar> listaMilitares = [];
    for (final resultado in resultados.docs) {
      listaMilitares.add(Militar.fromMap(resultado.data()));
    }
    return listaMilitares;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> pegarMilitarPorNome(
    String nome,
  ) async {
    return firestore
        .collection('militares')
        .where('nomeBusca', isGreaterThanOrEqualTo: nome)
        .get();
  }

  Future<void> inserirOuAtualizarDadosFirebase(Militar militar) async {
    try {
      await firestore
          .collection('militares')
          .doc(militar.idMilitar)
          .set(militar.toMap());
    } on Exception catch (e) {
      print('Erro ao tentar atualizar firestore: $e');
    }
  }

  Future<void> atualizarCampoFirebase(String campo, dynamic dado) async {
    await firestore.collection('militares').doc(auth.currentUser!.uid).update({
      campo: dado,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>
  pegarMilitaresDestinacao() async {
    return FirebaseFirestore.instance.collection('efetivo').doc('data').get();
  }

  Future<void> salvarAnuncioNoFirebase({
    required Anuncio anuncio,
    required List<AnuncioMilitar> militares,
  }) async {
    await firestore.collection('anuncios').doc(anuncio.idAnuncio).set({
      'idAnuncio': anuncio.idAnuncio,
      'dataHora': Timestamp.fromDate(anuncio.dataHora),
      'idMilitarResponsavel': anuncio.idMilitarResponsavel,
      'sincronizado': true,
      'militares': militares.map((m) => m.toMap()).toList(),
    });
  }

  ////FUNÇÕES RELACIONADAS A ANUNCIO MILITAR
  Future<List<AnuncioMilitar>> buscarMilitaresUltimoAnuncioDoDiaFirebase(
    DateTime data,
  ) async {
    final inicioDoDia = DateTime(data.year, data.month, data.day);
    final fimDoDia = inicioDoDia.add(const Duration(days: 1));

    final snapshot = await firestore
        .collection('anuncios')
        .where(
          'dataHora',
          isGreaterThanOrEqualTo: Timestamp.fromDate(inicioDoDia),
        )
        .where('dataHora', isLessThan: Timestamp.fromDate(fimDoDia))
        .orderBy('dataHora', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) {
      return [];
    }

    final dados = snapshot.docs.first.data();

    final militaresMap = dados['militares'] as List<dynamic>? ?? [];

    return militaresMap.map((item) {
      final map = Map<String, dynamic>.from(item as Map);

      return AnuncioMilitar.fromMap(map);
    }).toList();
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarMaisRecente(
    String idAnuncio,
  ) async {
    final resultados = await firestore
        .collection('anuncioMilitar')
        .where('idAnuncio', isEqualTo: idAnuncio)
        .get();
    List<AnuncioMilitar> listaAnuncioMilitar = [];
    for (final resultado in resultados.docs) {
      listaAnuncioMilitar.add(AnuncioMilitar.fromMap(resultado.data()));
    }
    return listaAnuncioMilitar;
  }

  Future<void> adicionarListaAnuncioMilitarNuvem(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    try {
      final batch = firestore.batch();
      for (final anuncioMilitar in listaAnuncioMilitar) {
        final docRef = firestore.collection('anuncioMilitar').doc();
        batch.set(docRef, anuncioMilitar.toMap());
      }
      await batch.commit();
      print('Sucesso ao adicionar lista de anuncio militar a nuvem');
    } on FirebaseException catch (e) {
      print('Erro ao adicionar lista de anuncio militar a nuvem: ${e.code}');
      // TODO
    }
  }

  ////FUNÇÃO RELACIONADA A VIATURAS
  Future<void> adicionarListaViaturasNoFirestore(
    List<Viatura> listaViaturas,
  ) async {
    try {
      final batch = firestore.batch();

      for (final viatura in listaViaturas) {
        final docRef = firestore.collection('viaturas').doc(viatura.idViatura);

        batch.set(docRef, viatura.toMap());
      }
      await batch.commit();
      print('deu certo');
    } on FirebaseException catch (e) {     
      print('deu erro');
      print(e);
    }
  }

  Future<List<Viatura>> pegarListaViaturasNuvem() async {
    final resultados = await firestore.collection('viaturas').get();
    List<Viatura> listaViaturas = [];
    for (final resultado in resultados.docs) {
      listaViaturas.add(Viatura.fromMap(resultado.data()));
    }
    return listaViaturas;
  }

  //ouvir alterações na lista viaturas do firestore
  Stream<QuerySnapshot<Map<String, dynamic>>> ouvirMudancasViaturaFirestore() {
    return firestore.collection('viaturas').snapshots();
  }

  ////FUNÇÃO RELACIONADA A ANUNCIO DE VIATURAS
  ///
  Future<Anuncio> pegarAnuncioDeViaturaDiarioMaisRecente() async {
    final resultados = await firestore
        .collection('anuncioViaturaDiario')
        .orderBy('dataHora')
        .limit(1)
        .get();
    final listaAnuncio = [];
    for (final resultado in resultados.docs) {
      listaAnuncio.add(Anuncio.fromMap(resultado.data()));
    }
    return listaAnuncio[0];
  }

  //Salvar tabela de anuncios de viatura no Firestore
  Future<bool> adicionarAnuncioViaturaDiarioNoFirestore(
    List<Anuncio> listaAnuncioViatura,
  ) async {
    try {
      final batch = firestore.batch();
      for (final anuncioViatura in listaAnuncioViatura) {
        final docref = firestore
            .collection('anuncioViaturaDiario')
            .doc(anuncioViatura.idAnuncio);
        batch.set(docref, anuncioViatura.toMap());
      }
      await batch.commit();
      print('sincronizou o anuncio de viaturas');
      return true;
    } on FirebaseException catch (e) {
      print('não sincronizou o anuncio de viaturas: $e');
      return false;
      // TODO
    }
  }

  Future<List<Anuncio>> pegarListaAnuncioViauraDiarioMaisRecente() async {
    final resultados = await firestore
        .collection('anuncioViaturaDiario')
        .orderBy('dataHora', descending: true)
        .limit(1)
        .get();
    List<Anuncio> listaAnuncioViaturaDiarioMaisRecente = [];
    for (final resultado in resultados.docs) {
      listaAnuncioViaturaDiarioMaisRecente.add(
        Anuncio.fromMap(resultado.data()),
      );
    }
    return listaAnuncioViaturaDiarioMaisRecente;
  }

  ////FUNÇÃO RELACIONADA A ANUNCIOVIATURA

  Future<List<AnuncioViatura>> pegarListaAnuncioViaturaPorIdAnuncio(
    String idAnuncio,
  ) async {
    final resultados = await firestore
        .collection('anuncioViatura')
        .where('idAnuncio', isEqualTo: idAnuncio)
        .get();
    List<AnuncioViatura> listaAnuncioViatura = [];
    for (final resultado in resultados.docs) {
      listaAnuncioViatura.add(AnuncioViatura.fromMap(resultado.data()));
    }
    return listaAnuncioViatura;
  }

  Future<void> adicionarListaAnuncioViaturas(
    List<AnuncioViatura> listaAnuncioViaturas,
  ) async {
    try {
      final batch = firestore.batch();
      for (final anuncioViatura in listaAnuncioViaturas) {
        final docRef = firestore.collection('anuncioViatura').doc();
        batch.set(docRef, anuncioViatura.toMap());
      }
      await batch.commit();

      print('Sucesso ao adicionar lista de anuncioviatura a nuvem');
    } on FirebaseException catch (e) {
      print('Erro ao adicionar lista de anuncioviatura a nuvem: ${e.code}');
      // TODO
    }
  }

  ////FUNÇÃO RELACIONADA A MILITAR
  Stream<QuerySnapshot<Map<String, dynamic>>> ouvirMudancasMilitarFirestore() {
    return firestore.collection('Militar').snapshots();
  }

  ////FUNÇÕES RELACIONADAS A DEMANDA
  Future<void> adicionarListaDemandaNoFirestore(
    List<Demanda> listaDemandas,
  ) async {
    try {
      final batch = firestore.batch();
      for (final demanda in listaDemandas) {
        final docref = firestore.collection('demanda').doc();
        batch.set(docref, demanda.toMap());
      }
      await batch.commit();
      print('demandas adicionadas ao Firestore');
    } on FirebaseException catch (e) {
      print('erro ao adicionar demandas no firestore: $e');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> ouvirMudancasDemandasFirestore() {
    return FirebaseFirestore.instance.collection('demanda').snapshots();
  }

  //FUNÇÕES RELACIONADAS A OCORRENCIA
  Future<List<Ocorrencia>> pegarListaOcorrenciasFirestore() async {
    try {
      final resultados = await firestore.collection('ocorrencias').get();
      List<Ocorrencia> listaOcorrencia = [];
      for (final resultado in resultados.docs) {
        listaOcorrencia.add(Ocorrencia.fromMap(resultado.data()));
      }
      print('deu certo requisição firebase Ocorrencia');
      return listaOcorrencia;
    } on FirebaseException catch (e) {
      print('Erro ao pegar ocorrencias do Firestorage: $e');
      return [];
      // TODO
    }
  }

  ////FUNÇÃO RELACIONADA A ANUNCIO DE OCORRENCIA DIARIO
  Future<List<Anuncio>> pegarListAnuncioDeOcorrenciaDiarioMaisRecente() async {
    try {
      List<Anuncio> listaAnuncioMaisRecente = [];
      final resultado = await firestore
          .collection('anuncioOcorrenciaDiario')
          .orderBy('dataHora', descending: true)
          .limit(1)
          .get();
      listaAnuncioMaisRecente.add(
        Anuncio.fromMap(resultado.docs.single.data()),
      );
      print(
        'Sucesso ao pegar a lista de anuncio ocorrencia diario mais recente',
      );
      return listaAnuncioMaisRecente;
    } on Exception catch (e) {
      print(
        'Erro ao pegar a lista de anuncio ocorrencia diario mais recente: $e',
      );
      return [];
      // TODO
    }
  }

  Future<void> adicionarListaAnuncioOcorrenciaDiarioNaNuvem(
    List<Anuncio> listaAnuncioOcorrenciaDiario,
  ) async {
    try {
      final batch = firestore.batch();

      for (final anuncioOcorrenciaDao in listaAnuncioOcorrenciaDiario) {
        final docRef = firestore.collection('anuncioOcorrenciaDiario').doc();
        batch.set(docRef, anuncioOcorrenciaDao.toMap());
      }
      await batch.commit();
      print(
        'lista de anuncio ocorrencia diario adicionado com sucesso à nuvem',
      );
    } on FirebaseException catch (e) {
      print(
        'erro ao tentar adicionar lista de anuncio ocorrencia diario a nuvem: ${e.code}',
      );
    } catch (e) {
      print('erro desconhecido $e');
    }
  }

  /////FUNÇÕES RELACIONADAS A ANUNCIOOCORRENCIA
  Stream<QuerySnapshot<Map<String, dynamic>>>
  ouvirMudancasAnuncioOcorrenciaFirestore() {
    final streamAnuncioOcorrencia = firestore
        .collection('anuncioOcorrencia')
        .snapshots();
    return streamAnuncioOcorrencia;
  }

  Future<void> adicionarListaAnuncioOcorrenciaNuvem(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) async {
    final batch = firestore.batch();
    for (final anuncioOcorrencia in listaAnuncioOcorrencia) {
      final docRef = firestore.collection('anuncioOcorrencia').doc();
      batch.set(docRef, anuncioOcorrencia.toMap());
    }
    batch.commit();
  }

  Future<List<AnuncioOcorrencia>> pegarListaAnuncioOcorrenciaPorIdAnuncio(
    String idAnuncio,
  ) async {
    final resultados = await firestore
        .collection('anuncioOcorrencia')
        .where('idAnuncio', isEqualTo: idAnuncio)
        .get();
    List<AnuncioOcorrencia> listaAnuncioOcorrencia = [];
    for (final resultado in resultados.docs) {
      listaAnuncioOcorrencia.add(AnuncioOcorrencia.fromMap(resultado.data()));
    }
    return listaAnuncioOcorrencia;
  }

  ////FUNÇÕES RELACIONADAS A DEMANDA
  Future<void> adicionarListaDemandaNuvem(List<Demanda> listaDemandas) async {
    try {
      final batch = firestore.batch();
      for (final demanda in listaDemandas) {
        final docRef = firestore.collection('demandas').doc(demanda.idDemanda);
        batch.set(docRef, demanda.toMap());
      }
      await batch.commit();
      print('Sucesso ao adicionar Lista demanda na nuvem ');
    } on FirebaseException catch (e) {
      print('Erro ao adicionar Lista demanda na nuvem: ${e.code} ');
      // TODO
    }
  }

  Future<List<Demanda>> pegarListaDemandasVigentes() async {
    final resultados = await firestore
        .collection('demandas')
        .where('dataFimDemanda', isGreaterThanOrEqualTo: DateTime.now())
        .get();
    List<Demanda> listaDemandas = [];
    for (final resultado in resultados.docs) {
      listaDemandas.add(Demanda.fromMap(resultado.data()));
    }
    return listaDemandas;
  }

  ////FUNÇÕES RELACIONADAS A MILITARCURSO
  Future<void> adicionarMilitarCursoNuvem(MilitarCurso militarCurso) async {
    await firestore
        .collection('MilitarCurso')
        .doc('${militarCurso.idCurso}-${militarCurso.idMilitar}')
        .set(militarCurso.toMap());
  }

  Future<void> adicionarListaMilitarCursoNuvem(
    List<MilitarCurso> listaMilitarCurso,
  ) async {
   
      Duration(seconds: 8);
      final batch = firestore.batch();
      for (final militarCurso in listaMilitarCurso) {
        final docRef = firestore
            .collection('militarCurso')
            .doc('${militarCurso.idCurso}-${militarCurso.idMilitar}');
        batch.set(docRef, militarCurso.toMap());
      }
      await batch.commit().timeout(const Duration(seconds: 8));
      
  
    
  }

  Future<List<MilitarCurso>> pegarListaMilitarCursoNuvem() async {
    List<MilitarCurso> listaMilitarCurso = [];
    final resultados = await firestore.collection('militarCurso').get();
    for(final resultado in resultados.docs){
      listaMilitarCurso.add(MilitarCurso.fromMap(resultado.data()));
    }
    return listaMilitarCurso;
  }

  

  ////FUNÇÕES RELACIONADAS A CURSOS
  Future<List<Curso>> pegarListaTodosCursos() async {
    try {
      List<Curso> listaCursos = [];
      final respostas = await firestore.collection('cursos').get();
      for (final resposta in respostas.docs) {
        listaCursos.add(Curso.fromMap(resposta.data()));
      }
      print('firebase curso lista: ${listaCursos.length}');
      print('Sucesso ao pegar cursos');
      return listaCursos;
    } on FirebaseException catch (e) {
      print('Erro ao buscar cursos na nuvem: ${e.code}');
      return [];
      // TODO
    }
  }
}
