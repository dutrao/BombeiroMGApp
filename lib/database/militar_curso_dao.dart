import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/militar_curso.dart';

class MilitarCursoDao {
  final AppDatabase database;

  MilitarCursoDao({required this.database});

  Future<void> adicionarMilitarCurso(MilitarCurso militarCurso) async {
    await database
        .into(database.militarCursoTabela)
        .insertOnConflictUpdate(
          MilitarCursoTabelaCompanion.insert(
            idCurso: militarCurso.idCurso,
            idMilitar: militarCurso.idMilitar,
            deletado: Value(militarCurso.deletado),
            sincronizado: Value(militarCurso.sincronizado),
          ),
        );
  }

  Future<void> adicionarListaDeMilitarCurso(
    List<MilitarCurso> listaMilitarCurso,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.militarCursoTabela,
        listaMilitarCurso.map((militarCurso) {
          return MilitarCursoTabelaCompanion.insert(
            idCurso: militarCurso.idCurso,
            idMilitar: militarCurso.idMilitar,
          );
        }),
      );
    });
  }

  Future<List<MilitarCurso>> pegarListaMilitarCursoNaoSincronizados() async {
    List<MilitarCurso> listaNaoSincronizado = [];
    final respostas =
        await (database.select(database.militarCursoTabela)..where((tbl) {
              return tbl.sincronizado.equals(false);
            }))
            .get();
    for (final resposta in respostas) {
      listaNaoSincronizado.add(
        MilitarCurso(
          idCurso: resposta.idCurso,
          idMilitar: resposta.idMilitar,
          deletado: resposta.deletado,
          sincronizado: resposta.sincronizado,
        ),
      );
    }
    return listaNaoSincronizado;
  }

  List<MilitarCurso> converterListaMilitarCursoSincronizado(
    List<MilitarCurso> listaMilitarCurso,
  ) {
    return listaMilitarCurso.map((militarCurso) {
      return MilitarCurso(
        idCurso: militarCurso.idCurso,
        idMilitar: militarCurso.idMilitar,
        deletado: militarCurso.deletado,
        sincronizado: true,
      );
    }).toList();
  }

  Future<List<String>> pegarListaIdCursoPorIdMilitar(String idMilitar) async {
    List<String> listaIdCursoPorIdMilitar = [];
    final resultados =
        await (database.select(database.militarCursoTabela)..where((tbl) {
              return tbl.idMilitar.equals(idMilitar);
            }))
            .get();
    for (final resultado in resultados) {
      listaIdCursoPorIdMilitar.add(resultado.idCurso);
    }
    return listaIdCursoPorIdMilitar;
  }

  Future<List<String>> pegarListaNomeCursoPorIdMilitar(String idMilitar) async {
    List<String> listaCursoPorIdMilitar = [];
    final resultados =
        await (database.select(database.militarCursoTabela)..where((tbl) {
              return tbl.idMilitar.equals(idMilitar) &
                  tbl.deletado.equals(false);
            }))
            .join([
              leftOuterJoin(
                database.cursoTabela,
                database.cursoTabela.idCurso.equalsExp(
                  database.militarCursoTabela.idCurso,
                ),
              ),
            ])
            .get();

    for (final linha in resultados) {
      final curso = linha.readTableOrNull(database.cursoTabela);
      if (curso != null) {
        listaCursoPorIdMilitar.add(curso.nomeCurso);
      }
    }
    return listaCursoPorIdMilitar;
  }

  Future<List<String>> pegarListaMilitarCurso() async {
    List<String> listaCursoPorIdMilitar = [];
    final resultados = await database.select(database.militarCursoTabela).get();

    for (final resultado in resultados) {
      listaCursoPorIdMilitar.add(resultado.idCurso);
    }

    print(listaCursoPorIdMilitar.length);
    return listaCursoPorIdMilitar;
  }

  Future<void> atualizarTodosMilitarCursosSincronizado() async {
    await database
        .update(database.militarCursoTabela)
        .write(MilitarCursoTabelaCompanion(sincronizado: Value(true)));
  }

  Future<void> atualizarTodosMilitarCursosNaoSincronizado() async {
    await database
        .update(database.militarCursoTabela)
        .write(MilitarCursoTabelaCompanion(sincronizado: Value(false)));
  }

  void limparDadosTabelaMilitarCurso() {
    database.delete(database.militarCursoTabela).go();
  }

  Future<void> removerMilitarCurso(MilitarCurso militarCurso) async {
    await (database.update(database.militarCursoTabela)..where(
          (tbl) =>
              tbl.idMilitar.equals(militarCurso.idMilitar) &
              tbl.idCurso.equals(militarCurso.idCurso),
        ))
        .write(
          MilitarCursoTabelaCompanion(
            deletado: const Value(true),
            sincronizado: const Value(false),
          ),
        );
  }

  Future<List<Militar>> buscarMilitaresPorListaCurso(
  List<String> listaNomeCursos,
) async {
  final query = database.select(database.militarTabela).join([
    innerJoin(
      database.militarCursoTabela,
      database.militarCursoTabela.idMilitar
          .equalsExp(database.militarTabela.idMilitar),
    ),
    innerJoin(
      database.cursoTabela,
      database.cursoTabela.idCurso
          .equalsExp(database.militarCursoTabela.idCurso),
    ),
  ]);

  query.where(
    database.cursoTabela.nomeCurso.isIn(listaNomeCursos),
  );

  final resultado = await query.get();

  final militares = resultado.map((row) {
    final militarData = row.readTable(database.militarTabela);

    return Militar(
      idMilitar: militarData.idMilitar,
      cpf: militarData.cpf,
      numeroBM: militarData.numeroBM,
      nomeCompleto: militarData.nomeCompleto,
      nomeDeGuerra: militarData.nomeDeGuerra,
      cargo: militarData.cargo,
      credencialMotorista: militarData.credencialMotorista,
      dataNascimento: militarData.dataNascimento,
      estadoCivil: militarData.estadoCivil,
      unidadeAtual: militarData.unidadeAtual,
      rua: militarData.rua,
      bairro: militarData.bairro,
      cidade: militarData.cidade,
      numeroResidencia: militarData.numero,
      cep: militarData.cep,
      telefone: militarData.telefone,
      email: militarData.email,
      numeroConta: militarData.numeroConta,
      banco: militarData.banco,
      numeroAg: militarData.numeroAg,
      quantidadeAdi: militarData.quantidadeAdi,
      naturalidade: militarData.naturalidade,
      urlImagem: militarData.urlImagem,
      funcao: militarData.funcao,
      obs: militarData.obs,
      sincronizado: militarData.sincronizado,
      complementoEndereco: militarData.complementoEndereco,
    );
  }).toList();

  final militaresSemDuplicados = {
    for (final militar in militares)
      militar.idMilitar: militar,
  }.values.toList();

  return militaresSemDuplicados;
}

  Future<void> sincronizarMilitarCursoNuvemParaLocal(
    List<MilitarCurso> listaMilitarCurso,
  ) async {
    await database.transaction(() async {
      await database.delete(database.militarCursoTabela).go();

      await adicionarListaDeMilitarCurso(listaMilitarCurso);
    });
  }
}
