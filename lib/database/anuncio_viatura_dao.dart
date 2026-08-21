import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';
import 'package:flutter_application_1/model/destinacao_viatura.dart';

class AnuncioViaturaDao {
  final AppDatabase database;

  AnuncioViaturaDao({required this.database});

  void adicionarAnuncioViatura(
    DestinacaoViatura destinacaoViatura,
    String idAnuncio,
  ) {
    database
        .into(database.anuncioViaturaTabela)
        .insertOnConflictUpdate(
          AnuncioViaturaTabelaCompanion.insert(
            idViatura: destinacaoViatura.viatura.idViatura,
            idAnuncio: idAnuncio,
            destinacaoViatura: destinacaoViatura.destinacaoViatura,
          ),
        );
  }

  Future<void> adicionarListaAnuncioViaturaAoDrift(
    List<AnuncioViatura> listaAnuncioViatura,
  ) async {
    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          database.anuncioViaturaTabela,
          listaAnuncioViatura.map((anuncioViatura) {
            return AnuncioViaturaTabelaCompanion.insert(
              idViatura: anuncioViatura.idViatura,
              idAnuncio: anuncioViatura.idAnuncio,
              destinacaoViatura: anuncioViatura.destinacaoViatura,
            );
          }).toList(),
        );
      });
      print('Sucesso ao adicionar lista anuncioViatura no local');
    } on Exception catch (e) {
      print('Erro ao adicionar lista anuncioViatura no local: $e');
      // TODO
    }
  }

  Future<void> sincronizarAnuncioViaturaNuvemParaLocal(
    List<AnuncioViatura> listaAnuncioViatura,
  ) async {
    try {
      await database.transaction(() async {
        await database.delete(database.anuncioViaturaTabela).go();

        await adicionarListaAnuncioViaturaAoDrift(listaAnuncioViatura);
        print('Sucesso ao sincronizar anuncioViatura nuvem com local');
      });
    } on Exception catch (e) {
      print('Erro ao sincronizar anuncioViatura nuvem com local: $e');
      // TODO
    }
  }

  Future<List<AnuncioViatura>> pegarListaAnuncioViatura() async {
    final listaRow = await database
        .customSelect('SELECT * FROM anuncio_viatura_tabela')
        .get();
    List<AnuncioViatura> listaAnuncioVitura = [];
    for (final row in listaRow) {
      listaAnuncioVitura.add(AnuncioViatura.fromMap(row.data));
    }
    return listaAnuncioVitura;
  }

  List<AnuncioViatura> convertListaAnuncioViaturaParaSincronizado(
    List<AnuncioViatura> listaAnuncioViatura,
  ) {
    return listaAnuncioViatura.map((anuncioViatura) {
      return AnuncioViatura(
        idAnuncio: anuncioViatura.idAnuncio,
        idViatura: anuncioViatura.idViatura,
        destinacaoViatura: anuncioViatura.destinacaoViatura,
        sincronizado: true,
      );
    }).toList();
  }

  Future<List<AnuncioViatura>> pegarListaAnuncioViaturaPorIdAnuncio(
    String idAnuncio,
  ) async {
    final listaRow = await (database.select(
      database.anuncioViaturaTabela,
    )..where((tbl) => tbl.idAnuncio.equals(idAnuncio))).get();

    final listaAnuncioViatura = <AnuncioViatura>[];

    for (final row in listaRow) {
      listaAnuncioViatura.add(
        AnuncioViatura(
          idAnuncio: row.idAnuncio,
          idViatura: row.idViatura,
          destinacaoViatura: row.destinacaoViatura,
          sincronizado: row.sincronizado,
        ),
      );
    }

    return listaAnuncioViatura;
  }

  Future<List<AnuncioViatura>> pegarListaAnuncioViaturaNaoSincronizado() async {
    final resultados = await (database.select(
      database.anuncioViaturaTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).get();
    List<AnuncioViatura> listaAnuncioViatura = [];
    for (final resultado in resultados) {
      listaAnuncioViatura.add(
        AnuncioViatura(
          idAnuncio: resultado.idAnuncio,
          idViatura: resultado.idViatura,
          destinacaoViatura: resultado.destinacaoViatura,
          sincronizado: resultado.sincronizado,
        ),
      );
    }
    return listaAnuncioViatura;
  }

  Future<void> atualizarTodosAnuncioViaturaParaSincronizado()async{
   await database.update(database.anuncioViaturaTabela).write(AnuncioViaturaTabelaCompanion(sincronizado: Value(true)));
  }
}
