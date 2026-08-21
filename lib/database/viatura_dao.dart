import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';

import '../model/viatura.dart';

class ViaturaDao {
  final AppDatabase database;

  ViaturaDao({required this.database});

  Future<List<Viatura>> pegarViaturasNoDrift() async {
    try {
      final resultados = await (database.select(database.viaturaTabela)..where((tbl)=> tbl.deletado.equals(false))).get();
      final List<Viatura> listaViaturas = [];
      for (final resultado in resultados) {
        listaViaturas.add(
          Viatura(
            idViatura: resultado.idViatura,
            prefixo: resultado.prefixo,
            tipoViatura: resultado.tipoViatura,
            marca: resultado.marca,
            modelo: resultado.modelo,
            ano: resultado.ano,
            combustivel: resultado.combustivel,
            categoria: resultado.categoria,
            placa: resultado.placa,
            deletado: resultado.deletado,
          ),
        );
      }
      print('Sucesso ao pegar as viaturas');
      return listaViaturas;
    } on Exception catch (e) {
      print('Erro deu certo pegar as viaturas: $e');
      return [];
    }
  }

  Future<void> deletarViaturaNoDriftLogico(String idViatura) async {
    await (database.update(
      database.viaturaTabela,
    )..where((tbl) => tbl.idViatura.equals(idViatura))).write(
      ViaturaTabelaCompanion(deletado: Value(true), sincronizado: Value(false)),
    );
  }

  Future<void> adicionarViaturaNoDrift(Viatura viatura) async {
    try {
      await database
          .into(database.viaturaTabela)
          .insertOnConflictUpdate(
            ViaturaTabelaCompanion.insert(
              idViatura: viatura.idViatura,
              prefixo: viatura.prefixo,
              tipoViatura: viatura.tipoViatura,
              marca: viatura.marca,
              modelo: viatura.modelo,
              ano: viatura.ano,
              combustivel: viatura.combustivel,
              categoria: viatura.categoria,
              sincronizado: Value(viatura.sincronizado),
              placa: viatura.placa,
              deletado: Value(viatura.deletado),
            ),
          );
      print('adicionado ao drift com sucesso');
    } on Exception catch (e) {
      print('erro ao tentar adicionar: $e');
    }
  }

  Future<void> adicionarListaViaturasLocal(List<Viatura> listaViaturas) async {
    try {
      await database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          database.viaturaTabela,
          listaViaturas.map((viatura) {
            return ViaturaTabelaCompanion.insert(
              idViatura: viatura.idViatura,
              prefixo: viatura.prefixo,
              tipoViatura: viatura.tipoViatura,
              marca: viatura.marca,
              modelo: viatura.modelo,
              ano: viatura.ano,
              combustivel: viatura.combustivel,
              categoria: viatura.categoria,
              placa: viatura.placa,
              deletado: Value(viatura.deletado),
            );
          }).toList(),
        );
      });
      print('Sucesso ao adicionar lista viaturas para local');
    } on Exception catch (e) {
      print('Erro ao adicionar lista viaturas para local: $e');
      // TODO
    }
  }

  Future<void> sincronizarViaturaNuvemParaLocal(
    List<Viatura> listaViaturas,
  ) async {
    try {
      await database.transaction(() async {
        await database.delete(database.viaturaTabela).go();
        await adicionarListaViaturasLocal(listaViaturas);
      });
      print('Sucesso ao realizar transação de viatuas local');
    } on Exception catch (e) {
      print('Erro ao realizar transação de viatuas local: $e');
      // TODO
    }
  }

  //Atualizar dados de viatura no Drift
  Future<void> atualizarDadosViaturaNoDrift(Viatura viatura) async {
    try {
      await database.viaturaTabela.insertOnConflictUpdate(
        ViaturaTabelaCompanion(
          idViatura: Value(viatura.idViatura),
          prefixo: Value(viatura.prefixo),
          tipoViatura: Value(viatura.tipoViatura),
          marca: Value(viatura.marca),
          modelo: Value(viatura.modelo),
          ano: Value(viatura.ano),
          combustivel: Value(viatura.combustivel),
          categoria: Value(viatura.categoria),
        ),
      );
      print('atualizado ao drift com sucesso');
    } on Exception catch (e) {
      print('erro ao tentar atualizar: $e');
    }
  }

  //Deletar viatura do drift
  Future<void> deletarViaturaNoDriftFisico(String idViatura) async {
    try {
      await (database.delete(
        database.viaturaTabela,
      )..where((tbl) => tbl.idViatura.equals(idViatura))).go();

      print('Viatura deletada do Drift com sucesso');
    } on Exception catch (e) {
      print('Erro ao tentar deletar viatura do Drift: $e');
    }
  }

  //Buscar todas as viaturas não sincronizadas com o Firestore
  Future<List<Viatura>> buscarViaturasNaoSincronizadas() async {
    final resultado = await database
        .customSelect('SELECT * FROM viatura_tabela WHERE sincronizado = 0')
        .get();
    return resultado.map((row) {
      return Viatura(
        idViatura: row.read<String>('id_viatura'),
        prefixo: row.read<String>('prefixo'),
        tipoViatura: row.read<String>('tipo_viatura'),
        marca: row.read<String>('marca'),
        modelo: row.read<String>('modelo'),
        ano: row.read<String>('ano'),
        combustivel: row.read<String>('combustivel'),
        categoria: row.read<String>('categoria'),
        sincronizado: row.read<bool>('sincronizado'),
        placa: row.read<String>('placa'),
        deletado: row.read<bool>('deletado'),
      );
    }).toList();
  }

  Future<Viatura?> pegarViaturaPorId(String idViatura) async {
    final row = await (database.select(
      database.viaturaTabela,
    )..where((tbl) => tbl.idViatura.equals(idViatura))).getSingleOrNull();

    if (row == null) {
      return null;
    }

    return Viatura(
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
    );
  }
}
