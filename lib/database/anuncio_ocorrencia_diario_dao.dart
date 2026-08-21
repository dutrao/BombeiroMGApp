import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:uuid/uuid.dart';

class AnuncioOcorrenciaDiarioDao {
  final AppDatabase database;

  AnuncioOcorrenciaDiarioDao({required this.database});

  Future<void> adicionarAnuncioOcorrencia(
    String idMilitarResponsavel,
    List<Ocorrencia> listaOcorrencia,
  ) async {
    await database.transaction(() async {
      final String uuidAnuncio = const Uuid().v4();
      await database
          .into(database.anuncioOcorrenciaDiarioTabela)
          .insertOnConflictUpdate(
            AnuncioOcorrenciaDiarioTabelaCompanion.insert(
              idAnuncioOcorrencia: uuidAnuncio,
              dataHora: DateTime.now(),
              idMilitarResponsavel: idMilitarResponsavel,
            ),
          );
      await database.batch((batch) {
        batch.insertAll(
          database.anuncioOcorrenciaTabela,
          listaOcorrencia.map((ocorrencia) {
            return AnuncioOcorrenciaTabelaCompanion.insert(
              idItemAnuncioOcorrencia: const Uuid().v4(),
              idAnuncioOcorrencia: uuidAnuncio,
              idOcorrencia: ocorrencia.codigo,
            );
          }).toList(),
        );
      });
    });
  }

  Future<void> adicionarListaAnuncioOcorrenciaDiarioLocal(
    List<Anuncio> listaAnuncioOcorrenciaDiario,
  ) async {
    try {
      database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          database.anuncioOcorrenciaDiarioTabela,
          listaAnuncioOcorrenciaDiario.map((anuncio) {
            return AnuncioOcorrenciaDiarioTabelaCompanion.insert(
              idAnuncioOcorrencia: anuncio.idAnuncio,
              dataHora: anuncio.dataHora,
              idMilitarResponsavel: anuncio.idMilitarResponsavel,
              sincronizado: Value(true),
            );
          }).toList(),
        );
      });
      print('Sucesso ao adicionar lista anuncio ocorrencia diario ao drift');
    } on Exception catch (e) {
      print(
        'Sucesso ao adicionar lista anuncio ocorrencia diario ao drift: $e',
      );
      // TODO
    }
  }

  Future<void> sincronizarListaAnuncioOcorrenciasDiario(
    List<Anuncio> listaAnuncioOcorrenciaDiario,
  ) async {
    await database.transaction(() async {
      await database.anuncioOcorrenciaDiarioTabela.delete().go();

      await adicionarListaAnuncioOcorrenciaDiarioLocal(
        listaAnuncioOcorrenciaDiario,
      );
    });
  }

  Future<List<Anuncio>>
  pegarListaAnuncioOcorrenciaDiarioNaoSincronizados() async {
    try {
      final resultados = await (database.select(
        database.anuncioOcorrenciaDiarioTabela,
      )..where((tbl) => tbl.sincronizado.equals(false))).get();
      List<Anuncio> listaAnuncioOcorrenciaDiarioNaoSincronizado = [];
      for (final resultado in resultados) {
        final anuncio = Anuncio(
          idAnuncio: resultado.idAnuncioOcorrencia,
          dataHora: resultado.dataHora,
          idMilitarResponsavel: resultado.idMilitarResponsavel,
        );
        listaAnuncioOcorrenciaDiarioNaoSincronizado.add(anuncio);
      }
      print(
        'Sucesso ao pegar todos os anuncio ocorrencia diario não sincronizados',
      );
      return listaAnuncioOcorrenciaDiarioNaoSincronizado;
    } on Exception catch (e) {
      print(
        'erro ao tentar pegar lista de anuncio ocorrencia diario não sincronizados: $e',
      );
      return [];
      // TODO
    }
  }

  Future<void> atualizarTodosAnuncioOcorrenciaDiarioParaSincronizado() async {
    try {
      await database
          .update(database.anuncioOcorrenciaDiarioTabela)
          .write(
            AnuncioOcorrenciaDiarioTabelaCompanion(sincronizado: Value(true)),
          );
      print(
        'sucesso ao atualizar todos anuncio ocorrencia diario para sincronizado',
      );
    } on Exception catch (e) {
      print(
        'Erro ao atualizar todos anuncio ocorrencia diario para sincronizado: $e',
      );
      // TODO
    }
  }

  Future<List<Anuncio>> converterAnuncioOcorrenciaDiarioParaSincronizado(
    List<Anuncio> listaAnuncio,
  ) async {
    return listaAnuncio.map((anuncio) {
      return Anuncio(
        idAnuncio: anuncio.idAnuncio,
        dataHora: anuncio.dataHora,
        idMilitarResponsavel: anuncio.idMilitarResponsavel,
        sincronizado: true,
      );
    }).toList();
  }

  Future<Anuncio?> pegarUltimoAnuncioDeOcorrenciaFeito() async {
    final resultado =
        await ((database.select(database.anuncioOcorrenciaDiarioTabela)
                ..orderBy([(coluna) => OrderingTerm.desc(coluna.dataHora)]))
              ..limit(1))
            .getSingleOrNull();
    if (resultado != null) {
      return Anuncio(
        idAnuncio: resultado.idAnuncioOcorrencia,
        dataHora: resultado.dataHora,
        idMilitarResponsavel: resultado.idMilitarResponsavel,
      );
    } else {
      return null;
    }
  }
}
