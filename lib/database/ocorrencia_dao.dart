import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';

class OcorrenciaDao {
  final AppDatabase database;

  OcorrenciaDao({required this.database});

  Future<void> adicionarOuAtualizarDrift(Ocorrencia ocorrencia) async {
    await database
        .into(database.ocorrenciaTabela)
        .insertOnConflictUpdate(
          OcorrenciaTabelaCompanion.insert(
            idOcorrencia: ocorrencia.idOcorrencia,
            codigoOcorrencia: ocorrencia.codigo,
            nomeOcorrencia: ocorrencia.nomeOcorrencia,
            tipoOcorrencia: ocorrencia.tipo,
            iapr: ocorrencia.iapr,
            irrd: ocorrencia.irrd,
          ),
        );
  }

  Future<void> adicionarOuAtualizarListaDrift(
    List<Ocorrencia> listaOcorrencia,
  ) async {
    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          database.ocorrenciaTabela,
          listaOcorrencia.map((ocorrencia) {
            return OcorrenciaTabelaCompanion.insert(
              idOcorrencia: ocorrencia.idOcorrencia,
              codigoOcorrencia: ocorrencia.codigo,
              nomeOcorrencia: ocorrencia.nomeOcorrencia,
              tipoOcorrencia: ocorrencia.tipo,
              iapr: ocorrencia.iapr,
              irrd: ocorrencia.irrd,
            );
          }).toList(),
        );
      });
      print('lista de ocorrencia adicionada com sucesso ao drift');
    } on Exception catch (e) {
      print('erro ao adicionar lista de ocorrencia ao drift: $e');
      // TODO
    }
  }

  Future<void> removerOcorrencia(String idOcorrencia) async {
    await database.ocorrenciaTabela.deleteWhere(
      (tbl) => tbl.idOcorrencia.equals(idOcorrencia),
    );
  }

  Future<Ocorrencia> pegarOcorrenciaPorCodigo(String codigo) async {
    final resultados = await (database.select(
      database.ocorrenciaTabela,
    )..where((tbl) => tbl.codigoOcorrencia.equals(codigo))).get();
    List<Ocorrencia> listaOcorrencia = [];
    for (final resultado in resultados) {
      listaOcorrencia.add(Ocorrencia(
        idOcorrencia: resultado.idOcorrencia,
        codigo: resultado.codigoOcorrencia,
        nomeOcorrencia: resultado.nomeOcorrencia,
        tipo: resultado.tipoOcorrencia,
        iapr: resultado.iapr,
        irrd: resultado.irrd,
        sincronizacao: resultado.sincronizado,
      ) );      
    }
    return listaOcorrencia[0];
  }

   Future<Ocorrencia> pegarOcorrenciaPorId(String idOcorrencia) async {   
    final resultados = await (database.select(
      database.ocorrenciaTabela,
    )..where((tbl) => tbl.codigoOcorrencia.equals(idOcorrencia))).get();
    List<Ocorrencia> listaOcorrencia = [];
    for (final resultado in resultados) {
      listaOcorrencia.add(Ocorrencia(
        idOcorrencia: resultado.idOcorrencia,
        codigo: resultado.codigoOcorrencia,
        nomeOcorrencia: resultado.nomeOcorrencia,
        tipo: resultado.tipoOcorrencia,
        iapr: resultado.iapr,
        irrd: resultado.irrd,
        sincronizacao: resultado.sincronizado,
      ) );      
    }
    return listaOcorrencia[0];
  }


  Future<List<Ocorrencia>> pegarListaOcorrenciasDrift() async {
    final resultados = await database.ocorrenciaTabela.select().get();
    List<Ocorrencia> listaOcorrencia = [];
    for (final resultado in resultados) {
      final ocorrencia = Ocorrencia(
        idOcorrencia: resultado.idOcorrencia,
        codigo: resultado.codigoOcorrencia,
        nomeOcorrencia: resultado.nomeOcorrencia,
        tipo: resultado.tipoOcorrencia,
        iapr: resultado.iapr,
        irrd: resultado.irrd,
        sincronizacao: resultado.sincronizado,
      );

      listaOcorrencia.add(ocorrencia);
    }
    return listaOcorrencia;
  }
}
