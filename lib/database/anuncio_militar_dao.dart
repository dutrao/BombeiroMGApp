import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';

class AnuncioMilitarDao {
  final AppDatabase appDatabase;

  AnuncioMilitarDao({required this.appDatabase});

  Future<void> adicionarAnuncioMilitar(AnuncioMilitar anuncioMilitar) async {
    await appDatabase
        .into(appDatabase.anuncioMilitarTabela)
        .insert(
          AnuncioMilitarTabelaCompanion.insert(
            idAnuncio: anuncioMilitar.idAnuncio,
            idMilitar: anuncioMilitar.idMilitar,
            destinacaoMilitar: anuncioMilitar.destinacaoMilitar,
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> adicionarListaAnuncioMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    try {
      appDatabase.batch((batch) {
        batch.insertAll(
          appDatabase.anuncioMilitarTabela,
          listaAnuncioMilitar.map((anuncioMilitar) {
            return AnuncioMilitarTabelaCompanion.insert(
              idMilitar: anuncioMilitar.idMilitar,
              idAnuncio: anuncioMilitar.idAnuncio,
              destinacaoMilitar: anuncioMilitar.destinacaoMilitar,
            );
          }).toList(),
        );
      });
      print('Sucesso ao adicionar lista anuncioMilitar');
    } on Exception {
      print('Erro ao adicionar lista anuncioMilitar');
      // TODO
    }
  }

  Future<void> sincronizarAnuncioMilitarNuvemParaLocal(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    try {
      await appDatabase.transaction(() async {
        await appDatabase.anuncioMilitarTabela.delete().go();

        await adicionarListaAnuncioMilitar(listaAnuncioMilitar);
      });
      print('Sucesso ao adicionar lista Anuncio Militar ao local');
    } on Exception {
      print('Erro ao adicionar lista Anuncio Militar ao local');

      // TODO
    }
  }

  List<AnuncioMilitar> converterListaAnuncioMilitarParaSincronizado(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) {
    return listaAnuncioMilitar.map((anuncioMilitar) {
      return AnuncioMilitar(
        idMilitar: anuncioMilitar.idMilitar,
        idAnuncio: anuncioMilitar.idAnuncio,
        destinacaoMilitar: anuncioMilitar.destinacaoMilitar,
        sincronizado: true,
      );
    }).toList();
  }

  Future<void> atualizarTodosAnuncioMilitarLocalParaSincronizado() async {
    await appDatabase
        .update(appDatabase.anuncioMilitarTabela)
        .write(AnuncioMilitarTabelaCompanion(sincronizado: Value(true)));
  }

  Future<void> removerAnuncioMilitar(AnuncioMilitar anuncioMilitar) async {
    await (appDatabase.delete(appDatabase.anuncioMilitarTabela)..where(
          (tbl) => Expression.and([
            tbl.idAnuncio.equals(anuncioMilitar.idAnuncio),
            tbl.idMilitar.equals(anuncioMilitar.idMilitar),
          ]),
        ))
        .go();
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarLocal() async {
    final rows = await appDatabase
        .select(appDatabase.anuncioMilitarTabela)
        .get();

    return rows.map((row) {
      return AnuncioMilitar(
        idAnuncio: row.idAnuncio,
        idMilitar: row.idMilitar,
        destinacaoMilitar: row.destinacaoMilitar,
        sincronizado: row.sincronizado,
      );
    }).toList();
  }

  Future<List<AnuncioMilitar>> pegarListaAnuncioMilitarNaoSincronizado() async {
    try {
      final resultados = await (appDatabase.select(
        appDatabase.anuncioMilitarTabela,
      )..where((tbl) => tbl.sincronizado.equals(false))).get();
      final List<AnuncioMilitar> listaNaoSincronizada = [];
      for (final resultado in resultados) {
        listaNaoSincronizada.add(
          AnuncioMilitar(
            idMilitar: resultado.idMilitar,
            idAnuncio: resultado.idAnuncio,
            destinacaoMilitar: resultado.destinacaoMilitar,
          ),
        );
      }
      print('Sucesso  pegar lista de anuncioMilitar não sincronizado');
      return listaNaoSincronizada;
    } on Exception catch (e) {
      print('Erro ao  pegar lista de anuncioMilitar não sincronizado: $e');
      return [];
      // TODO
    }
  }

  Future<void> atualizartodosAnuncioMilitarParaSincronizado() async {
    await appDatabase
        .update(appDatabase.anuncioMilitarTabela)
        .write(AnuncioMilitarTabelaCompanion(sincronizado: Value(true)));
  }

  Future<void> adicionarListaAnuncioMilitarNoDrift(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    final companions = listaAnuncioMilitar.map((anuncio) {
      return AnuncioMilitarTabelaCompanion.insert(
        idAnuncio: anuncio.idAnuncio,
        idMilitar: anuncio.idMilitar,
        destinacaoMilitar: anuncio.destinacaoMilitar,
      );
    }).toList();

    await appDatabase.batch((batch) {
      batch.insertAll(
        appDatabase.anuncioMilitarTabela,
        companions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<AnuncioMilitar>> pegarMilitaresPorAnuncioId(
    String idAnuncio,
  ) async {
    final rows = await (appDatabase.select(
      appDatabase.anuncioMilitarTabela,
    )..where((tbl) => tbl.idAnuncio.equals(idAnuncio))).get();

    return rows.map((row) {
      return AnuncioMilitar(
        idAnuncio: row.idAnuncio,
        idMilitar: row.idMilitar,
        destinacaoMilitar: row.destinacaoMilitar,
        sincronizado: row.sincronizado,
      );
    }).toList();
  }
}
