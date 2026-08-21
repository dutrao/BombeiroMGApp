import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:flutter_application_1/model/anuncio_viatura.dart';

class AnuncioViaturaDiarioDao {
  final AppDatabase appDatabase;

  AnuncioViaturaDiarioDao({required this.appDatabase});

  Future<void> salvarAnuncioComViaturas({
    required Anuncio anuncio,
    required List<AnuncioViatura> listaDestinacaoViaturas,
  }) async {
    await appDatabase.transaction(() async {
      await appDatabase
          .into(appDatabase.anuncioViaturaDiarioTabela)
          .insert(
            AnuncioViaturaDiarioTabelaCompanion.insert(
              idAnuncioViatura: anuncio.idAnuncio,
              dataHora: anuncio.dataHora,
              idMilitarResponsavel: anuncio.idMilitarResponsavel,
            ),
          );

      await appDatabase.batch((batch) {
        batch.insertAll(
          appDatabase.anuncioViaturaTabela,
          listaDestinacaoViaturas.map((viatura) {
            return AnuncioViaturaTabelaCompanion.insert(
              idAnuncio: anuncio.idAnuncio,
              idViatura: viatura.idViatura,
              destinacaoViatura: viatura.destinacaoViatura,
            );
          }).toList(),
        );
      });
    });
  }

  Future<void> adicionarListaAnuncioViaturaDiarioDrift(
    List<Anuncio> listaAnuncios,
  ) async {
    try {
      await appDatabase.batch((batch) {
        batch.insertAllOnConflictUpdate(
        appDatabase.anuncioViaturaDiarioTabela,
          listaAnuncios.map((anuncio) {
            return AnuncioViaturaDiarioTabelaCompanion.insert(
              idAnuncioViatura: anuncio.idAnuncio,
              dataHora: anuncio.dataHora,
              idMilitarResponsavel: anuncio.idMilitarResponsavel,
            );
          }).toList(),
        );
      });
      print('lista anuncio viatura diario adicionado com sucesso ao local');
    } on Exception catch (e) {
      print('erro ao adicionar lista anuncio viatura diario ao local: $e');
      // TODO
    }
  }

  Future<void> sincronizarAnuncioViaturaDiario(
    List<Anuncio> listaAnuncios,
  ) async {
    try {
      await appDatabase.transaction(() async {
        await appDatabase.delete(appDatabase.anuncioViaturaDiarioTabela).go();
        await adicionarListaAnuncioViaturaDiarioDrift(listaAnuncios);
      });
      print('Sucesso ao adicionar lista anuncio viatura diario');
    } on Exception catch (e) {
      print('Erro ao adicionar lista anuncio viatura diario: $e');
      // TODO
    }
  }

  Future<Anuncio?> pegarAnuncioViaturaDiarioMaisRecente() async {
    final row =
        await (appDatabase.select(appDatabase.anuncioViaturaDiarioTabela)
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.dataHora)])
              ..limit(1))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return Anuncio(
      idAnuncio: row.idAnuncioViatura,
      dataHora: row.dataHora,
      idMilitarResponsavel: row.idMilitarResponsavel,
      sincronizado: row.sincronizado,
    );
  }

  Future<Anuncio?> pegarUltimoAnuncioDoDia(DateTime data) async {
    final inicioDoDia = DateTime(data.year, data.month, data.day);
    final fimDoDia = inicioDoDia.add(const Duration(days: 1));

    final row =
        await (appDatabase.select(appDatabase.anuncioViaturaDiarioTabela)
              ..where(
                (tbl) =>
                    tbl.dataHora.isBiggerOrEqualValue(inicioDoDia) &
                    tbl.dataHora.isSmallerThanValue(fimDoDia),
              )
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.dataHora)])
              ..limit(1))
            .getSingleOrNull();

    if (row == null) return null;

    return Anuncio(
      idAnuncio: row.idAnuncioViatura,
      dataHora: row.dataHora,
      idMilitarResponsavel: row.idMilitarResponsavel,
      sincronizado: row.sincronizado,
    );
  }

  Future<void> marcarAnuncioComoSincronizado(String idAnuncio) async {
    await (appDatabase.update(
      appDatabase.anuncioViaturaDiarioTabela,
    )..where((tbl) => tbl.idAnuncioViatura.equals(idAnuncio))).write(
      const AnuncioViaturaDiarioTabelaCompanion(sincronizado: Value(true)),
    );
  }

  Future<List<Anuncio>> pegarAnuncios() async {
    final listaRow = await appDatabase
        .select(appDatabase.anuncioViaturaDiarioTabela)
        .get();
    List<Anuncio> listaAnuncios = [];
    for (final row in listaRow) {
      listaAnuncios.add(
        Anuncio(
          idAnuncio: row.idAnuncioViatura,
          dataHora: row.dataHora,
          idMilitarResponsavel: row.idMilitarResponsavel,
          sincronizado: row.sincronizado,
        ),
      );
    }
    return listaAnuncios;
  }

  Future<List<Anuncio>> pegarAnunciosNaoSincronizados() async {
    final listaRowNaoSincronizado = await (appDatabase.select(
      appDatabase.anuncioViaturaDiarioTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).get();

    final listaAnuncios = <Anuncio>[];

    for (final row in listaRowNaoSincronizado) {
      listaAnuncios.add(
        Anuncio(
          idAnuncio: row.idAnuncioViatura,
          dataHora: row.dataHora,
          idMilitarResponsavel: row.idMilitarResponsavel,
          sincronizado: row.sincronizado,
        ),
      );
    }

    return listaAnuncios;
  }

  Future<void> inserirOuAtualizarDadosDrift(Anuncio anuncio) async {
    await appDatabase
        .into(appDatabase.anuncioViaturaDiarioTabela)
        .insertOnConflictUpdate(
          AnuncioViaturaDiarioTabelaCompanion.insert(
            idAnuncioViatura: anuncio.idAnuncio,
            dataHora: anuncio.dataHora,
            idMilitarResponsavel: anuncio.idMilitarResponsavel,
            sincronizado: Value(anuncio.sincronizado),
          ),
        );
  }

  Future<List<Anuncio>> converterListaAnuncioViaturaDiarioParaSincronizado(
    List<Anuncio> listaAnuncio,
  ) async {
    List<Anuncio> listaConvertida = [];
    for (final anuncio in listaAnuncio) {
      final anuncioSincronizado = Anuncio(
        idAnuncio: anuncio.idAnuncio,
        dataHora: anuncio.dataHora,
        idMilitarResponsavel: anuncio.idMilitarResponsavel,
        sincronizado: true,
      );
      listaConvertida.add(anuncioSincronizado);
    }
    return listaConvertida;
  }

  Future<void> atualizarTodosAnuncioViaturaDiarioParaSincronizado() async {
    appDatabase
        .update(appDatabase.anuncioViaturaDiarioTabela)
        .write(AnuncioViaturaDiarioTabelaCompanion(sincronizado: Value(true)));
  }
}
