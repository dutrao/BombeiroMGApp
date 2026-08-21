import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/curso.dart';

class CursoDao {
  final AppDatabase database;

  CursoDao({required this.database});

  Future<void> adicionarCurso(Curso curso) async {
    await database
        .into(database.cursoTabela)
        .insertOnConflictUpdate(
          CursoTabelaCompanion.insert(
            idCurso: curso.idCurso,
            nomeCurso: curso.nomeCurso,
          ),
        );
  }

  Future<void> adicionarListaDeCursos(List<Curso> listaCursos) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.cursoTabela,
        listaCursos.map((curso) {
          return CursoTabelaCompanion.insert(
            idCurso: curso.idCurso,
            nomeCurso: curso.nomeCurso,
          );
        }),
      );
    });
  }

  Future<void> atualizarTodosCursosSincronizado() async {
    await database
        .update(database.cursoTabela)
        .write(CursoTabelaCompanion(sincronizado: Value(true)));
  }

  Future<void> limparDadosTabelaCursos() async {
   await database.delete(database.cursoTabela).go();
  }

  Future<void> sincronizarCursoNuvemParaLocal(List<Curso> listaCursos) async {
    await database.transaction(() async {
     await limparDadosTabelaCursos();

      await adicionarListaDeCursos(listaCursos);
    });
  }

  Future<List<Curso>> pegarListaCursos() async {
    List<Curso> listaCursos = [];
    final resultados = await database.select(database.cursoTabela).get();
    for (final resultado in resultados) {
      listaCursos.add(
        Curso(idCurso: resultado.idCurso, nomeCurso: resultado.nomeCurso),
      );
    }
    return listaCursos;
  }

 
}
