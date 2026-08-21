import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/anuncio_militar.dart';
import 'package:flutter_application_1/model/militar.dart';

class MilitarDao {
  final AppDatabase database;

  MilitarDao({required this.database});

  Future<void> debugMilitares() async {
    final militares = await database.select(database.militarTabela).get();

    print('TOTAL: ${militares.length}');

    for (final militar in militares) {
      print('${militar.numeroBM} - ${militar.sincronizado}');
    }
  }

  Future<Militar?> buscarMilitarPorIdNoDrift(String idMilitar) async {
    final resultado = await (database.select(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.equals(idMilitar))).getSingleOrNull();

    if (resultado == null) return null;

    return Militar.fromDrift(resultado);
  }

  Future<void> adicionarMilitarNoDrift(Militar militar) async {
    try {
      await database
          .into(database.militarTabela)
          .insertOnConflictUpdate(
            MilitarTabelaCompanion.insert(
              idMilitar: militar.idMilitar,
              cpf: militar.cpf,
              numeroBM: militar.numeroBM,
              nomeCompleto: militar.nomeCompleto,
              nomeDeGuerra: militar.nomeDeGuerra,
              cargo: militar.cargo,
              credencialMotorista: militar.credencialMotorista,
              dataNascimento: militar.dataNascimento,
              estadoCivil: militar.estadoCivil,
              unidadeAtual: militar.unidadeAtual,
              rua: militar.rua,
              bairro: militar.bairro,
              cidade: militar.cidade,
              numero: militar.numeroResidencia,
              cep: militar.cep,
              telefone: militar.telefone,
              email: militar.email,
              naturalidade: militar.naturalidade,
              urlImagem: militar.urlImagem,
              funcao: militar.funcao,
              obs: militar.obs,
              complementoEndereco: militar.complementoEndereco,
              numeroConta: militar.numeroConta,
              banco: militar.banco,
              numeroAg: militar.numeroAg,
              quantidadeAdi: militar.quantidadeAdi,
            ),            
          );
      print('Militar adicionado com sucesso');
    } catch (e) {
      print('Erro ao adicionar militar: $e');
    }
  }

  Future<void> atualizarDadosMilitarNoDrift(Militar militar) async {
    await (database.update(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.equals(militar.idMilitar))).write(
      MilitarTabelaCompanion(
        cpf: Value(militar.cpf),
        numeroBM: Value(militar.numeroBM),
        nomeCompleto: Value(militar.nomeCompleto),
        nomeDeGuerra: Value(militar.nomeDeGuerra),
        cargo: Value(militar.cargo),
        credencialMotorista: Value(militar.credencialMotorista),
        dataNascimento: Value(militar.dataNascimento),
        estadoCivil: Value(militar.estadoCivil),
        unidadeAtual: Value(militar.unidadeAtual),
        rua: Value(militar.rua),
        bairro: Value(militar.bairro),
        cidade: Value(militar.cidade),
        numero: Value(militar.numeroResidencia),
        cep: Value(militar.cep),
        telefone: Value(militar.telefone),
        email: Value(militar.email),
        naturalidade: Value(militar.naturalidade),
        urlImagem: Value(militar.urlImagem),
        funcao: Value(militar.funcao),
        obs: Value(militar.obs),
        sincronizado: const Value(true),
      ),
    );
  }

  Future<void> deletarMilitarNoDrift(String idMilitar) async {
    await (database.delete(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.equals(idMilitar))).go();
  }

  Future<Militar?> pegarDadosUsuario(String idMilitar) async {
    final result = await (database.select(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.equals(idMilitar))).getSingleOrNull();

    if (result == null) return null;

    return Militar.fromDrift(result);
  }

  Future<void> atualizarCampoMilitarDrift(
    String idMilitar,
    String urlImagem,
  ) async {
    await (database.update(database.militarTabela)
          ..where((tbl) => tbl.idMilitar.equals(idMilitar)))
        .write(MilitarTabelaCompanion(urlImagem: Value(urlImagem)));
  }

  Future<void> adicionarListaDeMilitaresAoDrift(
    List<Militar> listaMilitares,
  ) async {
    if (listaMilitares.isEmpty) {
      print(
        'Firebase retornou lista vazia. Não vou apagar nem alterar o Drift.',
      );
      return;
    }

    await database.batch((batch) {
      batch.insertAll(
        database.militarTabela,
        listaMilitares.map((militar) {
          return MilitarTabelaCompanion.insert(
            idMilitar: militar.idMilitar,
            cpf: militar.cpf,
            numeroBM: militar.numeroBM,
            nomeCompleto: militar.nomeCompleto,
            nomeDeGuerra: militar.nomeDeGuerra,
            cargo: militar.cargo,
            credencialMotorista: militar.credencialMotorista,
            dataNascimento: militar.dataNascimento,
            estadoCivil: militar.estadoCivil,
            unidadeAtual: militar.unidadeAtual,
            rua: militar.rua,
            bairro: militar.bairro,
            cidade: militar.cidade,
            numero: militar.numeroResidencia,
            cep: militar.cep,
            telefone: militar.telefone,
            email: militar.email,
            naturalidade: militar.naturalidade,
            urlImagem: militar.urlImagem,
            funcao: militar.funcao,
            obs: militar.obs,
            complementoEndereco: militar.complementoEndereco,
            numeroConta: militar.numeroConta,
            banco: militar.banco,
            numeroAg: militar.numeroAg,
            quantidadeAdi: militar.quantidadeAdi,
          );
        }).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });

    print('Sincronizados no Drift: ${listaMilitares.length}');
  }

  Future<List<Militar>> pegarTodosMilitares() async {
    final resultado = await database.select(database.militarTabela).get();

    return resultado.map((militar) {
      return Militar.fromDrift(militar);
    }).toList();
  }

  Future<List<Militar>> pegarMilitaresNaoSincronizados() async {
    final resultado = await (database.select(
      database.militarTabela,
    )..where((tbl) => tbl.sincronizado.equals(false))).get();

    return resultado.map((militar) {
      return Militar.fromDrift(militar);
    }).toList();
  }

  Future<List<Militar>> pegarListaMilitaresPorListaAnuncioMilitar(
    List<AnuncioMilitar> listaAnuncioMilitar,
  ) async {
    final idsMilitares = listaAnuncioMilitar.map((e) => e.idMilitar).toList();

    if (idsMilitares.isEmpty) return [];

    final resultado = await (database.select(
      database.militarTabela,
    )..where((tbl) => tbl.idMilitar.isIn(idsMilitares))).get();

    return resultado.map((e) => Militar.fromDrift(e)).toList();
  }

  Stream<List<Militar>> observarTodosMilitares() {
    return database.select(database.militarTabela).watch().map((rows) {
      return rows.map((row) => Militar.fromDrift(row)).toList();
    });
  }

  Future<void> atualizarMilitaresParaSincronizado() async {
    database
        .update(database.militarTabela)
        .write(MilitarTabelaCompanion(sincronizado: const Value(true)));
  }
}
