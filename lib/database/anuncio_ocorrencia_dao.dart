import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio_ocorrencia.dart';

class AnuncioOcorrenciaDao {
  final AppDatabase database;

  AnuncioOcorrenciaDao({
    required this.database,
  });

  Future<void> adicionarOuAtualizarAnuncioOcorrencia(
    AnuncioOcorrencia anuncioOcorrencia,
  ) async {
    await database
        .into(database.anuncioOcorrenciaTabela)
        .insertOnConflictUpdate(
          AnuncioOcorrenciaTabelaCompanion.insert(
            idItemAnuncioOcorrencia:
                anuncioOcorrencia.idItemAnuncioOcorrencia,
            idAnuncioOcorrencia: anuncioOcorrencia.idAnuncio,
            idOcorrencia: anuncioOcorrencia.idOcorrencia,
            sincronizado: Value(
              anuncioOcorrencia.sincronizado,
            ),
          ),
        );
  }

  Future<void> adicionarOuAtualizarListaAnuncioOcorrenciaDrift(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.anuncioOcorrenciaTabela,
        listaAnuncioOcorrencia.map((anuncioOcorrencia) {
          return AnuncioOcorrenciaTabelaCompanion.insert(
            idItemAnuncioOcorrencia:
                anuncioOcorrencia.idItemAnuncioOcorrencia,
            idAnuncioOcorrencia: anuncioOcorrencia.idAnuncio,
            idOcorrencia: anuncioOcorrencia.idOcorrencia,
            sincronizado: Value(
              anuncioOcorrencia.sincronizado,
            ),
          );
        }).toList(),
      );
    });
  }

  Future<void> adicionarListaAnuncioOcorrenciaLocal(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.anuncioOcorrenciaTabela,
        listaAnuncioOcorrencia.map((anuncioOcorrencia) {
          return AnuncioOcorrenciaTabelaCompanion.insert(
            idItemAnuncioOcorrencia:
                anuncioOcorrencia.idItemAnuncioOcorrencia,
            idAnuncioOcorrencia: anuncioOcorrencia.idAnuncio,
            idOcorrencia: anuncioOcorrencia.idOcorrencia,
            sincronizado: const Value(true),
          );
        }).toList(),
      );
    });
  }

  Future<void> sincronizarAnuncioOcorrenciaNuvemParaLocal(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) async {
    await database.transaction(() async {
      await database.delete(
        database.anuncioOcorrenciaTabela,
      ).go();

      await adicionarListaAnuncioOcorrenciaLocal(
        listaAnuncioOcorrencia,
      );
    });
  }

  Future<List<AnuncioOcorrenciaTabelaData>>
  pegarListaAnuncioOcorrenciaDataDriftPorIdAnuncio(
    String idAnuncio,
  ) async {
    return await (database.select(
      database.anuncioOcorrenciaTabela,
    )..where(
        (tbl) => tbl.idAnuncioOcorrencia.equals(idAnuncio),
      ))
        .get();
  }

  Future<List<AnuncioOcorrenciaTabelaData>>
  pegarListaAnuncioOcorrenciaDataDrift() async {
    return await database
        .select(database.anuncioOcorrenciaTabela)
        .get();
  }

  Future<List<AnuncioOcorrencia>>
  pegarListaAnuncioOcorrenciaNaoSincronizados() async {
    final resultados = await (
      database.select(database.anuncioOcorrenciaTabela)
        ..where(
          (tbl) => tbl.sincronizado.equals(false),
        )
    ).get();

    final List<AnuncioOcorrencia> listaAnuncioOcorrencia = [];

    for (final resultado in resultados) {
      listaAnuncioOcorrencia.add(
        AnuncioOcorrencia(
          idItemAnuncioOcorrencia:
              resultado.idItemAnuncioOcorrencia,
          idAnuncio:
              resultado.idAnuncioOcorrencia,
          idOcorrencia:
              resultado.idOcorrencia,
          sincronizado:
              resultado.sincronizado,
        ),
      );
    }

    return listaAnuncioOcorrencia;
  }

  List<AnuncioOcorrencia>
  converterListaAnuncioOcorrenciaParaSincronizado(
    List<AnuncioOcorrencia> listaAnuncioOcorrencia,
  ) {
    return listaAnuncioOcorrencia.map(
      (anuncioOcorrencia) {
        return AnuncioOcorrencia(
          idItemAnuncioOcorrencia:
              anuncioOcorrencia.idItemAnuncioOcorrencia,
          idAnuncio:
              anuncioOcorrencia.idAnuncio,
          idOcorrencia:
              anuncioOcorrencia.idOcorrencia,
          sincronizado: true,
        );
      },
    ).toList();
  }

  Future<void>
  atualizarTodosAnuncioOcorrenciaParaSincronizado() async {
    await database
        .update(database.anuncioOcorrenciaTabela)
        .write(
          const AnuncioOcorrenciaTabelaCompanion(
            sincronizado: Value(true),
          ),
        );
  }
}