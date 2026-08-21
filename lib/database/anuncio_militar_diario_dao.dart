import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio.dart';
import 'package:uuid/uuid.dart';

class AnuncioMilitarDiarioDao {
  final AppDatabase appDatabase;

  AnuncioMilitarDiarioDao({required this.appDatabase});

  Future<void> adicionarAnuncioMilitarDiario({
    required String idMilitarResponsavel,
  }) async {
    String idAnuncioMilitar = const Uuid().v4();
    appDatabase
        .into(appDatabase.anuncioMilitarDiarioTabela)
        .insertOnConflictUpdate(
          AnuncioMilitarDiarioTabelaCompanion.insert(
            idAnuncioMilitar: idAnuncioMilitar,
            dataHora: DateTime.now(),
            idMilitarResponsavel: idMilitarResponsavel,
          ),
        );
  }

  Future<void> adicionarListaAnuncioMilitarNoDrift(
    List<Anuncio> listaAnuncioMilitarDiario,
  ) async {
    appDatabase.batch((batch) {
      batch.insertAllOnConflictUpdate(
        appDatabase.anuncioMilitarDiarioTabela,
        listaAnuncioMilitarDiario.map((anuncioMilitarDiario) {
          return AnuncioMilitarDiarioTabelaCompanion.insert(
            idAnuncioMilitar: anuncioMilitarDiario.idAnuncio,
            dataHora: anuncioMilitarDiario.dataHora,
            idMilitarResponsavel: anuncioMilitarDiario.idMilitarResponsavel,
          );
        }).toList(),
      );
    });
  }

  Future<String> pegarIdAnuncioMilitarMaisRecente() async {
    final resultados = await ((appDatabase.select(
      appDatabase.anuncioMilitarDiarioTabela,
    )..orderBy([(u) => OrderingTerm.desc(u.dataHora)]))..limit(1)).get();
    final listaIdAnuncio = [];
    for (final resultado in resultados){
      listaIdAnuncio.add(resultado.idAnuncioMilitar);
    }
    return listaIdAnuncio[0];
  }

  Future<Anuncio?> pegarUltimoAnuncioFeito() async {
    final row =
        await (appDatabase.select(appDatabase.anuncioMilitarDiarioTabela)
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.dataHora)])
              ..limit(1))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return Anuncio(
      idAnuncio: row.idAnuncioMilitar,
      dataHora: row.dataHora,
      idMilitarResponsavel: row.idMilitarResponsavel,
      sincronizado: row.sincronizado,
    );
  }

  Future<Anuncio?> pegarUltimoAnuncioDoDia(DateTime data) async {
    final inicioDoDia = DateTime(data.year, data.month, data.day);
    final fimDoDia = inicioDoDia.add(const Duration(days: 1));

    final row =
        await (appDatabase.select(appDatabase.anuncioMilitarDiarioTabela)
              ..where(
                (tbl) =>
                    tbl.dataHora.isBiggerOrEqualValue(inicioDoDia) &
                    tbl.dataHora.isSmallerThanValue(fimDoDia),
              )
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.dataHora)])
              ..limit(1))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return Anuncio(
      idAnuncio: row.idAnuncioMilitar,
      dataHora: row.dataHora,
      idMilitarResponsavel: row.idMilitarResponsavel,
      sincronizado: row.sincronizado,
    );
  }

  Future<void> marcarAnuncioComoSincronizado(String idAnuncio) async {
    await (appDatabase.update(
      appDatabase.anuncioMilitarDiarioTabela,
    )..where((tbl) => tbl.idAnuncioMilitar.equals(idAnuncio))).write(
      const AnuncioMilitarDiarioTabelaCompanion(sincronizado: Value(true)),
    );
  }

  Future<List<Anuncio>> pegarAnuncios() async {
    final listaRow = await appDatabase
        .select(appDatabase.anuncioMilitarDiarioTabela)
        .get();

    final listaAnuncios = <Anuncio>[];

    for (final row in listaRow) {
      listaAnuncios.add(
        Anuncio(
          idAnuncio: row.idAnuncioMilitar,
          dataHora: row.dataHora,
          idMilitarResponsavel: row.idMilitarResponsavel,
          sincronizado: row.sincronizado,
        ),
      );
    }

    return listaAnuncios;
  }

  Future<List<Anuncio>>
  pegarListaAnunciosMilitarDiarioNaoSincronizados() async {
    final listaRowNaoSincronizado = await (appDatabase.select(
      appDatabase.anuncioMilitarDiarioTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).get();

    final listaAnuncios = <Anuncio>[];

    for (final row in listaRowNaoSincronizado) {
      listaAnuncios.add(
        Anuncio(
          idAnuncio: row.idAnuncioMilitar,
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
        .into(appDatabase.anuncioMilitarDiarioTabela)
        .insertOnConflictUpdate(
          AnuncioMilitarDiarioTabelaCompanion.insert(
            idAnuncioMilitar: anuncio.idAnuncio,
            dataHora: anuncio.dataHora,
            idMilitarResponsavel: anuncio.idMilitarResponsavel,
            sincronizado: Value(anuncio.sincronizado),
          ),
        );
  }

  Future<List<Anuncio>> converterAnuncioMilitarDiarioParaSincronizado(
    List<Anuncio> listaAnuncioMilitarDiario,
  ) async {
    List<Anuncio> listaConvertida = [];
    for (final anuncio in listaAnuncioMilitarDiario) {
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

  Future<void> atualizarTodosAnuncioMilitarDiarioParaSincronizado() async {
    try {
      await appDatabase
          .update(appDatabase.anuncioMilitarDiarioTabela)
          .write(
            AnuncioMilitarDiarioTabelaCompanion(sincronizado: Value(true)),
          );
      print(
        'Sucesso ao atualizar todos anuncio milita diario para sincronizardo ',
      );
    } on Exception catch (e) {
      print(
        'Erro ao tentar atualizar todos anuncio milita diario para sincronizardo: $e',
      );
      // TODO
    }
  }

  Future<void> substituirListAnuncioMilitarDiarioLocalPorNuvem(
    List<Anuncio> listaAnuncioMilitarDiario,
  ) async {
    try {
      await appDatabase.transaction(() async {
        await appDatabase.delete(appDatabase.anuncioMilitarDiarioTabela).go();
        await adicionarListaAnuncioMilitarNoDrift(listaAnuncioMilitarDiario);
        print('lista anuncio militar diario atualizado com sucesso da nuvem');
      });
    } on Exception catch (e) {
      print('erro ao atualizar lista anuncio militar diario da nuvem: $e');
      // TODO
    }
  }
}
