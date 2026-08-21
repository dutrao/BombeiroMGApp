import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/demanda.dart';

class DemandaDao {
  final AppDatabase database;

  DemandaDao({required this.database});

  Future<List<Demanda>> pegarListaDemanda() async {
    final listaRow = await (database.select(
      database.demandaTabela,
    )..where((tbl) => tbl.deletado.equals(false))).get();
    List<Demanda> listaDemanda = [];
    for (final row in listaRow) {
      listaDemanda.add(
        Demanda(
          idDemanda: row.idDemanda,
          idMilitarResponsavel: row.idMilitarResponsavel,
          numeroDemanda: row.numeroDemanda,
          nomeDemanda: row.nomeDemanda,
          dataInicioDemanda: row.dataInicioDemanda,
          dataFimDemanda: row.dataFimDemanda,
          urlDemanda: row.urlDemanda,
          deletado: row.deletado,
        ),
      );
    }
    return listaDemanda;
  }

  Future<void> inserirDemandaNoDrift(Demanda demanda) async {
    try {
      await database
          .into(database.demandaTabela)
          .insertOnConflictUpdate(
            DemandaTabelaCompanion.insert(
              idDemanda: demanda.idDemanda,
              idMilitarResponsavel: demanda.idMilitarResponsavel,
              numeroDemanda: demanda.numeroDemanda,
              nomeDemanda: demanda.nomeDemanda,
              dataInicioDemanda: demanda.dataInicioDemanda,
              dataFimDemanda: demanda.dataFimDemanda,
              urlDemanda: demanda.urlDemanda,
              deletado: Value(demanda.deletado),
              sincronizado: Value(demanda.sincronizado),
            ),
          );
      print('01 demanda adicionada ao drift com sucesso');
    } on Exception catch (e) {
      print('erro ao adicionar uma demand ano drift: $e');
    }
  }

  Future<void> adicionarListaDeDemandasLocal(
    List<Demanda> listaDemandas,
  ) async {
    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          database.demandaTabela,
          listaDemandas.map((demanda) {
            return DemandaTabelaCompanion.insert(
              idDemanda: demanda.idDemanda,
              idMilitarResponsavel: demanda.idMilitarResponsavel,
              numeroDemanda: demanda.numeroDemanda,
              nomeDemanda: demanda.nomeDemanda,
              dataInicioDemanda: demanda.dataInicioDemanda,
              dataFimDemanda: demanda.dataFimDemanda,
              urlDemanda: demanda.urlDemanda,
              deletado: Value(demanda.deletado),
              sincronizado: Value(demanda.sincronizado),
            );
          }).toList(),
        );
      });
      print('Lista demanda adicionada com sucesso ao drift');
    } on Exception catch (e) {
      print('erro ao tentar adicionar ao drift: $e');
    }
  }

  List<Demanda> converterListaOcorrenciaParaSincronizado(
    List<Demanda> listaDemandas,
  ) {
    return listaDemandas.map((demanda) {
      return Demanda(
        idDemanda: demanda.idDemanda,
        idMilitarResponsavel: demanda.idMilitarResponsavel,
        numeroDemanda: demanda.numeroDemanda,
        nomeDemanda: demanda.nomeDemanda,
        dataInicioDemanda: demanda.dataInicioDemanda,
        dataFimDemanda: demanda.dataFimDemanda,
        urlDemanda: demanda.urlDemanda,
        deletado: demanda.deletado,
        sincronizado: true,
      );
    }).toList();
  }

  Future<void> sicronizarDemandasNuvemParaLocal(
    List<Demanda> listaDemandas,
  ) async {
    await database.transaction(() async {
      await database.delete(database.demandaTabela).go();
      await adicionarListaDeDemandasLocal(listaDemandas);
    });
  }

  Future<void> atualizarDemandaNoDrift(Demanda demanda) async {
    await (database.update(
      database.demandaTabela,
    )..where((tbl) => tbl.idDemanda.equals(demanda.idDemanda))).write(
      DemandaTabelaCompanion(
        idMilitarResponsavel: Value(demanda.idMilitarResponsavel),
        numeroDemanda: Value(demanda.numeroDemanda),
        nomeDemanda: Value(demanda.nomeDemanda),
        dataInicioDemanda: Value(demanda.dataInicioDemanda),
        dataFimDemanda: Value(demanda.dataFimDemanda),
        urlDemanda: Value(demanda.urlDemanda),
        deletado: Value(demanda.deletado),
        sincronizado: Value(demanda.sincronizado),
      ),
    );
  }

  Future<void> deletarDemandaNoDrift(String idDemanda) async {
    await (database.delete(
      database.demandaTabela,
    )..where((tbl) => tbl.idDemanda.equals(idDemanda))).go();
  }

  Future<List<Demanda>> pegarListaDemandasNaoSincronizadas() async {
    final resultados = await (database.select(
      database.demandaTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).get();
    List<Demanda> listaDemandas = [];
    for (final resultado in resultados) {
      listaDemandas.add(
        Demanda(
          idDemanda: resultado.idDemanda,
          idMilitarResponsavel: resultado.idMilitarResponsavel,
          numeroDemanda: resultado.numeroDemanda,
          nomeDemanda: resultado.nomeDemanda,
          dataInicioDemanda: resultado.dataInicioDemanda,
          dataFimDemanda: resultado.dataFimDemanda,
          urlDemanda: resultado.urlDemanda,
          deletado: resultado.deletado,
        ),
      );
    }
    return listaDemandas;
  }

  Future<void> atualizarTodasDemandasParaSincronizado() async {
    await database
        .update(database.demandaTabela)
        .write(DemandaTabelaCompanion(sincronizado: Value(true)));
  }

  Future<void> deletarDemandaNoDriftLogico(String idDemanda) async {
    await (database.update(
      database.demandaTabela,
    )..where((tbl) => tbl.idDemanda.equals(idDemanda))).write(
      DemandaTabelaCompanion(deletado: Value(true), sincronizado: Value(false)),
    );
  }
}
