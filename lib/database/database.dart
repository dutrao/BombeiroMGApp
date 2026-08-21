
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class MilitarTabela extends Table {
  TextColumn get idMilitar => text()();
  TextColumn get cpf => text().withLength(max: 11)();
  TextColumn get numeroBM => text().withLength(min: 7, max: 7)();
  TextColumn get nomeCompleto => text().withLength(max: 250)();
  TextColumn get nomeDeGuerra => text().withLength(max: 50)();
  TextColumn get cargo => text().withLength(max: 20)();
  TextColumn get credencialMotorista => text().withLength(max: 2)();
  DateTimeColumn get dataNascimento => dateTime()();
  TextColumn get estadoCivil => text().withLength(max: 20)();
  TextColumn get unidadeAtual => text().withLength(max: 20)();
  TextColumn get rua => text().withLength(max: 50)();
  TextColumn get bairro => text().withLength(max: 50)();
  TextColumn get cidade => text().withLength(max: 50)();
  TextColumn get numero => text().withLength(max: 10)();
  TextColumn get cep => text().withLength(max: 8)();
  TextColumn get complementoEndereco => text().withLength(max: 8)();
  TextColumn get telefone => text().withLength(max: 11)();
  TextColumn get email => text().withLength(max: 250)();
  TextColumn get naturalidade => text().withLength(max: 50)();
  TextColumn get urlImagem => text()();
  TextColumn get funcao => text().withLength(max: 50)();
  TextColumn get numeroConta => text().withLength(max: 50)();
  TextColumn get banco => text().withLength(max: 50)();
  TextColumn get numeroAg => text().withLength(max: 50)();
  TextColumn get quantidadeAdi => text().withLength(max: 50)();
  TextColumn get obs => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idMilitar};
}

class AnuncioMilitarDiarioTabela extends Table {
  TextColumn get idAnuncioMilitar => text()();
  DateTimeColumn get dataHora => dateTime()();
  TextColumn get idMilitarResponsavel => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idAnuncioMilitar};
}
class AnuncioViaturaDiarioTabela extends Table {
  TextColumn get idAnuncioViatura => text()();
  DateTimeColumn get dataHora => dateTime()();
  TextColumn get idMilitarResponsavel => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idAnuncioViatura};
}

class AnuncioMilitarTabela extends Table {
  TextColumn get idMilitar => text().references(MilitarTabela, #idMilitar)();
  TextColumn get idAnuncio => text().references(AnuncioMilitarDiarioTabela, #idAnuncioMilitar)();
  TextColumn get destinacaoMilitar => text().withLength(max: 50)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => 
    {idAnuncio, idMilitar};
  
}

class AnuncioViaturaTabela extends Table {
  TextColumn get idViatura => text().references(ViaturaTabela, #idViatura)();
  TextColumn get idAnuncio => text().references(AnuncioViaturaDiarioTabela, #idAnuncioViatura)();
  TextColumn get destinacaoViatura => text().withLength(max: 50)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => 
    {idAnuncio, idViatura}
  ;
}

class ViaturaTabela extends Table {
  TextColumn get idViatura => text()();
  TextColumn get prefixo => text().withLength(max: 20)();
  TextColumn get tipoViatura => text().withLength(max: 20)();
  TextColumn get marca => text().withLength(max: 20)();
  TextColumn get modelo => text().withLength(max: 20)();
  TextColumn get ano => text().withLength(max: 9)();
  TextColumn get combustivel => text().withLength(max: 10)();
  TextColumn get categoria => text().withLength(max: 20)();
  TextColumn get placa => text().withLength(max: 10)();
  BoolColumn get deletado => boolean().withDefault(const Constant(false))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idViatura};
}

class MilitarCursoTabela extends Table {
  TextColumn get idMilitar => text().references(MilitarTabela, #idMilitar)();
  TextColumn get idCurso => text().references(CursoTabela, #idCurso)();
  BoolColumn get deletado => boolean().withDefault(const Constant(false))(); 
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => 
    {idMilitar, idCurso}
  ;
}

class CursoTabela extends Table {
  TextColumn get idCurso => text()();
  TextColumn get nomeCurso => text().withLength(max: 50)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idCurso};
}

class DemandaTabela extends Table {
  TextColumn get idDemanda => text()();
  TextColumn get idMilitarResponsavel=> text().references(MilitarTabela, #idMilitar)();
  TextColumn get numeroDemanda => text().withLength(max: 10)();
  TextColumn get nomeDemanda => text().withLength(max: 20)();
  DateTimeColumn get dataInicioDemanda => dateTime()();
  DateTimeColumn get dataFimDemanda => dateTime()();
  TextColumn get urlDemanda => text()();
  BoolColumn get deletado => boolean().withDefault(const Constant(false))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idDemanda};
}

class AnuncioOcorrenciaDiarioTabela extends Table {
  TextColumn get idAnuncioOcorrencia => text()();
  DateTimeColumn get dataHora => dateTime()();
  TextColumn get idMilitarResponsavel => text().references(MilitarTabela, #idMilitar)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idAnuncioOcorrencia};
}

class AnuncioOcorrenciaTabela extends Table {
  TextColumn get idItemAnuncioOcorrencia => text()();

  TextColumn get idAnuncioOcorrencia => text().references(
        AnuncioOcorrenciaDiarioTabela,
        #idAnuncioOcorrencia,
      )();

  TextColumn get idOcorrencia => text().references(
        OcorrenciaTabela,
        #idOcorrencia,
      )();

  BoolColumn get sincronizado =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {
        idItemAnuncioOcorrencia,
      };
}

class OcorrenciaTabela extends Table {
  TextColumn get idOcorrencia => text()();
  TextColumn get codigoOcorrencia=> text().withLength(max:10)();
  TextColumn get nomeOcorrencia => text().withLength(max: 250)();
  TextColumn get tipoOcorrencia => text().withLength(max: 250)();
  BoolColumn get iapr => boolean()();
  BoolColumn get irrd => boolean()();  
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idOcorrencia};
}



@DriftDatabase(
  tables: [
    MilitarTabela,
    AnuncioMilitarTabela,
    AnuncioMilitarDiarioTabela,
    AnuncioViaturaDiarioTabela,
    CursoTabela,
    AnuncioViaturaTabela,
    MilitarCursoTabela,
    ViaturaTabela,
    DemandaTabela,
    OcorrenciaTabela,
    AnuncioOcorrenciaDiarioTabela,
    AnuncioOcorrenciaTabela
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());
  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
