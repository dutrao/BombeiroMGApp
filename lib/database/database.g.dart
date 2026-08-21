// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MilitarTabelaTable extends MilitarTabela
    with TableInfo<$MilitarTabelaTable, MilitarTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilitarTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMilitarMeta = const VerificationMeta(
    'idMilitar',
  );
  @override
  late final GeneratedColumn<String> idMilitar = GeneratedColumn<String>(
    'id_militar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<String> cpf = GeneratedColumn<String>(
    'cpf',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 11),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroBMMeta = const VerificationMeta(
    'numeroBM',
  );
  @override
  late final GeneratedColumn<String> numeroBM = GeneratedColumn<String>(
    'numero_b_m',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 7,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeCompletoMeta = const VerificationMeta(
    'nomeCompleto',
  );
  @override
  late final GeneratedColumn<String> nomeCompleto = GeneratedColumn<String>(
    'nome_completo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 250),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeDeGuerraMeta = const VerificationMeta(
    'nomeDeGuerra',
  );
  @override
  late final GeneratedColumn<String> nomeDeGuerra = GeneratedColumn<String>(
    'nome_de_guerra',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cargoMeta = const VerificationMeta('cargo');
  @override
  late final GeneratedColumn<String> cargo = GeneratedColumn<String>(
    'cargo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _credencialMotoristaMeta =
      const VerificationMeta('credencialMotorista');
  @override
  late final GeneratedColumn<String> credencialMotorista =
      GeneratedColumn<String>(
        'credencial_motorista',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 2),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _dataNascimentoMeta = const VerificationMeta(
    'dataNascimento',
  );
  @override
  late final GeneratedColumn<DateTime> dataNascimento =
      GeneratedColumn<DateTime>(
        'data_nascimento',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _estadoCivilMeta = const VerificationMeta(
    'estadoCivil',
  );
  @override
  late final GeneratedColumn<String> estadoCivil = GeneratedColumn<String>(
    'estado_civil',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unidadeAtualMeta = const VerificationMeta(
    'unidadeAtual',
  );
  @override
  late final GeneratedColumn<String> unidadeAtual = GeneratedColumn<String>(
    'unidade_atual',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruaMeta = const VerificationMeta('rua');
  @override
  late final GeneratedColumn<String> rua = GeneratedColumn<String>(
    'rua',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bairroMeta = const VerificationMeta('bairro');
  @override
  late final GeneratedColumn<String> bairro = GeneratedColumn<String>(
    'bairro',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cidadeMeta = const VerificationMeta('cidade');
  @override
  late final GeneratedColumn<String> cidade = GeneratedColumn<String>(
    'cidade',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
    'cep',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _complementoEnderecoMeta =
      const VerificationMeta('complementoEndereco');
  @override
  late final GeneratedColumn<String> complementoEndereco =
      GeneratedColumn<String>(
        'complemento_endereco',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 8),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _telefoneMeta = const VerificationMeta(
    'telefone',
  );
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
    'telefone',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 11),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 250),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _naturalidadeMeta = const VerificationMeta(
    'naturalidade',
  );
  @override
  late final GeneratedColumn<String> naturalidade = GeneratedColumn<String>(
    'naturalidade',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlImagemMeta = const VerificationMeta(
    'urlImagem',
  );
  @override
  late final GeneratedColumn<String> urlImagem = GeneratedColumn<String>(
    'url_imagem',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _funcaoMeta = const VerificationMeta('funcao');
  @override
  late final GeneratedColumn<String> funcao = GeneratedColumn<String>(
    'funcao',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroContaMeta = const VerificationMeta(
    'numeroConta',
  );
  @override
  late final GeneratedColumn<String> numeroConta = GeneratedColumn<String>(
    'numero_conta',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bancoMeta = const VerificationMeta('banco');
  @override
  late final GeneratedColumn<String> banco = GeneratedColumn<String>(
    'banco',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroAgMeta = const VerificationMeta(
    'numeroAg',
  );
  @override
  late final GeneratedColumn<String> numeroAg = GeneratedColumn<String>(
    'numero_ag',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantidadeAdiMeta = const VerificationMeta(
    'quantidadeAdi',
  );
  @override
  late final GeneratedColumn<String> quantidadeAdi = GeneratedColumn<String>(
    'quantidade_adi',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _obsMeta = const VerificationMeta('obs');
  @override
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
    'obs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idMilitar,
    cpf,
    numeroBM,
    nomeCompleto,
    nomeDeGuerra,
    cargo,
    credencialMotorista,
    dataNascimento,
    estadoCivil,
    unidadeAtual,
    rua,
    bairro,
    cidade,
    numero,
    cep,
    complementoEndereco,
    telefone,
    email,
    naturalidade,
    urlImagem,
    funcao,
    numeroConta,
    banco,
    numeroAg,
    quantidadeAdi,
    obs,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'militar_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<MilitarTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_militar')) {
      context.handle(
        _idMilitarMeta,
        idMilitar.isAcceptableOrUnknown(data['id_militar']!, _idMilitarMeta),
      );
    } else if (isInserting) {
      context.missing(_idMilitarMeta);
    }
    if (data.containsKey('cpf')) {
      context.handle(
        _cpfMeta,
        cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta),
      );
    } else if (isInserting) {
      context.missing(_cpfMeta);
    }
    if (data.containsKey('numero_b_m')) {
      context.handle(
        _numeroBMMeta,
        numeroBM.isAcceptableOrUnknown(data['numero_b_m']!, _numeroBMMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroBMMeta);
    }
    if (data.containsKey('nome_completo')) {
      context.handle(
        _nomeCompletoMeta,
        nomeCompleto.isAcceptableOrUnknown(
          data['nome_completo']!,
          _nomeCompletoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeCompletoMeta);
    }
    if (data.containsKey('nome_de_guerra')) {
      context.handle(
        _nomeDeGuerraMeta,
        nomeDeGuerra.isAcceptableOrUnknown(
          data['nome_de_guerra']!,
          _nomeDeGuerraMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeDeGuerraMeta);
    }
    if (data.containsKey('cargo')) {
      context.handle(
        _cargoMeta,
        cargo.isAcceptableOrUnknown(data['cargo']!, _cargoMeta),
      );
    } else if (isInserting) {
      context.missing(_cargoMeta);
    }
    if (data.containsKey('credencial_motorista')) {
      context.handle(
        _credencialMotoristaMeta,
        credencialMotorista.isAcceptableOrUnknown(
          data['credencial_motorista']!,
          _credencialMotoristaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_credencialMotoristaMeta);
    }
    if (data.containsKey('data_nascimento')) {
      context.handle(
        _dataNascimentoMeta,
        dataNascimento.isAcceptableOrUnknown(
          data['data_nascimento']!,
          _dataNascimentoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dataNascimentoMeta);
    }
    if (data.containsKey('estado_civil')) {
      context.handle(
        _estadoCivilMeta,
        estadoCivil.isAcceptableOrUnknown(
          data['estado_civil']!,
          _estadoCivilMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estadoCivilMeta);
    }
    if (data.containsKey('unidade_atual')) {
      context.handle(
        _unidadeAtualMeta,
        unidadeAtual.isAcceptableOrUnknown(
          data['unidade_atual']!,
          _unidadeAtualMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unidadeAtualMeta);
    }
    if (data.containsKey('rua')) {
      context.handle(
        _ruaMeta,
        rua.isAcceptableOrUnknown(data['rua']!, _ruaMeta),
      );
    } else if (isInserting) {
      context.missing(_ruaMeta);
    }
    if (data.containsKey('bairro')) {
      context.handle(
        _bairroMeta,
        bairro.isAcceptableOrUnknown(data['bairro']!, _bairroMeta),
      );
    } else if (isInserting) {
      context.missing(_bairroMeta);
    }
    if (data.containsKey('cidade')) {
      context.handle(
        _cidadeMeta,
        cidade.isAcceptableOrUnknown(data['cidade']!, _cidadeMeta),
      );
    } else if (isInserting) {
      context.missing(_cidadeMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('cep')) {
      context.handle(
        _cepMeta,
        cep.isAcceptableOrUnknown(data['cep']!, _cepMeta),
      );
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (data.containsKey('complemento_endereco')) {
      context.handle(
        _complementoEnderecoMeta,
        complementoEndereco.isAcceptableOrUnknown(
          data['complemento_endereco']!,
          _complementoEnderecoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_complementoEnderecoMeta);
    }
    if (data.containsKey('telefone')) {
      context.handle(
        _telefoneMeta,
        telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta),
      );
    } else if (isInserting) {
      context.missing(_telefoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('naturalidade')) {
      context.handle(
        _naturalidadeMeta,
        naturalidade.isAcceptableOrUnknown(
          data['naturalidade']!,
          _naturalidadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_naturalidadeMeta);
    }
    if (data.containsKey('url_imagem')) {
      context.handle(
        _urlImagemMeta,
        urlImagem.isAcceptableOrUnknown(data['url_imagem']!, _urlImagemMeta),
      );
    } else if (isInserting) {
      context.missing(_urlImagemMeta);
    }
    if (data.containsKey('funcao')) {
      context.handle(
        _funcaoMeta,
        funcao.isAcceptableOrUnknown(data['funcao']!, _funcaoMeta),
      );
    } else if (isInserting) {
      context.missing(_funcaoMeta);
    }
    if (data.containsKey('numero_conta')) {
      context.handle(
        _numeroContaMeta,
        numeroConta.isAcceptableOrUnknown(
          data['numero_conta']!,
          _numeroContaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numeroContaMeta);
    }
    if (data.containsKey('banco')) {
      context.handle(
        _bancoMeta,
        banco.isAcceptableOrUnknown(data['banco']!, _bancoMeta),
      );
    } else if (isInserting) {
      context.missing(_bancoMeta);
    }
    if (data.containsKey('numero_ag')) {
      context.handle(
        _numeroAgMeta,
        numeroAg.isAcceptableOrUnknown(data['numero_ag']!, _numeroAgMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroAgMeta);
    }
    if (data.containsKey('quantidade_adi')) {
      context.handle(
        _quantidadeAdiMeta,
        quantidadeAdi.isAcceptableOrUnknown(
          data['quantidade_adi']!,
          _quantidadeAdiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantidadeAdiMeta);
    }
    if (data.containsKey('obs')) {
      context.handle(
        _obsMeta,
        obs.isAcceptableOrUnknown(data['obs']!, _obsMeta),
      );
    } else if (isInserting) {
      context.missing(_obsMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMilitar};
  @override
  MilitarTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MilitarTabelaData(
      idMilitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar'],
      )!,
      cpf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cpf'],
      )!,
      numeroBM: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_b_m'],
      )!,
      nomeCompleto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_completo'],
      )!,
      nomeDeGuerra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_de_guerra'],
      )!,
      cargo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cargo'],
      )!,
      credencialMotorista: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}credencial_motorista'],
      )!,
      dataNascimento: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_nascimento'],
      )!,
      estadoCivil: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado_civil'],
      )!,
      unidadeAtual: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unidade_atual'],
      )!,
      rua: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rua'],
      )!,
      bairro: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bairro'],
      )!,
      cidade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cidade'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
      )!,
      cep: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cep'],
      )!,
      complementoEndereco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}complemento_endereco'],
      )!,
      telefone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefone'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      naturalidade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}naturalidade'],
      )!,
      urlImagem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_imagem'],
      )!,
      funcao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}funcao'],
      )!,
      numeroConta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_conta'],
      )!,
      banco: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}banco'],
      )!,
      numeroAg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_ag'],
      )!,
      quantidadeAdi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantidade_adi'],
      )!,
      obs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}obs'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $MilitarTabelaTable createAlias(String alias) {
    return $MilitarTabelaTable(attachedDatabase, alias);
  }
}

class MilitarTabelaData extends DataClass
    implements Insertable<MilitarTabelaData> {
  final String idMilitar;
  final String cpf;
  final String numeroBM;
  final String nomeCompleto;
  final String nomeDeGuerra;
  final String cargo;
  final String credencialMotorista;
  final DateTime dataNascimento;
  final String estadoCivil;
  final String unidadeAtual;
  final String rua;
  final String bairro;
  final String cidade;
  final String numero;
  final String cep;
  final String complementoEndereco;
  final String telefone;
  final String email;
  final String naturalidade;
  final String urlImagem;
  final String funcao;
  final String numeroConta;
  final String banco;
  final String numeroAg;
  final String quantidadeAdi;
  final String obs;
  final bool sincronizado;
  const MilitarTabelaData({
    required this.idMilitar,
    required this.cpf,
    required this.numeroBM,
    required this.nomeCompleto,
    required this.nomeDeGuerra,
    required this.cargo,
    required this.credencialMotorista,
    required this.dataNascimento,
    required this.estadoCivil,
    required this.unidadeAtual,
    required this.rua,
    required this.bairro,
    required this.cidade,
    required this.numero,
    required this.cep,
    required this.complementoEndereco,
    required this.telefone,
    required this.email,
    required this.naturalidade,
    required this.urlImagem,
    required this.funcao,
    required this.numeroConta,
    required this.banco,
    required this.numeroAg,
    required this.quantidadeAdi,
    required this.obs,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_militar'] = Variable<String>(idMilitar);
    map['cpf'] = Variable<String>(cpf);
    map['numero_b_m'] = Variable<String>(numeroBM);
    map['nome_completo'] = Variable<String>(nomeCompleto);
    map['nome_de_guerra'] = Variable<String>(nomeDeGuerra);
    map['cargo'] = Variable<String>(cargo);
    map['credencial_motorista'] = Variable<String>(credencialMotorista);
    map['data_nascimento'] = Variable<DateTime>(dataNascimento);
    map['estado_civil'] = Variable<String>(estadoCivil);
    map['unidade_atual'] = Variable<String>(unidadeAtual);
    map['rua'] = Variable<String>(rua);
    map['bairro'] = Variable<String>(bairro);
    map['cidade'] = Variable<String>(cidade);
    map['numero'] = Variable<String>(numero);
    map['cep'] = Variable<String>(cep);
    map['complemento_endereco'] = Variable<String>(complementoEndereco);
    map['telefone'] = Variable<String>(telefone);
    map['email'] = Variable<String>(email);
    map['naturalidade'] = Variable<String>(naturalidade);
    map['url_imagem'] = Variable<String>(urlImagem);
    map['funcao'] = Variable<String>(funcao);
    map['numero_conta'] = Variable<String>(numeroConta);
    map['banco'] = Variable<String>(banco);
    map['numero_ag'] = Variable<String>(numeroAg);
    map['quantidade_adi'] = Variable<String>(quantidadeAdi);
    map['obs'] = Variable<String>(obs);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  MilitarTabelaCompanion toCompanion(bool nullToAbsent) {
    return MilitarTabelaCompanion(
      idMilitar: Value(idMilitar),
      cpf: Value(cpf),
      numeroBM: Value(numeroBM),
      nomeCompleto: Value(nomeCompleto),
      nomeDeGuerra: Value(nomeDeGuerra),
      cargo: Value(cargo),
      credencialMotorista: Value(credencialMotorista),
      dataNascimento: Value(dataNascimento),
      estadoCivil: Value(estadoCivil),
      unidadeAtual: Value(unidadeAtual),
      rua: Value(rua),
      bairro: Value(bairro),
      cidade: Value(cidade),
      numero: Value(numero),
      cep: Value(cep),
      complementoEndereco: Value(complementoEndereco),
      telefone: Value(telefone),
      email: Value(email),
      naturalidade: Value(naturalidade),
      urlImagem: Value(urlImagem),
      funcao: Value(funcao),
      numeroConta: Value(numeroConta),
      banco: Value(banco),
      numeroAg: Value(numeroAg),
      quantidadeAdi: Value(quantidadeAdi),
      obs: Value(obs),
      sincronizado: Value(sincronizado),
    );
  }

  factory MilitarTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MilitarTabelaData(
      idMilitar: serializer.fromJson<String>(json['idMilitar']),
      cpf: serializer.fromJson<String>(json['cpf']),
      numeroBM: serializer.fromJson<String>(json['numeroBM']),
      nomeCompleto: serializer.fromJson<String>(json['nomeCompleto']),
      nomeDeGuerra: serializer.fromJson<String>(json['nomeDeGuerra']),
      cargo: serializer.fromJson<String>(json['cargo']),
      credencialMotorista: serializer.fromJson<String>(
        json['credencialMotorista'],
      ),
      dataNascimento: serializer.fromJson<DateTime>(json['dataNascimento']),
      estadoCivil: serializer.fromJson<String>(json['estadoCivil']),
      unidadeAtual: serializer.fromJson<String>(json['unidadeAtual']),
      rua: serializer.fromJson<String>(json['rua']),
      bairro: serializer.fromJson<String>(json['bairro']),
      cidade: serializer.fromJson<String>(json['cidade']),
      numero: serializer.fromJson<String>(json['numero']),
      cep: serializer.fromJson<String>(json['cep']),
      complementoEndereco: serializer.fromJson<String>(
        json['complementoEndereco'],
      ),
      telefone: serializer.fromJson<String>(json['telefone']),
      email: serializer.fromJson<String>(json['email']),
      naturalidade: serializer.fromJson<String>(json['naturalidade']),
      urlImagem: serializer.fromJson<String>(json['urlImagem']),
      funcao: serializer.fromJson<String>(json['funcao']),
      numeroConta: serializer.fromJson<String>(json['numeroConta']),
      banco: serializer.fromJson<String>(json['banco']),
      numeroAg: serializer.fromJson<String>(json['numeroAg']),
      quantidadeAdi: serializer.fromJson<String>(json['quantidadeAdi']),
      obs: serializer.fromJson<String>(json['obs']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMilitar': serializer.toJson<String>(idMilitar),
      'cpf': serializer.toJson<String>(cpf),
      'numeroBM': serializer.toJson<String>(numeroBM),
      'nomeCompleto': serializer.toJson<String>(nomeCompleto),
      'nomeDeGuerra': serializer.toJson<String>(nomeDeGuerra),
      'cargo': serializer.toJson<String>(cargo),
      'credencialMotorista': serializer.toJson<String>(credencialMotorista),
      'dataNascimento': serializer.toJson<DateTime>(dataNascimento),
      'estadoCivil': serializer.toJson<String>(estadoCivil),
      'unidadeAtual': serializer.toJson<String>(unidadeAtual),
      'rua': serializer.toJson<String>(rua),
      'bairro': serializer.toJson<String>(bairro),
      'cidade': serializer.toJson<String>(cidade),
      'numero': serializer.toJson<String>(numero),
      'cep': serializer.toJson<String>(cep),
      'complementoEndereco': serializer.toJson<String>(complementoEndereco),
      'telefone': serializer.toJson<String>(telefone),
      'email': serializer.toJson<String>(email),
      'naturalidade': serializer.toJson<String>(naturalidade),
      'urlImagem': serializer.toJson<String>(urlImagem),
      'funcao': serializer.toJson<String>(funcao),
      'numeroConta': serializer.toJson<String>(numeroConta),
      'banco': serializer.toJson<String>(banco),
      'numeroAg': serializer.toJson<String>(numeroAg),
      'quantidadeAdi': serializer.toJson<String>(quantidadeAdi),
      'obs': serializer.toJson<String>(obs),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  MilitarTabelaData copyWith({
    String? idMilitar,
    String? cpf,
    String? numeroBM,
    String? nomeCompleto,
    String? nomeDeGuerra,
    String? cargo,
    String? credencialMotorista,
    DateTime? dataNascimento,
    String? estadoCivil,
    String? unidadeAtual,
    String? rua,
    String? bairro,
    String? cidade,
    String? numero,
    String? cep,
    String? complementoEndereco,
    String? telefone,
    String? email,
    String? naturalidade,
    String? urlImagem,
    String? funcao,
    String? numeroConta,
    String? banco,
    String? numeroAg,
    String? quantidadeAdi,
    String? obs,
    bool? sincronizado,
  }) => MilitarTabelaData(
    idMilitar: idMilitar ?? this.idMilitar,
    cpf: cpf ?? this.cpf,
    numeroBM: numeroBM ?? this.numeroBM,
    nomeCompleto: nomeCompleto ?? this.nomeCompleto,
    nomeDeGuerra: nomeDeGuerra ?? this.nomeDeGuerra,
    cargo: cargo ?? this.cargo,
    credencialMotorista: credencialMotorista ?? this.credencialMotorista,
    dataNascimento: dataNascimento ?? this.dataNascimento,
    estadoCivil: estadoCivil ?? this.estadoCivil,
    unidadeAtual: unidadeAtual ?? this.unidadeAtual,
    rua: rua ?? this.rua,
    bairro: bairro ?? this.bairro,
    cidade: cidade ?? this.cidade,
    numero: numero ?? this.numero,
    cep: cep ?? this.cep,
    complementoEndereco: complementoEndereco ?? this.complementoEndereco,
    telefone: telefone ?? this.telefone,
    email: email ?? this.email,
    naturalidade: naturalidade ?? this.naturalidade,
    urlImagem: urlImagem ?? this.urlImagem,
    funcao: funcao ?? this.funcao,
    numeroConta: numeroConta ?? this.numeroConta,
    banco: banco ?? this.banco,
    numeroAg: numeroAg ?? this.numeroAg,
    quantidadeAdi: quantidadeAdi ?? this.quantidadeAdi,
    obs: obs ?? this.obs,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  MilitarTabelaData copyWithCompanion(MilitarTabelaCompanion data) {
    return MilitarTabelaData(
      idMilitar: data.idMilitar.present ? data.idMilitar.value : this.idMilitar,
      cpf: data.cpf.present ? data.cpf.value : this.cpf,
      numeroBM: data.numeroBM.present ? data.numeroBM.value : this.numeroBM,
      nomeCompleto: data.nomeCompleto.present
          ? data.nomeCompleto.value
          : this.nomeCompleto,
      nomeDeGuerra: data.nomeDeGuerra.present
          ? data.nomeDeGuerra.value
          : this.nomeDeGuerra,
      cargo: data.cargo.present ? data.cargo.value : this.cargo,
      credencialMotorista: data.credencialMotorista.present
          ? data.credencialMotorista.value
          : this.credencialMotorista,
      dataNascimento: data.dataNascimento.present
          ? data.dataNascimento.value
          : this.dataNascimento,
      estadoCivil: data.estadoCivil.present
          ? data.estadoCivil.value
          : this.estadoCivil,
      unidadeAtual: data.unidadeAtual.present
          ? data.unidadeAtual.value
          : this.unidadeAtual,
      rua: data.rua.present ? data.rua.value : this.rua,
      bairro: data.bairro.present ? data.bairro.value : this.bairro,
      cidade: data.cidade.present ? data.cidade.value : this.cidade,
      numero: data.numero.present ? data.numero.value : this.numero,
      cep: data.cep.present ? data.cep.value : this.cep,
      complementoEndereco: data.complementoEndereco.present
          ? data.complementoEndereco.value
          : this.complementoEndereco,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      email: data.email.present ? data.email.value : this.email,
      naturalidade: data.naturalidade.present
          ? data.naturalidade.value
          : this.naturalidade,
      urlImagem: data.urlImagem.present ? data.urlImagem.value : this.urlImagem,
      funcao: data.funcao.present ? data.funcao.value : this.funcao,
      numeroConta: data.numeroConta.present
          ? data.numeroConta.value
          : this.numeroConta,
      banco: data.banco.present ? data.banco.value : this.banco,
      numeroAg: data.numeroAg.present ? data.numeroAg.value : this.numeroAg,
      quantidadeAdi: data.quantidadeAdi.present
          ? data.quantidadeAdi.value
          : this.quantidadeAdi,
      obs: data.obs.present ? data.obs.value : this.obs,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MilitarTabelaData(')
          ..write('idMilitar: $idMilitar, ')
          ..write('cpf: $cpf, ')
          ..write('numeroBM: $numeroBM, ')
          ..write('nomeCompleto: $nomeCompleto, ')
          ..write('nomeDeGuerra: $nomeDeGuerra, ')
          ..write('cargo: $cargo, ')
          ..write('credencialMotorista: $credencialMotorista, ')
          ..write('dataNascimento: $dataNascimento, ')
          ..write('estadoCivil: $estadoCivil, ')
          ..write('unidadeAtual: $unidadeAtual, ')
          ..write('rua: $rua, ')
          ..write('bairro: $bairro, ')
          ..write('cidade: $cidade, ')
          ..write('numero: $numero, ')
          ..write('cep: $cep, ')
          ..write('complementoEndereco: $complementoEndereco, ')
          ..write('telefone: $telefone, ')
          ..write('email: $email, ')
          ..write('naturalidade: $naturalidade, ')
          ..write('urlImagem: $urlImagem, ')
          ..write('funcao: $funcao, ')
          ..write('numeroConta: $numeroConta, ')
          ..write('banco: $banco, ')
          ..write('numeroAg: $numeroAg, ')
          ..write('quantidadeAdi: $quantidadeAdi, ')
          ..write('obs: $obs, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    idMilitar,
    cpf,
    numeroBM,
    nomeCompleto,
    nomeDeGuerra,
    cargo,
    credencialMotorista,
    dataNascimento,
    estadoCivil,
    unidadeAtual,
    rua,
    bairro,
    cidade,
    numero,
    cep,
    complementoEndereco,
    telefone,
    email,
    naturalidade,
    urlImagem,
    funcao,
    numeroConta,
    banco,
    numeroAg,
    quantidadeAdi,
    obs,
    sincronizado,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MilitarTabelaData &&
          other.idMilitar == this.idMilitar &&
          other.cpf == this.cpf &&
          other.numeroBM == this.numeroBM &&
          other.nomeCompleto == this.nomeCompleto &&
          other.nomeDeGuerra == this.nomeDeGuerra &&
          other.cargo == this.cargo &&
          other.credencialMotorista == this.credencialMotorista &&
          other.dataNascimento == this.dataNascimento &&
          other.estadoCivil == this.estadoCivil &&
          other.unidadeAtual == this.unidadeAtual &&
          other.rua == this.rua &&
          other.bairro == this.bairro &&
          other.cidade == this.cidade &&
          other.numero == this.numero &&
          other.cep == this.cep &&
          other.complementoEndereco == this.complementoEndereco &&
          other.telefone == this.telefone &&
          other.email == this.email &&
          other.naturalidade == this.naturalidade &&
          other.urlImagem == this.urlImagem &&
          other.funcao == this.funcao &&
          other.numeroConta == this.numeroConta &&
          other.banco == this.banco &&
          other.numeroAg == this.numeroAg &&
          other.quantidadeAdi == this.quantidadeAdi &&
          other.obs == this.obs &&
          other.sincronizado == this.sincronizado);
}

class MilitarTabelaCompanion extends UpdateCompanion<MilitarTabelaData> {
  final Value<String> idMilitar;
  final Value<String> cpf;
  final Value<String> numeroBM;
  final Value<String> nomeCompleto;
  final Value<String> nomeDeGuerra;
  final Value<String> cargo;
  final Value<String> credencialMotorista;
  final Value<DateTime> dataNascimento;
  final Value<String> estadoCivil;
  final Value<String> unidadeAtual;
  final Value<String> rua;
  final Value<String> bairro;
  final Value<String> cidade;
  final Value<String> numero;
  final Value<String> cep;
  final Value<String> complementoEndereco;
  final Value<String> telefone;
  final Value<String> email;
  final Value<String> naturalidade;
  final Value<String> urlImagem;
  final Value<String> funcao;
  final Value<String> numeroConta;
  final Value<String> banco;
  final Value<String> numeroAg;
  final Value<String> quantidadeAdi;
  final Value<String> obs;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const MilitarTabelaCompanion({
    this.idMilitar = const Value.absent(),
    this.cpf = const Value.absent(),
    this.numeroBM = const Value.absent(),
    this.nomeCompleto = const Value.absent(),
    this.nomeDeGuerra = const Value.absent(),
    this.cargo = const Value.absent(),
    this.credencialMotorista = const Value.absent(),
    this.dataNascimento = const Value.absent(),
    this.estadoCivil = const Value.absent(),
    this.unidadeAtual = const Value.absent(),
    this.rua = const Value.absent(),
    this.bairro = const Value.absent(),
    this.cidade = const Value.absent(),
    this.numero = const Value.absent(),
    this.cep = const Value.absent(),
    this.complementoEndereco = const Value.absent(),
    this.telefone = const Value.absent(),
    this.email = const Value.absent(),
    this.naturalidade = const Value.absent(),
    this.urlImagem = const Value.absent(),
    this.funcao = const Value.absent(),
    this.numeroConta = const Value.absent(),
    this.banco = const Value.absent(),
    this.numeroAg = const Value.absent(),
    this.quantidadeAdi = const Value.absent(),
    this.obs = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MilitarTabelaCompanion.insert({
    required String idMilitar,
    required String cpf,
    required String numeroBM,
    required String nomeCompleto,
    required String nomeDeGuerra,
    required String cargo,
    required String credencialMotorista,
    required DateTime dataNascimento,
    required String estadoCivil,
    required String unidadeAtual,
    required String rua,
    required String bairro,
    required String cidade,
    required String numero,
    required String cep,
    required String complementoEndereco,
    required String telefone,
    required String email,
    required String naturalidade,
    required String urlImagem,
    required String funcao,
    required String numeroConta,
    required String banco,
    required String numeroAg,
    required String quantidadeAdi,
    required String obs,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idMilitar = Value(idMilitar),
       cpf = Value(cpf),
       numeroBM = Value(numeroBM),
       nomeCompleto = Value(nomeCompleto),
       nomeDeGuerra = Value(nomeDeGuerra),
       cargo = Value(cargo),
       credencialMotorista = Value(credencialMotorista),
       dataNascimento = Value(dataNascimento),
       estadoCivil = Value(estadoCivil),
       unidadeAtual = Value(unidadeAtual),
       rua = Value(rua),
       bairro = Value(bairro),
       cidade = Value(cidade),
       numero = Value(numero),
       cep = Value(cep),
       complementoEndereco = Value(complementoEndereco),
       telefone = Value(telefone),
       email = Value(email),
       naturalidade = Value(naturalidade),
       urlImagem = Value(urlImagem),
       funcao = Value(funcao),
       numeroConta = Value(numeroConta),
       banco = Value(banco),
       numeroAg = Value(numeroAg),
       quantidadeAdi = Value(quantidadeAdi),
       obs = Value(obs);
  static Insertable<MilitarTabelaData> custom({
    Expression<String>? idMilitar,
    Expression<String>? cpf,
    Expression<String>? numeroBM,
    Expression<String>? nomeCompleto,
    Expression<String>? nomeDeGuerra,
    Expression<String>? cargo,
    Expression<String>? credencialMotorista,
    Expression<DateTime>? dataNascimento,
    Expression<String>? estadoCivil,
    Expression<String>? unidadeAtual,
    Expression<String>? rua,
    Expression<String>? bairro,
    Expression<String>? cidade,
    Expression<String>? numero,
    Expression<String>? cep,
    Expression<String>? complementoEndereco,
    Expression<String>? telefone,
    Expression<String>? email,
    Expression<String>? naturalidade,
    Expression<String>? urlImagem,
    Expression<String>? funcao,
    Expression<String>? numeroConta,
    Expression<String>? banco,
    Expression<String>? numeroAg,
    Expression<String>? quantidadeAdi,
    Expression<String>? obs,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMilitar != null) 'id_militar': idMilitar,
      if (cpf != null) 'cpf': cpf,
      if (numeroBM != null) 'numero_b_m': numeroBM,
      if (nomeCompleto != null) 'nome_completo': nomeCompleto,
      if (nomeDeGuerra != null) 'nome_de_guerra': nomeDeGuerra,
      if (cargo != null) 'cargo': cargo,
      if (credencialMotorista != null)
        'credencial_motorista': credencialMotorista,
      if (dataNascimento != null) 'data_nascimento': dataNascimento,
      if (estadoCivil != null) 'estado_civil': estadoCivil,
      if (unidadeAtual != null) 'unidade_atual': unidadeAtual,
      if (rua != null) 'rua': rua,
      if (bairro != null) 'bairro': bairro,
      if (cidade != null) 'cidade': cidade,
      if (numero != null) 'numero': numero,
      if (cep != null) 'cep': cep,
      if (complementoEndereco != null)
        'complemento_endereco': complementoEndereco,
      if (telefone != null) 'telefone': telefone,
      if (email != null) 'email': email,
      if (naturalidade != null) 'naturalidade': naturalidade,
      if (urlImagem != null) 'url_imagem': urlImagem,
      if (funcao != null) 'funcao': funcao,
      if (numeroConta != null) 'numero_conta': numeroConta,
      if (banco != null) 'banco': banco,
      if (numeroAg != null) 'numero_ag': numeroAg,
      if (quantidadeAdi != null) 'quantidade_adi': quantidadeAdi,
      if (obs != null) 'obs': obs,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MilitarTabelaCompanion copyWith({
    Value<String>? idMilitar,
    Value<String>? cpf,
    Value<String>? numeroBM,
    Value<String>? nomeCompleto,
    Value<String>? nomeDeGuerra,
    Value<String>? cargo,
    Value<String>? credencialMotorista,
    Value<DateTime>? dataNascimento,
    Value<String>? estadoCivil,
    Value<String>? unidadeAtual,
    Value<String>? rua,
    Value<String>? bairro,
    Value<String>? cidade,
    Value<String>? numero,
    Value<String>? cep,
    Value<String>? complementoEndereco,
    Value<String>? telefone,
    Value<String>? email,
    Value<String>? naturalidade,
    Value<String>? urlImagem,
    Value<String>? funcao,
    Value<String>? numeroConta,
    Value<String>? banco,
    Value<String>? numeroAg,
    Value<String>? quantidadeAdi,
    Value<String>? obs,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return MilitarTabelaCompanion(
      idMilitar: idMilitar ?? this.idMilitar,
      cpf: cpf ?? this.cpf,
      numeroBM: numeroBM ?? this.numeroBM,
      nomeCompleto: nomeCompleto ?? this.nomeCompleto,
      nomeDeGuerra: nomeDeGuerra ?? this.nomeDeGuerra,
      cargo: cargo ?? this.cargo,
      credencialMotorista: credencialMotorista ?? this.credencialMotorista,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      estadoCivil: estadoCivil ?? this.estadoCivil,
      unidadeAtual: unidadeAtual ?? this.unidadeAtual,
      rua: rua ?? this.rua,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      numero: numero ?? this.numero,
      cep: cep ?? this.cep,
      complementoEndereco: complementoEndereco ?? this.complementoEndereco,
      telefone: telefone ?? this.telefone,
      email: email ?? this.email,
      naturalidade: naturalidade ?? this.naturalidade,
      urlImagem: urlImagem ?? this.urlImagem,
      funcao: funcao ?? this.funcao,
      numeroConta: numeroConta ?? this.numeroConta,
      banco: banco ?? this.banco,
      numeroAg: numeroAg ?? this.numeroAg,
      quantidadeAdi: quantidadeAdi ?? this.quantidadeAdi,
      obs: obs ?? this.obs,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMilitar.present) {
      map['id_militar'] = Variable<String>(idMilitar.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<String>(cpf.value);
    }
    if (numeroBM.present) {
      map['numero_b_m'] = Variable<String>(numeroBM.value);
    }
    if (nomeCompleto.present) {
      map['nome_completo'] = Variable<String>(nomeCompleto.value);
    }
    if (nomeDeGuerra.present) {
      map['nome_de_guerra'] = Variable<String>(nomeDeGuerra.value);
    }
    if (cargo.present) {
      map['cargo'] = Variable<String>(cargo.value);
    }
    if (credencialMotorista.present) {
      map['credencial_motorista'] = Variable<String>(credencialMotorista.value);
    }
    if (dataNascimento.present) {
      map['data_nascimento'] = Variable<DateTime>(dataNascimento.value);
    }
    if (estadoCivil.present) {
      map['estado_civil'] = Variable<String>(estadoCivil.value);
    }
    if (unidadeAtual.present) {
      map['unidade_atual'] = Variable<String>(unidadeAtual.value);
    }
    if (rua.present) {
      map['rua'] = Variable<String>(rua.value);
    }
    if (bairro.present) {
      map['bairro'] = Variable<String>(bairro.value);
    }
    if (cidade.present) {
      map['cidade'] = Variable<String>(cidade.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (complementoEndereco.present) {
      map['complemento_endereco'] = Variable<String>(complementoEndereco.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (naturalidade.present) {
      map['naturalidade'] = Variable<String>(naturalidade.value);
    }
    if (urlImagem.present) {
      map['url_imagem'] = Variable<String>(urlImagem.value);
    }
    if (funcao.present) {
      map['funcao'] = Variable<String>(funcao.value);
    }
    if (numeroConta.present) {
      map['numero_conta'] = Variable<String>(numeroConta.value);
    }
    if (banco.present) {
      map['banco'] = Variable<String>(banco.value);
    }
    if (numeroAg.present) {
      map['numero_ag'] = Variable<String>(numeroAg.value);
    }
    if (quantidadeAdi.present) {
      map['quantidade_adi'] = Variable<String>(quantidadeAdi.value);
    }
    if (obs.present) {
      map['obs'] = Variable<String>(obs.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilitarTabelaCompanion(')
          ..write('idMilitar: $idMilitar, ')
          ..write('cpf: $cpf, ')
          ..write('numeroBM: $numeroBM, ')
          ..write('nomeCompleto: $nomeCompleto, ')
          ..write('nomeDeGuerra: $nomeDeGuerra, ')
          ..write('cargo: $cargo, ')
          ..write('credencialMotorista: $credencialMotorista, ')
          ..write('dataNascimento: $dataNascimento, ')
          ..write('estadoCivil: $estadoCivil, ')
          ..write('unidadeAtual: $unidadeAtual, ')
          ..write('rua: $rua, ')
          ..write('bairro: $bairro, ')
          ..write('cidade: $cidade, ')
          ..write('numero: $numero, ')
          ..write('cep: $cep, ')
          ..write('complementoEndereco: $complementoEndereco, ')
          ..write('telefone: $telefone, ')
          ..write('email: $email, ')
          ..write('naturalidade: $naturalidade, ')
          ..write('urlImagem: $urlImagem, ')
          ..write('funcao: $funcao, ')
          ..write('numeroConta: $numeroConta, ')
          ..write('banco: $banco, ')
          ..write('numeroAg: $numeroAg, ')
          ..write('quantidadeAdi: $quantidadeAdi, ')
          ..write('obs: $obs, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioMilitarDiarioTabelaTable extends AnuncioMilitarDiarioTabela
    with
        TableInfo<
          $AnuncioMilitarDiarioTabelaTable,
          AnuncioMilitarDiarioTabelaData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioMilitarDiarioTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idAnuncioMilitarMeta = const VerificationMeta(
    'idAnuncioMilitar',
  );
  @override
  late final GeneratedColumn<String> idAnuncioMilitar = GeneratedColumn<String>(
    'id_anuncio_militar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataHoraMeta = const VerificationMeta(
    'dataHora',
  );
  @override
  late final GeneratedColumn<DateTime> dataHora = GeneratedColumn<DateTime>(
    'data_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMilitarResponsavelMeta =
      const VerificationMeta('idMilitarResponsavel');
  @override
  late final GeneratedColumn<String> idMilitarResponsavel =
      GeneratedColumn<String>(
        'id_militar_responsavel',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idAnuncioMilitar,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_militar_diario_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioMilitarDiarioTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_anuncio_militar')) {
      context.handle(
        _idAnuncioMilitarMeta,
        idAnuncioMilitar.isAcceptableOrUnknown(
          data['id_anuncio_militar']!,
          _idAnuncioMilitarMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioMilitarMeta);
    }
    if (data.containsKey('data_hora')) {
      context.handle(
        _dataHoraMeta,
        dataHora.isAcceptableOrUnknown(data['data_hora']!, _dataHoraMeta),
      );
    } else if (isInserting) {
      context.missing(_dataHoraMeta);
    }
    if (data.containsKey('id_militar_responsavel')) {
      context.handle(
        _idMilitarResponsavelMeta,
        idMilitarResponsavel.isAcceptableOrUnknown(
          data['id_militar_responsavel']!,
          _idMilitarResponsavelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idMilitarResponsavelMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAnuncioMilitar};
  @override
  AnuncioMilitarDiarioTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioMilitarDiarioTabelaData(
      idAnuncioMilitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio_militar'],
      )!,
      dataHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_hora'],
      )!,
      idMilitarResponsavel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar_responsavel'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioMilitarDiarioTabelaTable createAlias(String alias) {
    return $AnuncioMilitarDiarioTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioMilitarDiarioTabelaData extends DataClass
    implements Insertable<AnuncioMilitarDiarioTabelaData> {
  final String idAnuncioMilitar;
  final DateTime dataHora;
  final String idMilitarResponsavel;
  final bool sincronizado;
  const AnuncioMilitarDiarioTabelaData({
    required this.idAnuncioMilitar,
    required this.dataHora,
    required this.idMilitarResponsavel,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_anuncio_militar'] = Variable<String>(idAnuncioMilitar);
    map['data_hora'] = Variable<DateTime>(dataHora);
    map['id_militar_responsavel'] = Variable<String>(idMilitarResponsavel);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioMilitarDiarioTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioMilitarDiarioTabelaCompanion(
      idAnuncioMilitar: Value(idAnuncioMilitar),
      dataHora: Value(dataHora),
      idMilitarResponsavel: Value(idMilitarResponsavel),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioMilitarDiarioTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioMilitarDiarioTabelaData(
      idAnuncioMilitar: serializer.fromJson<String>(json['idAnuncioMilitar']),
      dataHora: serializer.fromJson<DateTime>(json['dataHora']),
      idMilitarResponsavel: serializer.fromJson<String>(
        json['idMilitarResponsavel'],
      ),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idAnuncioMilitar': serializer.toJson<String>(idAnuncioMilitar),
      'dataHora': serializer.toJson<DateTime>(dataHora),
      'idMilitarResponsavel': serializer.toJson<String>(idMilitarResponsavel),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioMilitarDiarioTabelaData copyWith({
    String? idAnuncioMilitar,
    DateTime? dataHora,
    String? idMilitarResponsavel,
    bool? sincronizado,
  }) => AnuncioMilitarDiarioTabelaData(
    idAnuncioMilitar: idAnuncioMilitar ?? this.idAnuncioMilitar,
    dataHora: dataHora ?? this.dataHora,
    idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioMilitarDiarioTabelaData copyWithCompanion(
    AnuncioMilitarDiarioTabelaCompanion data,
  ) {
    return AnuncioMilitarDiarioTabelaData(
      idAnuncioMilitar: data.idAnuncioMilitar.present
          ? data.idAnuncioMilitar.value
          : this.idAnuncioMilitar,
      dataHora: data.dataHora.present ? data.dataHora.value : this.dataHora,
      idMilitarResponsavel: data.idMilitarResponsavel.present
          ? data.idMilitarResponsavel.value
          : this.idMilitarResponsavel,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioMilitarDiarioTabelaData(')
          ..write('idAnuncioMilitar: $idAnuncioMilitar, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idAnuncioMilitar,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioMilitarDiarioTabelaData &&
          other.idAnuncioMilitar == this.idAnuncioMilitar &&
          other.dataHora == this.dataHora &&
          other.idMilitarResponsavel == this.idMilitarResponsavel &&
          other.sincronizado == this.sincronizado);
}

class AnuncioMilitarDiarioTabelaCompanion
    extends UpdateCompanion<AnuncioMilitarDiarioTabelaData> {
  final Value<String> idAnuncioMilitar;
  final Value<DateTime> dataHora;
  final Value<String> idMilitarResponsavel;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioMilitarDiarioTabelaCompanion({
    this.idAnuncioMilitar = const Value.absent(),
    this.dataHora = const Value.absent(),
    this.idMilitarResponsavel = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioMilitarDiarioTabelaCompanion.insert({
    required String idAnuncioMilitar,
    required DateTime dataHora,
    required String idMilitarResponsavel,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idAnuncioMilitar = Value(idAnuncioMilitar),
       dataHora = Value(dataHora),
       idMilitarResponsavel = Value(idMilitarResponsavel);
  static Insertable<AnuncioMilitarDiarioTabelaData> custom({
    Expression<String>? idAnuncioMilitar,
    Expression<DateTime>? dataHora,
    Expression<String>? idMilitarResponsavel,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idAnuncioMilitar != null) 'id_anuncio_militar': idAnuncioMilitar,
      if (dataHora != null) 'data_hora': dataHora,
      if (idMilitarResponsavel != null)
        'id_militar_responsavel': idMilitarResponsavel,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioMilitarDiarioTabelaCompanion copyWith({
    Value<String>? idAnuncioMilitar,
    Value<DateTime>? dataHora,
    Value<String>? idMilitarResponsavel,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioMilitarDiarioTabelaCompanion(
      idAnuncioMilitar: idAnuncioMilitar ?? this.idAnuncioMilitar,
      dataHora: dataHora ?? this.dataHora,
      idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idAnuncioMilitar.present) {
      map['id_anuncio_militar'] = Variable<String>(idAnuncioMilitar.value);
    }
    if (dataHora.present) {
      map['data_hora'] = Variable<DateTime>(dataHora.value);
    }
    if (idMilitarResponsavel.present) {
      map['id_militar_responsavel'] = Variable<String>(
        idMilitarResponsavel.value,
      );
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioMilitarDiarioTabelaCompanion(')
          ..write('idAnuncioMilitar: $idAnuncioMilitar, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioMilitarTabelaTable extends AnuncioMilitarTabela
    with TableInfo<$AnuncioMilitarTabelaTable, AnuncioMilitarTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioMilitarTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMilitarMeta = const VerificationMeta(
    'idMilitar',
  );
  @override
  late final GeneratedColumn<String> idMilitar = GeneratedColumn<String>(
    'id_militar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES militar_tabela (id_militar)',
    ),
  );
  static const VerificationMeta _idAnuncioMeta = const VerificationMeta(
    'idAnuncio',
  );
  @override
  late final GeneratedColumn<String> idAnuncio = GeneratedColumn<String>(
    'id_anuncio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES anuncio_militar_diario_tabela (id_anuncio_militar)',
    ),
  );
  static const VerificationMeta _destinacaoMilitarMeta = const VerificationMeta(
    'destinacaoMilitar',
  );
  @override
  late final GeneratedColumn<String> destinacaoMilitar =
      GeneratedColumn<String>(
        'destinacao_militar',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idMilitar,
    idAnuncio,
    destinacaoMilitar,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_militar_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioMilitarTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_militar')) {
      context.handle(
        _idMilitarMeta,
        idMilitar.isAcceptableOrUnknown(data['id_militar']!, _idMilitarMeta),
      );
    } else if (isInserting) {
      context.missing(_idMilitarMeta);
    }
    if (data.containsKey('id_anuncio')) {
      context.handle(
        _idAnuncioMeta,
        idAnuncio.isAcceptableOrUnknown(data['id_anuncio']!, _idAnuncioMeta),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioMeta);
    }
    if (data.containsKey('destinacao_militar')) {
      context.handle(
        _destinacaoMilitarMeta,
        destinacaoMilitar.isAcceptableOrUnknown(
          data['destinacao_militar']!,
          _destinacaoMilitarMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinacaoMilitarMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAnuncio, idMilitar};
  @override
  AnuncioMilitarTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioMilitarTabelaData(
      idMilitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar'],
      )!,
      idAnuncio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio'],
      )!,
      destinacaoMilitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destinacao_militar'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioMilitarTabelaTable createAlias(String alias) {
    return $AnuncioMilitarTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioMilitarTabelaData extends DataClass
    implements Insertable<AnuncioMilitarTabelaData> {
  final String idMilitar;
  final String idAnuncio;
  final String destinacaoMilitar;
  final bool sincronizado;
  const AnuncioMilitarTabelaData({
    required this.idMilitar,
    required this.idAnuncio,
    required this.destinacaoMilitar,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_militar'] = Variable<String>(idMilitar);
    map['id_anuncio'] = Variable<String>(idAnuncio);
    map['destinacao_militar'] = Variable<String>(destinacaoMilitar);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioMilitarTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioMilitarTabelaCompanion(
      idMilitar: Value(idMilitar),
      idAnuncio: Value(idAnuncio),
      destinacaoMilitar: Value(destinacaoMilitar),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioMilitarTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioMilitarTabelaData(
      idMilitar: serializer.fromJson<String>(json['idMilitar']),
      idAnuncio: serializer.fromJson<String>(json['idAnuncio']),
      destinacaoMilitar: serializer.fromJson<String>(json['destinacaoMilitar']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMilitar': serializer.toJson<String>(idMilitar),
      'idAnuncio': serializer.toJson<String>(idAnuncio),
      'destinacaoMilitar': serializer.toJson<String>(destinacaoMilitar),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioMilitarTabelaData copyWith({
    String? idMilitar,
    String? idAnuncio,
    String? destinacaoMilitar,
    bool? sincronizado,
  }) => AnuncioMilitarTabelaData(
    idMilitar: idMilitar ?? this.idMilitar,
    idAnuncio: idAnuncio ?? this.idAnuncio,
    destinacaoMilitar: destinacaoMilitar ?? this.destinacaoMilitar,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioMilitarTabelaData copyWithCompanion(
    AnuncioMilitarTabelaCompanion data,
  ) {
    return AnuncioMilitarTabelaData(
      idMilitar: data.idMilitar.present ? data.idMilitar.value : this.idMilitar,
      idAnuncio: data.idAnuncio.present ? data.idAnuncio.value : this.idAnuncio,
      destinacaoMilitar: data.destinacaoMilitar.present
          ? data.destinacaoMilitar.value
          : this.destinacaoMilitar,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioMilitarTabelaData(')
          ..write('idMilitar: $idMilitar, ')
          ..write('idAnuncio: $idAnuncio, ')
          ..write('destinacaoMilitar: $destinacaoMilitar, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idMilitar, idAnuncio, destinacaoMilitar, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioMilitarTabelaData &&
          other.idMilitar == this.idMilitar &&
          other.idAnuncio == this.idAnuncio &&
          other.destinacaoMilitar == this.destinacaoMilitar &&
          other.sincronizado == this.sincronizado);
}

class AnuncioMilitarTabelaCompanion
    extends UpdateCompanion<AnuncioMilitarTabelaData> {
  final Value<String> idMilitar;
  final Value<String> idAnuncio;
  final Value<String> destinacaoMilitar;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioMilitarTabelaCompanion({
    this.idMilitar = const Value.absent(),
    this.idAnuncio = const Value.absent(),
    this.destinacaoMilitar = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioMilitarTabelaCompanion.insert({
    required String idMilitar,
    required String idAnuncio,
    required String destinacaoMilitar,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idMilitar = Value(idMilitar),
       idAnuncio = Value(idAnuncio),
       destinacaoMilitar = Value(destinacaoMilitar);
  static Insertable<AnuncioMilitarTabelaData> custom({
    Expression<String>? idMilitar,
    Expression<String>? idAnuncio,
    Expression<String>? destinacaoMilitar,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMilitar != null) 'id_militar': idMilitar,
      if (idAnuncio != null) 'id_anuncio': idAnuncio,
      if (destinacaoMilitar != null) 'destinacao_militar': destinacaoMilitar,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioMilitarTabelaCompanion copyWith({
    Value<String>? idMilitar,
    Value<String>? idAnuncio,
    Value<String>? destinacaoMilitar,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioMilitarTabelaCompanion(
      idMilitar: idMilitar ?? this.idMilitar,
      idAnuncio: idAnuncio ?? this.idAnuncio,
      destinacaoMilitar: destinacaoMilitar ?? this.destinacaoMilitar,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMilitar.present) {
      map['id_militar'] = Variable<String>(idMilitar.value);
    }
    if (idAnuncio.present) {
      map['id_anuncio'] = Variable<String>(idAnuncio.value);
    }
    if (destinacaoMilitar.present) {
      map['destinacao_militar'] = Variable<String>(destinacaoMilitar.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioMilitarTabelaCompanion(')
          ..write('idMilitar: $idMilitar, ')
          ..write('idAnuncio: $idAnuncio, ')
          ..write('destinacaoMilitar: $destinacaoMilitar, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioViaturaDiarioTabelaTable extends AnuncioViaturaDiarioTabela
    with
        TableInfo<
          $AnuncioViaturaDiarioTabelaTable,
          AnuncioViaturaDiarioTabelaData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioViaturaDiarioTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idAnuncioViaturaMeta = const VerificationMeta(
    'idAnuncioViatura',
  );
  @override
  late final GeneratedColumn<String> idAnuncioViatura = GeneratedColumn<String>(
    'id_anuncio_viatura',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataHoraMeta = const VerificationMeta(
    'dataHora',
  );
  @override
  late final GeneratedColumn<DateTime> dataHora = GeneratedColumn<DateTime>(
    'data_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMilitarResponsavelMeta =
      const VerificationMeta('idMilitarResponsavel');
  @override
  late final GeneratedColumn<String> idMilitarResponsavel =
      GeneratedColumn<String>(
        'id_militar_responsavel',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idAnuncioViatura,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_viatura_diario_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioViaturaDiarioTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_anuncio_viatura')) {
      context.handle(
        _idAnuncioViaturaMeta,
        idAnuncioViatura.isAcceptableOrUnknown(
          data['id_anuncio_viatura']!,
          _idAnuncioViaturaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioViaturaMeta);
    }
    if (data.containsKey('data_hora')) {
      context.handle(
        _dataHoraMeta,
        dataHora.isAcceptableOrUnknown(data['data_hora']!, _dataHoraMeta),
      );
    } else if (isInserting) {
      context.missing(_dataHoraMeta);
    }
    if (data.containsKey('id_militar_responsavel')) {
      context.handle(
        _idMilitarResponsavelMeta,
        idMilitarResponsavel.isAcceptableOrUnknown(
          data['id_militar_responsavel']!,
          _idMilitarResponsavelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idMilitarResponsavelMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAnuncioViatura};
  @override
  AnuncioViaturaDiarioTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioViaturaDiarioTabelaData(
      idAnuncioViatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio_viatura'],
      )!,
      dataHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_hora'],
      )!,
      idMilitarResponsavel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar_responsavel'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioViaturaDiarioTabelaTable createAlias(String alias) {
    return $AnuncioViaturaDiarioTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioViaturaDiarioTabelaData extends DataClass
    implements Insertable<AnuncioViaturaDiarioTabelaData> {
  final String idAnuncioViatura;
  final DateTime dataHora;
  final String idMilitarResponsavel;
  final bool sincronizado;
  const AnuncioViaturaDiarioTabelaData({
    required this.idAnuncioViatura,
    required this.dataHora,
    required this.idMilitarResponsavel,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_anuncio_viatura'] = Variable<String>(idAnuncioViatura);
    map['data_hora'] = Variable<DateTime>(dataHora);
    map['id_militar_responsavel'] = Variable<String>(idMilitarResponsavel);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioViaturaDiarioTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioViaturaDiarioTabelaCompanion(
      idAnuncioViatura: Value(idAnuncioViatura),
      dataHora: Value(dataHora),
      idMilitarResponsavel: Value(idMilitarResponsavel),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioViaturaDiarioTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioViaturaDiarioTabelaData(
      idAnuncioViatura: serializer.fromJson<String>(json['idAnuncioViatura']),
      dataHora: serializer.fromJson<DateTime>(json['dataHora']),
      idMilitarResponsavel: serializer.fromJson<String>(
        json['idMilitarResponsavel'],
      ),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idAnuncioViatura': serializer.toJson<String>(idAnuncioViatura),
      'dataHora': serializer.toJson<DateTime>(dataHora),
      'idMilitarResponsavel': serializer.toJson<String>(idMilitarResponsavel),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioViaturaDiarioTabelaData copyWith({
    String? idAnuncioViatura,
    DateTime? dataHora,
    String? idMilitarResponsavel,
    bool? sincronizado,
  }) => AnuncioViaturaDiarioTabelaData(
    idAnuncioViatura: idAnuncioViatura ?? this.idAnuncioViatura,
    dataHora: dataHora ?? this.dataHora,
    idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioViaturaDiarioTabelaData copyWithCompanion(
    AnuncioViaturaDiarioTabelaCompanion data,
  ) {
    return AnuncioViaturaDiarioTabelaData(
      idAnuncioViatura: data.idAnuncioViatura.present
          ? data.idAnuncioViatura.value
          : this.idAnuncioViatura,
      dataHora: data.dataHora.present ? data.dataHora.value : this.dataHora,
      idMilitarResponsavel: data.idMilitarResponsavel.present
          ? data.idMilitarResponsavel.value
          : this.idMilitarResponsavel,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioViaturaDiarioTabelaData(')
          ..write('idAnuncioViatura: $idAnuncioViatura, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idAnuncioViatura,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioViaturaDiarioTabelaData &&
          other.idAnuncioViatura == this.idAnuncioViatura &&
          other.dataHora == this.dataHora &&
          other.idMilitarResponsavel == this.idMilitarResponsavel &&
          other.sincronizado == this.sincronizado);
}

class AnuncioViaturaDiarioTabelaCompanion
    extends UpdateCompanion<AnuncioViaturaDiarioTabelaData> {
  final Value<String> idAnuncioViatura;
  final Value<DateTime> dataHora;
  final Value<String> idMilitarResponsavel;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioViaturaDiarioTabelaCompanion({
    this.idAnuncioViatura = const Value.absent(),
    this.dataHora = const Value.absent(),
    this.idMilitarResponsavel = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioViaturaDiarioTabelaCompanion.insert({
    required String idAnuncioViatura,
    required DateTime dataHora,
    required String idMilitarResponsavel,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idAnuncioViatura = Value(idAnuncioViatura),
       dataHora = Value(dataHora),
       idMilitarResponsavel = Value(idMilitarResponsavel);
  static Insertable<AnuncioViaturaDiarioTabelaData> custom({
    Expression<String>? idAnuncioViatura,
    Expression<DateTime>? dataHora,
    Expression<String>? idMilitarResponsavel,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idAnuncioViatura != null) 'id_anuncio_viatura': idAnuncioViatura,
      if (dataHora != null) 'data_hora': dataHora,
      if (idMilitarResponsavel != null)
        'id_militar_responsavel': idMilitarResponsavel,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioViaturaDiarioTabelaCompanion copyWith({
    Value<String>? idAnuncioViatura,
    Value<DateTime>? dataHora,
    Value<String>? idMilitarResponsavel,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioViaturaDiarioTabelaCompanion(
      idAnuncioViatura: idAnuncioViatura ?? this.idAnuncioViatura,
      dataHora: dataHora ?? this.dataHora,
      idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idAnuncioViatura.present) {
      map['id_anuncio_viatura'] = Variable<String>(idAnuncioViatura.value);
    }
    if (dataHora.present) {
      map['data_hora'] = Variable<DateTime>(dataHora.value);
    }
    if (idMilitarResponsavel.present) {
      map['id_militar_responsavel'] = Variable<String>(
        idMilitarResponsavel.value,
      );
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioViaturaDiarioTabelaCompanion(')
          ..write('idAnuncioViatura: $idAnuncioViatura, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CursoTabelaTable extends CursoTabela
    with TableInfo<$CursoTabelaTable, CursoTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CursoTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idCursoMeta = const VerificationMeta(
    'idCurso',
  );
  @override
  late final GeneratedColumn<String> idCurso = GeneratedColumn<String>(
    'id_curso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeCursoMeta = const VerificationMeta(
    'nomeCurso',
  );
  @override
  late final GeneratedColumn<String> nomeCurso = GeneratedColumn<String>(
    'nome_curso',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [idCurso, nomeCurso, sincronizado];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'curso_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<CursoTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_curso')) {
      context.handle(
        _idCursoMeta,
        idCurso.isAcceptableOrUnknown(data['id_curso']!, _idCursoMeta),
      );
    } else if (isInserting) {
      context.missing(_idCursoMeta);
    }
    if (data.containsKey('nome_curso')) {
      context.handle(
        _nomeCursoMeta,
        nomeCurso.isAcceptableOrUnknown(data['nome_curso']!, _nomeCursoMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeCursoMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCurso};
  @override
  CursoTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CursoTabelaData(
      idCurso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_curso'],
      )!,
      nomeCurso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_curso'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $CursoTabelaTable createAlias(String alias) {
    return $CursoTabelaTable(attachedDatabase, alias);
  }
}

class CursoTabelaData extends DataClass implements Insertable<CursoTabelaData> {
  final String idCurso;
  final String nomeCurso;
  final bool sincronizado;
  const CursoTabelaData({
    required this.idCurso,
    required this.nomeCurso,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_curso'] = Variable<String>(idCurso);
    map['nome_curso'] = Variable<String>(nomeCurso);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  CursoTabelaCompanion toCompanion(bool nullToAbsent) {
    return CursoTabelaCompanion(
      idCurso: Value(idCurso),
      nomeCurso: Value(nomeCurso),
      sincronizado: Value(sincronizado),
    );
  }

  factory CursoTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CursoTabelaData(
      idCurso: serializer.fromJson<String>(json['idCurso']),
      nomeCurso: serializer.fromJson<String>(json['nomeCurso']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCurso': serializer.toJson<String>(idCurso),
      'nomeCurso': serializer.toJson<String>(nomeCurso),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  CursoTabelaData copyWith({
    String? idCurso,
    String? nomeCurso,
    bool? sincronizado,
  }) => CursoTabelaData(
    idCurso: idCurso ?? this.idCurso,
    nomeCurso: nomeCurso ?? this.nomeCurso,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  CursoTabelaData copyWithCompanion(CursoTabelaCompanion data) {
    return CursoTabelaData(
      idCurso: data.idCurso.present ? data.idCurso.value : this.idCurso,
      nomeCurso: data.nomeCurso.present ? data.nomeCurso.value : this.nomeCurso,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CursoTabelaData(')
          ..write('idCurso: $idCurso, ')
          ..write('nomeCurso: $nomeCurso, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idCurso, nomeCurso, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CursoTabelaData &&
          other.idCurso == this.idCurso &&
          other.nomeCurso == this.nomeCurso &&
          other.sincronizado == this.sincronizado);
}

class CursoTabelaCompanion extends UpdateCompanion<CursoTabelaData> {
  final Value<String> idCurso;
  final Value<String> nomeCurso;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const CursoTabelaCompanion({
    this.idCurso = const Value.absent(),
    this.nomeCurso = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CursoTabelaCompanion.insert({
    required String idCurso,
    required String nomeCurso,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idCurso = Value(idCurso),
       nomeCurso = Value(nomeCurso);
  static Insertable<CursoTabelaData> custom({
    Expression<String>? idCurso,
    Expression<String>? nomeCurso,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idCurso != null) 'id_curso': idCurso,
      if (nomeCurso != null) 'nome_curso': nomeCurso,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CursoTabelaCompanion copyWith({
    Value<String>? idCurso,
    Value<String>? nomeCurso,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return CursoTabelaCompanion(
      idCurso: idCurso ?? this.idCurso,
      nomeCurso: nomeCurso ?? this.nomeCurso,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCurso.present) {
      map['id_curso'] = Variable<String>(idCurso.value);
    }
    if (nomeCurso.present) {
      map['nome_curso'] = Variable<String>(nomeCurso.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CursoTabelaCompanion(')
          ..write('idCurso: $idCurso, ')
          ..write('nomeCurso: $nomeCurso, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ViaturaTabelaTable extends ViaturaTabela
    with TableInfo<$ViaturaTabelaTable, ViaturaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViaturaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idViaturaMeta = const VerificationMeta(
    'idViatura',
  );
  @override
  late final GeneratedColumn<String> idViatura = GeneratedColumn<String>(
    'id_viatura',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prefixoMeta = const VerificationMeta(
    'prefixo',
  );
  @override
  late final GeneratedColumn<String> prefixo = GeneratedColumn<String>(
    'prefixo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoViaturaMeta = const VerificationMeta(
    'tipoViatura',
  );
  @override
  late final GeneratedColumn<String> tipoViatura = GeneratedColumn<String>(
    'tipo_viatura',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marcaMeta = const VerificationMeta('marca');
  @override
  late final GeneratedColumn<String> marca = GeneratedColumn<String>(
    'marca',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeloMeta = const VerificationMeta('modelo');
  @override
  late final GeneratedColumn<String> modelo = GeneratedColumn<String>(
    'modelo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _anoMeta = const VerificationMeta('ano');
  @override
  late final GeneratedColumn<String> ano = GeneratedColumn<String>(
    'ano',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 9),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _combustivelMeta = const VerificationMeta(
    'combustivel',
  );
  @override
  late final GeneratedColumn<String> combustivel = GeneratedColumn<String>(
    'combustivel',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placaMeta = const VerificationMeta('placa');
  @override
  late final GeneratedColumn<String> placa = GeneratedColumn<String>(
    'placa',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletadoMeta = const VerificationMeta(
    'deletado',
  );
  @override
  late final GeneratedColumn<bool> deletado = GeneratedColumn<bool>(
    'deletado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deletado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idViatura,
    prefixo,
    tipoViatura,
    marca,
    modelo,
    ano,
    combustivel,
    categoria,
    placa,
    deletado,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'viatura_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<ViaturaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_viatura')) {
      context.handle(
        _idViaturaMeta,
        idViatura.isAcceptableOrUnknown(data['id_viatura']!, _idViaturaMeta),
      );
    } else if (isInserting) {
      context.missing(_idViaturaMeta);
    }
    if (data.containsKey('prefixo')) {
      context.handle(
        _prefixoMeta,
        prefixo.isAcceptableOrUnknown(data['prefixo']!, _prefixoMeta),
      );
    } else if (isInserting) {
      context.missing(_prefixoMeta);
    }
    if (data.containsKey('tipo_viatura')) {
      context.handle(
        _tipoViaturaMeta,
        tipoViatura.isAcceptableOrUnknown(
          data['tipo_viatura']!,
          _tipoViaturaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoViaturaMeta);
    }
    if (data.containsKey('marca')) {
      context.handle(
        _marcaMeta,
        marca.isAcceptableOrUnknown(data['marca']!, _marcaMeta),
      );
    } else if (isInserting) {
      context.missing(_marcaMeta);
    }
    if (data.containsKey('modelo')) {
      context.handle(
        _modeloMeta,
        modelo.isAcceptableOrUnknown(data['modelo']!, _modeloMeta),
      );
    } else if (isInserting) {
      context.missing(_modeloMeta);
    }
    if (data.containsKey('ano')) {
      context.handle(
        _anoMeta,
        ano.isAcceptableOrUnknown(data['ano']!, _anoMeta),
      );
    } else if (isInserting) {
      context.missing(_anoMeta);
    }
    if (data.containsKey('combustivel')) {
      context.handle(
        _combustivelMeta,
        combustivel.isAcceptableOrUnknown(
          data['combustivel']!,
          _combustivelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_combustivelMeta);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    if (data.containsKey('placa')) {
      context.handle(
        _placaMeta,
        placa.isAcceptableOrUnknown(data['placa']!, _placaMeta),
      );
    } else if (isInserting) {
      context.missing(_placaMeta);
    }
    if (data.containsKey('deletado')) {
      context.handle(
        _deletadoMeta,
        deletado.isAcceptableOrUnknown(data['deletado']!, _deletadoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idViatura};
  @override
  ViaturaTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViaturaTabelaData(
      idViatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_viatura'],
      )!,
      prefixo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefixo'],
      )!,
      tipoViatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_viatura'],
      )!,
      marca: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marca'],
      )!,
      modelo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modelo'],
      )!,
      ano: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ano'],
      )!,
      combustivel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}combustivel'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      placa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}placa'],
      )!,
      deletado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deletado'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $ViaturaTabelaTable createAlias(String alias) {
    return $ViaturaTabelaTable(attachedDatabase, alias);
  }
}

class ViaturaTabelaData extends DataClass
    implements Insertable<ViaturaTabelaData> {
  final String idViatura;
  final String prefixo;
  final String tipoViatura;
  final String marca;
  final String modelo;
  final String ano;
  final String combustivel;
  final String categoria;
  final String placa;
  final bool deletado;
  final bool sincronizado;
  const ViaturaTabelaData({
    required this.idViatura,
    required this.prefixo,
    required this.tipoViatura,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.categoria,
    required this.placa,
    required this.deletado,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_viatura'] = Variable<String>(idViatura);
    map['prefixo'] = Variable<String>(prefixo);
    map['tipo_viatura'] = Variable<String>(tipoViatura);
    map['marca'] = Variable<String>(marca);
    map['modelo'] = Variable<String>(modelo);
    map['ano'] = Variable<String>(ano);
    map['combustivel'] = Variable<String>(combustivel);
    map['categoria'] = Variable<String>(categoria);
    map['placa'] = Variable<String>(placa);
    map['deletado'] = Variable<bool>(deletado);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ViaturaTabelaCompanion toCompanion(bool nullToAbsent) {
    return ViaturaTabelaCompanion(
      idViatura: Value(idViatura),
      prefixo: Value(prefixo),
      tipoViatura: Value(tipoViatura),
      marca: Value(marca),
      modelo: Value(modelo),
      ano: Value(ano),
      combustivel: Value(combustivel),
      categoria: Value(categoria),
      placa: Value(placa),
      deletado: Value(deletado),
      sincronizado: Value(sincronizado),
    );
  }

  factory ViaturaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViaturaTabelaData(
      idViatura: serializer.fromJson<String>(json['idViatura']),
      prefixo: serializer.fromJson<String>(json['prefixo']),
      tipoViatura: serializer.fromJson<String>(json['tipoViatura']),
      marca: serializer.fromJson<String>(json['marca']),
      modelo: serializer.fromJson<String>(json['modelo']),
      ano: serializer.fromJson<String>(json['ano']),
      combustivel: serializer.fromJson<String>(json['combustivel']),
      categoria: serializer.fromJson<String>(json['categoria']),
      placa: serializer.fromJson<String>(json['placa']),
      deletado: serializer.fromJson<bool>(json['deletado']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idViatura': serializer.toJson<String>(idViatura),
      'prefixo': serializer.toJson<String>(prefixo),
      'tipoViatura': serializer.toJson<String>(tipoViatura),
      'marca': serializer.toJson<String>(marca),
      'modelo': serializer.toJson<String>(modelo),
      'ano': serializer.toJson<String>(ano),
      'combustivel': serializer.toJson<String>(combustivel),
      'categoria': serializer.toJson<String>(categoria),
      'placa': serializer.toJson<String>(placa),
      'deletado': serializer.toJson<bool>(deletado),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  ViaturaTabelaData copyWith({
    String? idViatura,
    String? prefixo,
    String? tipoViatura,
    String? marca,
    String? modelo,
    String? ano,
    String? combustivel,
    String? categoria,
    String? placa,
    bool? deletado,
    bool? sincronizado,
  }) => ViaturaTabelaData(
    idViatura: idViatura ?? this.idViatura,
    prefixo: prefixo ?? this.prefixo,
    tipoViatura: tipoViatura ?? this.tipoViatura,
    marca: marca ?? this.marca,
    modelo: modelo ?? this.modelo,
    ano: ano ?? this.ano,
    combustivel: combustivel ?? this.combustivel,
    categoria: categoria ?? this.categoria,
    placa: placa ?? this.placa,
    deletado: deletado ?? this.deletado,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  ViaturaTabelaData copyWithCompanion(ViaturaTabelaCompanion data) {
    return ViaturaTabelaData(
      idViatura: data.idViatura.present ? data.idViatura.value : this.idViatura,
      prefixo: data.prefixo.present ? data.prefixo.value : this.prefixo,
      tipoViatura: data.tipoViatura.present
          ? data.tipoViatura.value
          : this.tipoViatura,
      marca: data.marca.present ? data.marca.value : this.marca,
      modelo: data.modelo.present ? data.modelo.value : this.modelo,
      ano: data.ano.present ? data.ano.value : this.ano,
      combustivel: data.combustivel.present
          ? data.combustivel.value
          : this.combustivel,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      placa: data.placa.present ? data.placa.value : this.placa,
      deletado: data.deletado.present ? data.deletado.value : this.deletado,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ViaturaTabelaData(')
          ..write('idViatura: $idViatura, ')
          ..write('prefixo: $prefixo, ')
          ..write('tipoViatura: $tipoViatura, ')
          ..write('marca: $marca, ')
          ..write('modelo: $modelo, ')
          ..write('ano: $ano, ')
          ..write('combustivel: $combustivel, ')
          ..write('categoria: $categoria, ')
          ..write('placa: $placa, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idViatura,
    prefixo,
    tipoViatura,
    marca,
    modelo,
    ano,
    combustivel,
    categoria,
    placa,
    deletado,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViaturaTabelaData &&
          other.idViatura == this.idViatura &&
          other.prefixo == this.prefixo &&
          other.tipoViatura == this.tipoViatura &&
          other.marca == this.marca &&
          other.modelo == this.modelo &&
          other.ano == this.ano &&
          other.combustivel == this.combustivel &&
          other.categoria == this.categoria &&
          other.placa == this.placa &&
          other.deletado == this.deletado &&
          other.sincronizado == this.sincronizado);
}

class ViaturaTabelaCompanion extends UpdateCompanion<ViaturaTabelaData> {
  final Value<String> idViatura;
  final Value<String> prefixo;
  final Value<String> tipoViatura;
  final Value<String> marca;
  final Value<String> modelo;
  final Value<String> ano;
  final Value<String> combustivel;
  final Value<String> categoria;
  final Value<String> placa;
  final Value<bool> deletado;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const ViaturaTabelaCompanion({
    this.idViatura = const Value.absent(),
    this.prefixo = const Value.absent(),
    this.tipoViatura = const Value.absent(),
    this.marca = const Value.absent(),
    this.modelo = const Value.absent(),
    this.ano = const Value.absent(),
    this.combustivel = const Value.absent(),
    this.categoria = const Value.absent(),
    this.placa = const Value.absent(),
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ViaturaTabelaCompanion.insert({
    required String idViatura,
    required String prefixo,
    required String tipoViatura,
    required String marca,
    required String modelo,
    required String ano,
    required String combustivel,
    required String categoria,
    required String placa,
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idViatura = Value(idViatura),
       prefixo = Value(prefixo),
       tipoViatura = Value(tipoViatura),
       marca = Value(marca),
       modelo = Value(modelo),
       ano = Value(ano),
       combustivel = Value(combustivel),
       categoria = Value(categoria),
       placa = Value(placa);
  static Insertable<ViaturaTabelaData> custom({
    Expression<String>? idViatura,
    Expression<String>? prefixo,
    Expression<String>? tipoViatura,
    Expression<String>? marca,
    Expression<String>? modelo,
    Expression<String>? ano,
    Expression<String>? combustivel,
    Expression<String>? categoria,
    Expression<String>? placa,
    Expression<bool>? deletado,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idViatura != null) 'id_viatura': idViatura,
      if (prefixo != null) 'prefixo': prefixo,
      if (tipoViatura != null) 'tipo_viatura': tipoViatura,
      if (marca != null) 'marca': marca,
      if (modelo != null) 'modelo': modelo,
      if (ano != null) 'ano': ano,
      if (combustivel != null) 'combustivel': combustivel,
      if (categoria != null) 'categoria': categoria,
      if (placa != null) 'placa': placa,
      if (deletado != null) 'deletado': deletado,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ViaturaTabelaCompanion copyWith({
    Value<String>? idViatura,
    Value<String>? prefixo,
    Value<String>? tipoViatura,
    Value<String>? marca,
    Value<String>? modelo,
    Value<String>? ano,
    Value<String>? combustivel,
    Value<String>? categoria,
    Value<String>? placa,
    Value<bool>? deletado,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return ViaturaTabelaCompanion(
      idViatura: idViatura ?? this.idViatura,
      prefixo: prefixo ?? this.prefixo,
      tipoViatura: tipoViatura ?? this.tipoViatura,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      ano: ano ?? this.ano,
      combustivel: combustivel ?? this.combustivel,
      categoria: categoria ?? this.categoria,
      placa: placa ?? this.placa,
      deletado: deletado ?? this.deletado,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idViatura.present) {
      map['id_viatura'] = Variable<String>(idViatura.value);
    }
    if (prefixo.present) {
      map['prefixo'] = Variable<String>(prefixo.value);
    }
    if (tipoViatura.present) {
      map['tipo_viatura'] = Variable<String>(tipoViatura.value);
    }
    if (marca.present) {
      map['marca'] = Variable<String>(marca.value);
    }
    if (modelo.present) {
      map['modelo'] = Variable<String>(modelo.value);
    }
    if (ano.present) {
      map['ano'] = Variable<String>(ano.value);
    }
    if (combustivel.present) {
      map['combustivel'] = Variable<String>(combustivel.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (placa.present) {
      map['placa'] = Variable<String>(placa.value);
    }
    if (deletado.present) {
      map['deletado'] = Variable<bool>(deletado.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViaturaTabelaCompanion(')
          ..write('idViatura: $idViatura, ')
          ..write('prefixo: $prefixo, ')
          ..write('tipoViatura: $tipoViatura, ')
          ..write('marca: $marca, ')
          ..write('modelo: $modelo, ')
          ..write('ano: $ano, ')
          ..write('combustivel: $combustivel, ')
          ..write('categoria: $categoria, ')
          ..write('placa: $placa, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioViaturaTabelaTable extends AnuncioViaturaTabela
    with TableInfo<$AnuncioViaturaTabelaTable, AnuncioViaturaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioViaturaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idViaturaMeta = const VerificationMeta(
    'idViatura',
  );
  @override
  late final GeneratedColumn<String> idViatura = GeneratedColumn<String>(
    'id_viatura',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES viatura_tabela (id_viatura)',
    ),
  );
  static const VerificationMeta _idAnuncioMeta = const VerificationMeta(
    'idAnuncio',
  );
  @override
  late final GeneratedColumn<String> idAnuncio = GeneratedColumn<String>(
    'id_anuncio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES anuncio_viatura_diario_tabela (id_anuncio_viatura)',
    ),
  );
  static const VerificationMeta _destinacaoViaturaMeta = const VerificationMeta(
    'destinacaoViatura',
  );
  @override
  late final GeneratedColumn<String> destinacaoViatura =
      GeneratedColumn<String>(
        'destinacao_viatura',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idViatura,
    idAnuncio,
    destinacaoViatura,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_viatura_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioViaturaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_viatura')) {
      context.handle(
        _idViaturaMeta,
        idViatura.isAcceptableOrUnknown(data['id_viatura']!, _idViaturaMeta),
      );
    } else if (isInserting) {
      context.missing(_idViaturaMeta);
    }
    if (data.containsKey('id_anuncio')) {
      context.handle(
        _idAnuncioMeta,
        idAnuncio.isAcceptableOrUnknown(data['id_anuncio']!, _idAnuncioMeta),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioMeta);
    }
    if (data.containsKey('destinacao_viatura')) {
      context.handle(
        _destinacaoViaturaMeta,
        destinacaoViatura.isAcceptableOrUnknown(
          data['destinacao_viatura']!,
          _destinacaoViaturaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinacaoViaturaMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAnuncio, idViatura};
  @override
  AnuncioViaturaTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioViaturaTabelaData(
      idViatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_viatura'],
      )!,
      idAnuncio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio'],
      )!,
      destinacaoViatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destinacao_viatura'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioViaturaTabelaTable createAlias(String alias) {
    return $AnuncioViaturaTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioViaturaTabelaData extends DataClass
    implements Insertable<AnuncioViaturaTabelaData> {
  final String idViatura;
  final String idAnuncio;
  final String destinacaoViatura;
  final bool sincronizado;
  const AnuncioViaturaTabelaData({
    required this.idViatura,
    required this.idAnuncio,
    required this.destinacaoViatura,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_viatura'] = Variable<String>(idViatura);
    map['id_anuncio'] = Variable<String>(idAnuncio);
    map['destinacao_viatura'] = Variable<String>(destinacaoViatura);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioViaturaTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioViaturaTabelaCompanion(
      idViatura: Value(idViatura),
      idAnuncio: Value(idAnuncio),
      destinacaoViatura: Value(destinacaoViatura),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioViaturaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioViaturaTabelaData(
      idViatura: serializer.fromJson<String>(json['idViatura']),
      idAnuncio: serializer.fromJson<String>(json['idAnuncio']),
      destinacaoViatura: serializer.fromJson<String>(json['destinacaoViatura']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idViatura': serializer.toJson<String>(idViatura),
      'idAnuncio': serializer.toJson<String>(idAnuncio),
      'destinacaoViatura': serializer.toJson<String>(destinacaoViatura),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioViaturaTabelaData copyWith({
    String? idViatura,
    String? idAnuncio,
    String? destinacaoViatura,
    bool? sincronizado,
  }) => AnuncioViaturaTabelaData(
    idViatura: idViatura ?? this.idViatura,
    idAnuncio: idAnuncio ?? this.idAnuncio,
    destinacaoViatura: destinacaoViatura ?? this.destinacaoViatura,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioViaturaTabelaData copyWithCompanion(
    AnuncioViaturaTabelaCompanion data,
  ) {
    return AnuncioViaturaTabelaData(
      idViatura: data.idViatura.present ? data.idViatura.value : this.idViatura,
      idAnuncio: data.idAnuncio.present ? data.idAnuncio.value : this.idAnuncio,
      destinacaoViatura: data.destinacaoViatura.present
          ? data.destinacaoViatura.value
          : this.destinacaoViatura,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioViaturaTabelaData(')
          ..write('idViatura: $idViatura, ')
          ..write('idAnuncio: $idAnuncio, ')
          ..write('destinacaoViatura: $destinacaoViatura, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idViatura, idAnuncio, destinacaoViatura, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioViaturaTabelaData &&
          other.idViatura == this.idViatura &&
          other.idAnuncio == this.idAnuncio &&
          other.destinacaoViatura == this.destinacaoViatura &&
          other.sincronizado == this.sincronizado);
}

class AnuncioViaturaTabelaCompanion
    extends UpdateCompanion<AnuncioViaturaTabelaData> {
  final Value<String> idViatura;
  final Value<String> idAnuncio;
  final Value<String> destinacaoViatura;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioViaturaTabelaCompanion({
    this.idViatura = const Value.absent(),
    this.idAnuncio = const Value.absent(),
    this.destinacaoViatura = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioViaturaTabelaCompanion.insert({
    required String idViatura,
    required String idAnuncio,
    required String destinacaoViatura,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idViatura = Value(idViatura),
       idAnuncio = Value(idAnuncio),
       destinacaoViatura = Value(destinacaoViatura);
  static Insertable<AnuncioViaturaTabelaData> custom({
    Expression<String>? idViatura,
    Expression<String>? idAnuncio,
    Expression<String>? destinacaoViatura,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idViatura != null) 'id_viatura': idViatura,
      if (idAnuncio != null) 'id_anuncio': idAnuncio,
      if (destinacaoViatura != null) 'destinacao_viatura': destinacaoViatura,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioViaturaTabelaCompanion copyWith({
    Value<String>? idViatura,
    Value<String>? idAnuncio,
    Value<String>? destinacaoViatura,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioViaturaTabelaCompanion(
      idViatura: idViatura ?? this.idViatura,
      idAnuncio: idAnuncio ?? this.idAnuncio,
      destinacaoViatura: destinacaoViatura ?? this.destinacaoViatura,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idViatura.present) {
      map['id_viatura'] = Variable<String>(idViatura.value);
    }
    if (idAnuncio.present) {
      map['id_anuncio'] = Variable<String>(idAnuncio.value);
    }
    if (destinacaoViatura.present) {
      map['destinacao_viatura'] = Variable<String>(destinacaoViatura.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioViaturaTabelaCompanion(')
          ..write('idViatura: $idViatura, ')
          ..write('idAnuncio: $idAnuncio, ')
          ..write('destinacaoViatura: $destinacaoViatura, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MilitarCursoTabelaTable extends MilitarCursoTabela
    with TableInfo<$MilitarCursoTabelaTable, MilitarCursoTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilitarCursoTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMilitarMeta = const VerificationMeta(
    'idMilitar',
  );
  @override
  late final GeneratedColumn<String> idMilitar = GeneratedColumn<String>(
    'id_militar',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES militar_tabela (id_militar)',
    ),
  );
  static const VerificationMeta _idCursoMeta = const VerificationMeta(
    'idCurso',
  );
  @override
  late final GeneratedColumn<String> idCurso = GeneratedColumn<String>(
    'id_curso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES curso_tabela (id_curso)',
    ),
  );
  static const VerificationMeta _deletadoMeta = const VerificationMeta(
    'deletado',
  );
  @override
  late final GeneratedColumn<bool> deletado = GeneratedColumn<bool>(
    'deletado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deletado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idMilitar,
    idCurso,
    deletado,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'militar_curso_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<MilitarCursoTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_militar')) {
      context.handle(
        _idMilitarMeta,
        idMilitar.isAcceptableOrUnknown(data['id_militar']!, _idMilitarMeta),
      );
    } else if (isInserting) {
      context.missing(_idMilitarMeta);
    }
    if (data.containsKey('id_curso')) {
      context.handle(
        _idCursoMeta,
        idCurso.isAcceptableOrUnknown(data['id_curso']!, _idCursoMeta),
      );
    } else if (isInserting) {
      context.missing(_idCursoMeta);
    }
    if (data.containsKey('deletado')) {
      context.handle(
        _deletadoMeta,
        deletado.isAcceptableOrUnknown(data['deletado']!, _deletadoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMilitar, idCurso};
  @override
  MilitarCursoTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MilitarCursoTabelaData(
      idMilitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar'],
      )!,
      idCurso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_curso'],
      )!,
      deletado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deletado'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $MilitarCursoTabelaTable createAlias(String alias) {
    return $MilitarCursoTabelaTable(attachedDatabase, alias);
  }
}

class MilitarCursoTabelaData extends DataClass
    implements Insertable<MilitarCursoTabelaData> {
  final String idMilitar;
  final String idCurso;
  final bool deletado;
  final bool sincronizado;
  const MilitarCursoTabelaData({
    required this.idMilitar,
    required this.idCurso,
    required this.deletado,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_militar'] = Variable<String>(idMilitar);
    map['id_curso'] = Variable<String>(idCurso);
    map['deletado'] = Variable<bool>(deletado);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  MilitarCursoTabelaCompanion toCompanion(bool nullToAbsent) {
    return MilitarCursoTabelaCompanion(
      idMilitar: Value(idMilitar),
      idCurso: Value(idCurso),
      deletado: Value(deletado),
      sincronizado: Value(sincronizado),
    );
  }

  factory MilitarCursoTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MilitarCursoTabelaData(
      idMilitar: serializer.fromJson<String>(json['idMilitar']),
      idCurso: serializer.fromJson<String>(json['idCurso']),
      deletado: serializer.fromJson<bool>(json['deletado']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMilitar': serializer.toJson<String>(idMilitar),
      'idCurso': serializer.toJson<String>(idCurso),
      'deletado': serializer.toJson<bool>(deletado),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  MilitarCursoTabelaData copyWith({
    String? idMilitar,
    String? idCurso,
    bool? deletado,
    bool? sincronizado,
  }) => MilitarCursoTabelaData(
    idMilitar: idMilitar ?? this.idMilitar,
    idCurso: idCurso ?? this.idCurso,
    deletado: deletado ?? this.deletado,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  MilitarCursoTabelaData copyWithCompanion(MilitarCursoTabelaCompanion data) {
    return MilitarCursoTabelaData(
      idMilitar: data.idMilitar.present ? data.idMilitar.value : this.idMilitar,
      idCurso: data.idCurso.present ? data.idCurso.value : this.idCurso,
      deletado: data.deletado.present ? data.deletado.value : this.deletado,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MilitarCursoTabelaData(')
          ..write('idMilitar: $idMilitar, ')
          ..write('idCurso: $idCurso, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMilitar, idCurso, deletado, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MilitarCursoTabelaData &&
          other.idMilitar == this.idMilitar &&
          other.idCurso == this.idCurso &&
          other.deletado == this.deletado &&
          other.sincronizado == this.sincronizado);
}

class MilitarCursoTabelaCompanion
    extends UpdateCompanion<MilitarCursoTabelaData> {
  final Value<String> idMilitar;
  final Value<String> idCurso;
  final Value<bool> deletado;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const MilitarCursoTabelaCompanion({
    this.idMilitar = const Value.absent(),
    this.idCurso = const Value.absent(),
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MilitarCursoTabelaCompanion.insert({
    required String idMilitar,
    required String idCurso,
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idMilitar = Value(idMilitar),
       idCurso = Value(idCurso);
  static Insertable<MilitarCursoTabelaData> custom({
    Expression<String>? idMilitar,
    Expression<String>? idCurso,
    Expression<bool>? deletado,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMilitar != null) 'id_militar': idMilitar,
      if (idCurso != null) 'id_curso': idCurso,
      if (deletado != null) 'deletado': deletado,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MilitarCursoTabelaCompanion copyWith({
    Value<String>? idMilitar,
    Value<String>? idCurso,
    Value<bool>? deletado,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return MilitarCursoTabelaCompanion(
      idMilitar: idMilitar ?? this.idMilitar,
      idCurso: idCurso ?? this.idCurso,
      deletado: deletado ?? this.deletado,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMilitar.present) {
      map['id_militar'] = Variable<String>(idMilitar.value);
    }
    if (idCurso.present) {
      map['id_curso'] = Variable<String>(idCurso.value);
    }
    if (deletado.present) {
      map['deletado'] = Variable<bool>(deletado.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilitarCursoTabelaCompanion(')
          ..write('idMilitar: $idMilitar, ')
          ..write('idCurso: $idCurso, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DemandaTabelaTable extends DemandaTabela
    with TableInfo<$DemandaTabelaTable, DemandaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DemandaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idDemandaMeta = const VerificationMeta(
    'idDemanda',
  );
  @override
  late final GeneratedColumn<String> idDemanda = GeneratedColumn<String>(
    'id_demanda',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMilitarResponsavelMeta =
      const VerificationMeta('idMilitarResponsavel');
  @override
  late final GeneratedColumn<String> idMilitarResponsavel =
      GeneratedColumn<String>(
        'id_militar_responsavel',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES militar_tabela (id_militar)',
        ),
      );
  static const VerificationMeta _numeroDemandaMeta = const VerificationMeta(
    'numeroDemanda',
  );
  @override
  late final GeneratedColumn<String> numeroDemanda = GeneratedColumn<String>(
    'numero_demanda',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeDemandaMeta = const VerificationMeta(
    'nomeDemanda',
  );
  @override
  late final GeneratedColumn<String> nomeDemanda = GeneratedColumn<String>(
    'nome_demanda',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataInicioDemandaMeta = const VerificationMeta(
    'dataInicioDemanda',
  );
  @override
  late final GeneratedColumn<DateTime> dataInicioDemanda =
      GeneratedColumn<DateTime>(
        'data_inicio_demanda',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _dataFimDemandaMeta = const VerificationMeta(
    'dataFimDemanda',
  );
  @override
  late final GeneratedColumn<DateTime> dataFimDemanda =
      GeneratedColumn<DateTime>(
        'data_fim_demanda',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _urlDemandaMeta = const VerificationMeta(
    'urlDemanda',
  );
  @override
  late final GeneratedColumn<String> urlDemanda = GeneratedColumn<String>(
    'url_demanda',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletadoMeta = const VerificationMeta(
    'deletado',
  );
  @override
  late final GeneratedColumn<bool> deletado = GeneratedColumn<bool>(
    'deletado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deletado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idDemanda,
    idMilitarResponsavel,
    numeroDemanda,
    nomeDemanda,
    dataInicioDemanda,
    dataFimDemanda,
    urlDemanda,
    deletado,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'demanda_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<DemandaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_demanda')) {
      context.handle(
        _idDemandaMeta,
        idDemanda.isAcceptableOrUnknown(data['id_demanda']!, _idDemandaMeta),
      );
    } else if (isInserting) {
      context.missing(_idDemandaMeta);
    }
    if (data.containsKey('id_militar_responsavel')) {
      context.handle(
        _idMilitarResponsavelMeta,
        idMilitarResponsavel.isAcceptableOrUnknown(
          data['id_militar_responsavel']!,
          _idMilitarResponsavelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idMilitarResponsavelMeta);
    }
    if (data.containsKey('numero_demanda')) {
      context.handle(
        _numeroDemandaMeta,
        numeroDemanda.isAcceptableOrUnknown(
          data['numero_demanda']!,
          _numeroDemandaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numeroDemandaMeta);
    }
    if (data.containsKey('nome_demanda')) {
      context.handle(
        _nomeDemandaMeta,
        nomeDemanda.isAcceptableOrUnknown(
          data['nome_demanda']!,
          _nomeDemandaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeDemandaMeta);
    }
    if (data.containsKey('data_inicio_demanda')) {
      context.handle(
        _dataInicioDemandaMeta,
        dataInicioDemanda.isAcceptableOrUnknown(
          data['data_inicio_demanda']!,
          _dataInicioDemandaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dataInicioDemandaMeta);
    }
    if (data.containsKey('data_fim_demanda')) {
      context.handle(
        _dataFimDemandaMeta,
        dataFimDemanda.isAcceptableOrUnknown(
          data['data_fim_demanda']!,
          _dataFimDemandaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dataFimDemandaMeta);
    }
    if (data.containsKey('url_demanda')) {
      context.handle(
        _urlDemandaMeta,
        urlDemanda.isAcceptableOrUnknown(data['url_demanda']!, _urlDemandaMeta),
      );
    } else if (isInserting) {
      context.missing(_urlDemandaMeta);
    }
    if (data.containsKey('deletado')) {
      context.handle(
        _deletadoMeta,
        deletado.isAcceptableOrUnknown(data['deletado']!, _deletadoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idDemanda};
  @override
  DemandaTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DemandaTabelaData(
      idDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_demanda'],
      )!,
      idMilitarResponsavel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar_responsavel'],
      )!,
      numeroDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_demanda'],
      )!,
      nomeDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_demanda'],
      )!,
      dataInicioDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_inicio_demanda'],
      )!,
      dataFimDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_fim_demanda'],
      )!,
      urlDemanda: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_demanda'],
      )!,
      deletado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deletado'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $DemandaTabelaTable createAlias(String alias) {
    return $DemandaTabelaTable(attachedDatabase, alias);
  }
}

class DemandaTabelaData extends DataClass
    implements Insertable<DemandaTabelaData> {
  final String idDemanda;
  final String idMilitarResponsavel;
  final String numeroDemanda;
  final String nomeDemanda;
  final DateTime dataInicioDemanda;
  final DateTime dataFimDemanda;
  final String urlDemanda;
  final bool deletado;
  final bool sincronizado;
  const DemandaTabelaData({
    required this.idDemanda,
    required this.idMilitarResponsavel,
    required this.numeroDemanda,
    required this.nomeDemanda,
    required this.dataInicioDemanda,
    required this.dataFimDemanda,
    required this.urlDemanda,
    required this.deletado,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_demanda'] = Variable<String>(idDemanda);
    map['id_militar_responsavel'] = Variable<String>(idMilitarResponsavel);
    map['numero_demanda'] = Variable<String>(numeroDemanda);
    map['nome_demanda'] = Variable<String>(nomeDemanda);
    map['data_inicio_demanda'] = Variable<DateTime>(dataInicioDemanda);
    map['data_fim_demanda'] = Variable<DateTime>(dataFimDemanda);
    map['url_demanda'] = Variable<String>(urlDemanda);
    map['deletado'] = Variable<bool>(deletado);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  DemandaTabelaCompanion toCompanion(bool nullToAbsent) {
    return DemandaTabelaCompanion(
      idDemanda: Value(idDemanda),
      idMilitarResponsavel: Value(idMilitarResponsavel),
      numeroDemanda: Value(numeroDemanda),
      nomeDemanda: Value(nomeDemanda),
      dataInicioDemanda: Value(dataInicioDemanda),
      dataFimDemanda: Value(dataFimDemanda),
      urlDemanda: Value(urlDemanda),
      deletado: Value(deletado),
      sincronizado: Value(sincronizado),
    );
  }

  factory DemandaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DemandaTabelaData(
      idDemanda: serializer.fromJson<String>(json['idDemanda']),
      idMilitarResponsavel: serializer.fromJson<String>(
        json['idMilitarResponsavel'],
      ),
      numeroDemanda: serializer.fromJson<String>(json['numeroDemanda']),
      nomeDemanda: serializer.fromJson<String>(json['nomeDemanda']),
      dataInicioDemanda: serializer.fromJson<DateTime>(
        json['dataInicioDemanda'],
      ),
      dataFimDemanda: serializer.fromJson<DateTime>(json['dataFimDemanda']),
      urlDemanda: serializer.fromJson<String>(json['urlDemanda']),
      deletado: serializer.fromJson<bool>(json['deletado']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idDemanda': serializer.toJson<String>(idDemanda),
      'idMilitarResponsavel': serializer.toJson<String>(idMilitarResponsavel),
      'numeroDemanda': serializer.toJson<String>(numeroDemanda),
      'nomeDemanda': serializer.toJson<String>(nomeDemanda),
      'dataInicioDemanda': serializer.toJson<DateTime>(dataInicioDemanda),
      'dataFimDemanda': serializer.toJson<DateTime>(dataFimDemanda),
      'urlDemanda': serializer.toJson<String>(urlDemanda),
      'deletado': serializer.toJson<bool>(deletado),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  DemandaTabelaData copyWith({
    String? idDemanda,
    String? idMilitarResponsavel,
    String? numeroDemanda,
    String? nomeDemanda,
    DateTime? dataInicioDemanda,
    DateTime? dataFimDemanda,
    String? urlDemanda,
    bool? deletado,
    bool? sincronizado,
  }) => DemandaTabelaData(
    idDemanda: idDemanda ?? this.idDemanda,
    idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
    numeroDemanda: numeroDemanda ?? this.numeroDemanda,
    nomeDemanda: nomeDemanda ?? this.nomeDemanda,
    dataInicioDemanda: dataInicioDemanda ?? this.dataInicioDemanda,
    dataFimDemanda: dataFimDemanda ?? this.dataFimDemanda,
    urlDemanda: urlDemanda ?? this.urlDemanda,
    deletado: deletado ?? this.deletado,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  DemandaTabelaData copyWithCompanion(DemandaTabelaCompanion data) {
    return DemandaTabelaData(
      idDemanda: data.idDemanda.present ? data.idDemanda.value : this.idDemanda,
      idMilitarResponsavel: data.idMilitarResponsavel.present
          ? data.idMilitarResponsavel.value
          : this.idMilitarResponsavel,
      numeroDemanda: data.numeroDemanda.present
          ? data.numeroDemanda.value
          : this.numeroDemanda,
      nomeDemanda: data.nomeDemanda.present
          ? data.nomeDemanda.value
          : this.nomeDemanda,
      dataInicioDemanda: data.dataInicioDemanda.present
          ? data.dataInicioDemanda.value
          : this.dataInicioDemanda,
      dataFimDemanda: data.dataFimDemanda.present
          ? data.dataFimDemanda.value
          : this.dataFimDemanda,
      urlDemanda: data.urlDemanda.present
          ? data.urlDemanda.value
          : this.urlDemanda,
      deletado: data.deletado.present ? data.deletado.value : this.deletado,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DemandaTabelaData(')
          ..write('idDemanda: $idDemanda, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('numeroDemanda: $numeroDemanda, ')
          ..write('nomeDemanda: $nomeDemanda, ')
          ..write('dataInicioDemanda: $dataInicioDemanda, ')
          ..write('dataFimDemanda: $dataFimDemanda, ')
          ..write('urlDemanda: $urlDemanda, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idDemanda,
    idMilitarResponsavel,
    numeroDemanda,
    nomeDemanda,
    dataInicioDemanda,
    dataFimDemanda,
    urlDemanda,
    deletado,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DemandaTabelaData &&
          other.idDemanda == this.idDemanda &&
          other.idMilitarResponsavel == this.idMilitarResponsavel &&
          other.numeroDemanda == this.numeroDemanda &&
          other.nomeDemanda == this.nomeDemanda &&
          other.dataInicioDemanda == this.dataInicioDemanda &&
          other.dataFimDemanda == this.dataFimDemanda &&
          other.urlDemanda == this.urlDemanda &&
          other.deletado == this.deletado &&
          other.sincronizado == this.sincronizado);
}

class DemandaTabelaCompanion extends UpdateCompanion<DemandaTabelaData> {
  final Value<String> idDemanda;
  final Value<String> idMilitarResponsavel;
  final Value<String> numeroDemanda;
  final Value<String> nomeDemanda;
  final Value<DateTime> dataInicioDemanda;
  final Value<DateTime> dataFimDemanda;
  final Value<String> urlDemanda;
  final Value<bool> deletado;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const DemandaTabelaCompanion({
    this.idDemanda = const Value.absent(),
    this.idMilitarResponsavel = const Value.absent(),
    this.numeroDemanda = const Value.absent(),
    this.nomeDemanda = const Value.absent(),
    this.dataInicioDemanda = const Value.absent(),
    this.dataFimDemanda = const Value.absent(),
    this.urlDemanda = const Value.absent(),
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DemandaTabelaCompanion.insert({
    required String idDemanda,
    required String idMilitarResponsavel,
    required String numeroDemanda,
    required String nomeDemanda,
    required DateTime dataInicioDemanda,
    required DateTime dataFimDemanda,
    required String urlDemanda,
    this.deletado = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idDemanda = Value(idDemanda),
       idMilitarResponsavel = Value(idMilitarResponsavel),
       numeroDemanda = Value(numeroDemanda),
       nomeDemanda = Value(nomeDemanda),
       dataInicioDemanda = Value(dataInicioDemanda),
       dataFimDemanda = Value(dataFimDemanda),
       urlDemanda = Value(urlDemanda);
  static Insertable<DemandaTabelaData> custom({
    Expression<String>? idDemanda,
    Expression<String>? idMilitarResponsavel,
    Expression<String>? numeroDemanda,
    Expression<String>? nomeDemanda,
    Expression<DateTime>? dataInicioDemanda,
    Expression<DateTime>? dataFimDemanda,
    Expression<String>? urlDemanda,
    Expression<bool>? deletado,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idDemanda != null) 'id_demanda': idDemanda,
      if (idMilitarResponsavel != null)
        'id_militar_responsavel': idMilitarResponsavel,
      if (numeroDemanda != null) 'numero_demanda': numeroDemanda,
      if (nomeDemanda != null) 'nome_demanda': nomeDemanda,
      if (dataInicioDemanda != null) 'data_inicio_demanda': dataInicioDemanda,
      if (dataFimDemanda != null) 'data_fim_demanda': dataFimDemanda,
      if (urlDemanda != null) 'url_demanda': urlDemanda,
      if (deletado != null) 'deletado': deletado,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DemandaTabelaCompanion copyWith({
    Value<String>? idDemanda,
    Value<String>? idMilitarResponsavel,
    Value<String>? numeroDemanda,
    Value<String>? nomeDemanda,
    Value<DateTime>? dataInicioDemanda,
    Value<DateTime>? dataFimDemanda,
    Value<String>? urlDemanda,
    Value<bool>? deletado,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return DemandaTabelaCompanion(
      idDemanda: idDemanda ?? this.idDemanda,
      idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
      numeroDemanda: numeroDemanda ?? this.numeroDemanda,
      nomeDemanda: nomeDemanda ?? this.nomeDemanda,
      dataInicioDemanda: dataInicioDemanda ?? this.dataInicioDemanda,
      dataFimDemanda: dataFimDemanda ?? this.dataFimDemanda,
      urlDemanda: urlDemanda ?? this.urlDemanda,
      deletado: deletado ?? this.deletado,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idDemanda.present) {
      map['id_demanda'] = Variable<String>(idDemanda.value);
    }
    if (idMilitarResponsavel.present) {
      map['id_militar_responsavel'] = Variable<String>(
        idMilitarResponsavel.value,
      );
    }
    if (numeroDemanda.present) {
      map['numero_demanda'] = Variable<String>(numeroDemanda.value);
    }
    if (nomeDemanda.present) {
      map['nome_demanda'] = Variable<String>(nomeDemanda.value);
    }
    if (dataInicioDemanda.present) {
      map['data_inicio_demanda'] = Variable<DateTime>(dataInicioDemanda.value);
    }
    if (dataFimDemanda.present) {
      map['data_fim_demanda'] = Variable<DateTime>(dataFimDemanda.value);
    }
    if (urlDemanda.present) {
      map['url_demanda'] = Variable<String>(urlDemanda.value);
    }
    if (deletado.present) {
      map['deletado'] = Variable<bool>(deletado.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DemandaTabelaCompanion(')
          ..write('idDemanda: $idDemanda, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('numeroDemanda: $numeroDemanda, ')
          ..write('nomeDemanda: $nomeDemanda, ')
          ..write('dataInicioDemanda: $dataInicioDemanda, ')
          ..write('dataFimDemanda: $dataFimDemanda, ')
          ..write('urlDemanda: $urlDemanda, ')
          ..write('deletado: $deletado, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OcorrenciaTabelaTable extends OcorrenciaTabela
    with TableInfo<$OcorrenciaTabelaTable, OcorrenciaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OcorrenciaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOcorrenciaMeta = const VerificationMeta(
    'idOcorrencia',
  );
  @override
  late final GeneratedColumn<String> idOcorrencia = GeneratedColumn<String>(
    'id_ocorrencia',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codigoOcorrenciaMeta = const VerificationMeta(
    'codigoOcorrencia',
  );
  @override
  late final GeneratedColumn<String> codigoOcorrencia = GeneratedColumn<String>(
    'codigo_ocorrencia',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeOcorrenciaMeta = const VerificationMeta(
    'nomeOcorrencia',
  );
  @override
  late final GeneratedColumn<String> nomeOcorrencia = GeneratedColumn<String>(
    'nome_ocorrencia',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 250),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoOcorrenciaMeta = const VerificationMeta(
    'tipoOcorrencia',
  );
  @override
  late final GeneratedColumn<String> tipoOcorrencia = GeneratedColumn<String>(
    'tipo_ocorrencia',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 250),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iaprMeta = const VerificationMeta('iapr');
  @override
  late final GeneratedColumn<bool> iapr = GeneratedColumn<bool>(
    'iapr',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("iapr" IN (0, 1))',
    ),
  );
  static const VerificationMeta _irrdMeta = const VerificationMeta('irrd');
  @override
  late final GeneratedColumn<bool> irrd = GeneratedColumn<bool>(
    'irrd',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("irrd" IN (0, 1))',
    ),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idOcorrencia,
    codigoOcorrencia,
    nomeOcorrencia,
    tipoOcorrencia,
    iapr,
    irrd,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ocorrencia_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<OcorrenciaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ocorrencia')) {
      context.handle(
        _idOcorrenciaMeta,
        idOcorrencia.isAcceptableOrUnknown(
          data['id_ocorrencia']!,
          _idOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOcorrenciaMeta);
    }
    if (data.containsKey('codigo_ocorrencia')) {
      context.handle(
        _codigoOcorrenciaMeta,
        codigoOcorrencia.isAcceptableOrUnknown(
          data['codigo_ocorrencia']!,
          _codigoOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_codigoOcorrenciaMeta);
    }
    if (data.containsKey('nome_ocorrencia')) {
      context.handle(
        _nomeOcorrenciaMeta,
        nomeOcorrencia.isAcceptableOrUnknown(
          data['nome_ocorrencia']!,
          _nomeOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeOcorrenciaMeta);
    }
    if (data.containsKey('tipo_ocorrencia')) {
      context.handle(
        _tipoOcorrenciaMeta,
        tipoOcorrencia.isAcceptableOrUnknown(
          data['tipo_ocorrencia']!,
          _tipoOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoOcorrenciaMeta);
    }
    if (data.containsKey('iapr')) {
      context.handle(
        _iaprMeta,
        iapr.isAcceptableOrUnknown(data['iapr']!, _iaprMeta),
      );
    } else if (isInserting) {
      context.missing(_iaprMeta);
    }
    if (data.containsKey('irrd')) {
      context.handle(
        _irrdMeta,
        irrd.isAcceptableOrUnknown(data['irrd']!, _irrdMeta),
      );
    } else if (isInserting) {
      context.missing(_irrdMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOcorrencia};
  @override
  OcorrenciaTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OcorrenciaTabelaData(
      idOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_ocorrencia'],
      )!,
      codigoOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo_ocorrencia'],
      )!,
      nomeOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_ocorrencia'],
      )!,
      tipoOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_ocorrencia'],
      )!,
      iapr: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}iapr'],
      )!,
      irrd: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}irrd'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $OcorrenciaTabelaTable createAlias(String alias) {
    return $OcorrenciaTabelaTable(attachedDatabase, alias);
  }
}

class OcorrenciaTabelaData extends DataClass
    implements Insertable<OcorrenciaTabelaData> {
  final String idOcorrencia;
  final String codigoOcorrencia;
  final String nomeOcorrencia;
  final String tipoOcorrencia;
  final bool iapr;
  final bool irrd;
  final bool sincronizado;
  const OcorrenciaTabelaData({
    required this.idOcorrencia,
    required this.codigoOcorrencia,
    required this.nomeOcorrencia,
    required this.tipoOcorrencia,
    required this.iapr,
    required this.irrd,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ocorrencia'] = Variable<String>(idOcorrencia);
    map['codigo_ocorrencia'] = Variable<String>(codigoOcorrencia);
    map['nome_ocorrencia'] = Variable<String>(nomeOcorrencia);
    map['tipo_ocorrencia'] = Variable<String>(tipoOcorrencia);
    map['iapr'] = Variable<bool>(iapr);
    map['irrd'] = Variable<bool>(irrd);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  OcorrenciaTabelaCompanion toCompanion(bool nullToAbsent) {
    return OcorrenciaTabelaCompanion(
      idOcorrencia: Value(idOcorrencia),
      codigoOcorrencia: Value(codigoOcorrencia),
      nomeOcorrencia: Value(nomeOcorrencia),
      tipoOcorrencia: Value(tipoOcorrencia),
      iapr: Value(iapr),
      irrd: Value(irrd),
      sincronizado: Value(sincronizado),
    );
  }

  factory OcorrenciaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OcorrenciaTabelaData(
      idOcorrencia: serializer.fromJson<String>(json['idOcorrencia']),
      codigoOcorrencia: serializer.fromJson<String>(json['codigoOcorrencia']),
      nomeOcorrencia: serializer.fromJson<String>(json['nomeOcorrencia']),
      tipoOcorrencia: serializer.fromJson<String>(json['tipoOcorrencia']),
      iapr: serializer.fromJson<bool>(json['iapr']),
      irrd: serializer.fromJson<bool>(json['irrd']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOcorrencia': serializer.toJson<String>(idOcorrencia),
      'codigoOcorrencia': serializer.toJson<String>(codigoOcorrencia),
      'nomeOcorrencia': serializer.toJson<String>(nomeOcorrencia),
      'tipoOcorrencia': serializer.toJson<String>(tipoOcorrencia),
      'iapr': serializer.toJson<bool>(iapr),
      'irrd': serializer.toJson<bool>(irrd),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  OcorrenciaTabelaData copyWith({
    String? idOcorrencia,
    String? codigoOcorrencia,
    String? nomeOcorrencia,
    String? tipoOcorrencia,
    bool? iapr,
    bool? irrd,
    bool? sincronizado,
  }) => OcorrenciaTabelaData(
    idOcorrencia: idOcorrencia ?? this.idOcorrencia,
    codigoOcorrencia: codigoOcorrencia ?? this.codigoOcorrencia,
    nomeOcorrencia: nomeOcorrencia ?? this.nomeOcorrencia,
    tipoOcorrencia: tipoOcorrencia ?? this.tipoOcorrencia,
    iapr: iapr ?? this.iapr,
    irrd: irrd ?? this.irrd,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  OcorrenciaTabelaData copyWithCompanion(OcorrenciaTabelaCompanion data) {
    return OcorrenciaTabelaData(
      idOcorrencia: data.idOcorrencia.present
          ? data.idOcorrencia.value
          : this.idOcorrencia,
      codigoOcorrencia: data.codigoOcorrencia.present
          ? data.codigoOcorrencia.value
          : this.codigoOcorrencia,
      nomeOcorrencia: data.nomeOcorrencia.present
          ? data.nomeOcorrencia.value
          : this.nomeOcorrencia,
      tipoOcorrencia: data.tipoOcorrencia.present
          ? data.tipoOcorrencia.value
          : this.tipoOcorrencia,
      iapr: data.iapr.present ? data.iapr.value : this.iapr,
      irrd: data.irrd.present ? data.irrd.value : this.irrd,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OcorrenciaTabelaData(')
          ..write('idOcorrencia: $idOcorrencia, ')
          ..write('codigoOcorrencia: $codigoOcorrencia, ')
          ..write('nomeOcorrencia: $nomeOcorrencia, ')
          ..write('tipoOcorrencia: $tipoOcorrencia, ')
          ..write('iapr: $iapr, ')
          ..write('irrd: $irrd, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idOcorrencia,
    codigoOcorrencia,
    nomeOcorrencia,
    tipoOcorrencia,
    iapr,
    irrd,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OcorrenciaTabelaData &&
          other.idOcorrencia == this.idOcorrencia &&
          other.codigoOcorrencia == this.codigoOcorrencia &&
          other.nomeOcorrencia == this.nomeOcorrencia &&
          other.tipoOcorrencia == this.tipoOcorrencia &&
          other.iapr == this.iapr &&
          other.irrd == this.irrd &&
          other.sincronizado == this.sincronizado);
}

class OcorrenciaTabelaCompanion extends UpdateCompanion<OcorrenciaTabelaData> {
  final Value<String> idOcorrencia;
  final Value<String> codigoOcorrencia;
  final Value<String> nomeOcorrencia;
  final Value<String> tipoOcorrencia;
  final Value<bool> iapr;
  final Value<bool> irrd;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const OcorrenciaTabelaCompanion({
    this.idOcorrencia = const Value.absent(),
    this.codigoOcorrencia = const Value.absent(),
    this.nomeOcorrencia = const Value.absent(),
    this.tipoOcorrencia = const Value.absent(),
    this.iapr = const Value.absent(),
    this.irrd = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OcorrenciaTabelaCompanion.insert({
    required String idOcorrencia,
    required String codigoOcorrencia,
    required String nomeOcorrencia,
    required String tipoOcorrencia,
    required bool iapr,
    required bool irrd,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idOcorrencia = Value(idOcorrencia),
       codigoOcorrencia = Value(codigoOcorrencia),
       nomeOcorrencia = Value(nomeOcorrencia),
       tipoOcorrencia = Value(tipoOcorrencia),
       iapr = Value(iapr),
       irrd = Value(irrd);
  static Insertable<OcorrenciaTabelaData> custom({
    Expression<String>? idOcorrencia,
    Expression<String>? codigoOcorrencia,
    Expression<String>? nomeOcorrencia,
    Expression<String>? tipoOcorrencia,
    Expression<bool>? iapr,
    Expression<bool>? irrd,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idOcorrencia != null) 'id_ocorrencia': idOcorrencia,
      if (codigoOcorrencia != null) 'codigo_ocorrencia': codigoOcorrencia,
      if (nomeOcorrencia != null) 'nome_ocorrencia': nomeOcorrencia,
      if (tipoOcorrencia != null) 'tipo_ocorrencia': tipoOcorrencia,
      if (iapr != null) 'iapr': iapr,
      if (irrd != null) 'irrd': irrd,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OcorrenciaTabelaCompanion copyWith({
    Value<String>? idOcorrencia,
    Value<String>? codigoOcorrencia,
    Value<String>? nomeOcorrencia,
    Value<String>? tipoOcorrencia,
    Value<bool>? iapr,
    Value<bool>? irrd,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return OcorrenciaTabelaCompanion(
      idOcorrencia: idOcorrencia ?? this.idOcorrencia,
      codigoOcorrencia: codigoOcorrencia ?? this.codigoOcorrencia,
      nomeOcorrencia: nomeOcorrencia ?? this.nomeOcorrencia,
      tipoOcorrencia: tipoOcorrencia ?? this.tipoOcorrencia,
      iapr: iapr ?? this.iapr,
      irrd: irrd ?? this.irrd,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOcorrencia.present) {
      map['id_ocorrencia'] = Variable<String>(idOcorrencia.value);
    }
    if (codigoOcorrencia.present) {
      map['codigo_ocorrencia'] = Variable<String>(codigoOcorrencia.value);
    }
    if (nomeOcorrencia.present) {
      map['nome_ocorrencia'] = Variable<String>(nomeOcorrencia.value);
    }
    if (tipoOcorrencia.present) {
      map['tipo_ocorrencia'] = Variable<String>(tipoOcorrencia.value);
    }
    if (iapr.present) {
      map['iapr'] = Variable<bool>(iapr.value);
    }
    if (irrd.present) {
      map['irrd'] = Variable<bool>(irrd.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OcorrenciaTabelaCompanion(')
          ..write('idOcorrencia: $idOcorrencia, ')
          ..write('codigoOcorrencia: $codigoOcorrencia, ')
          ..write('nomeOcorrencia: $nomeOcorrencia, ')
          ..write('tipoOcorrencia: $tipoOcorrencia, ')
          ..write('iapr: $iapr, ')
          ..write('irrd: $irrd, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioOcorrenciaDiarioTabelaTable extends AnuncioOcorrenciaDiarioTabela
    with
        TableInfo<
          $AnuncioOcorrenciaDiarioTabelaTable,
          AnuncioOcorrenciaDiarioTabelaData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioOcorrenciaDiarioTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idAnuncioOcorrenciaMeta =
      const VerificationMeta('idAnuncioOcorrencia');
  @override
  late final GeneratedColumn<String> idAnuncioOcorrencia =
      GeneratedColumn<String>(
        'id_anuncio_ocorrencia',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _dataHoraMeta = const VerificationMeta(
    'dataHora',
  );
  @override
  late final GeneratedColumn<DateTime> dataHora = GeneratedColumn<DateTime>(
    'data_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMilitarResponsavelMeta =
      const VerificationMeta('idMilitarResponsavel');
  @override
  late final GeneratedColumn<String> idMilitarResponsavel =
      GeneratedColumn<String>(
        'id_militar_responsavel',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES militar_tabela (id_militar)',
        ),
      );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idAnuncioOcorrencia,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_ocorrencia_diario_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioOcorrenciaDiarioTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_anuncio_ocorrencia')) {
      context.handle(
        _idAnuncioOcorrenciaMeta,
        idAnuncioOcorrencia.isAcceptableOrUnknown(
          data['id_anuncio_ocorrencia']!,
          _idAnuncioOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioOcorrenciaMeta);
    }
    if (data.containsKey('data_hora')) {
      context.handle(
        _dataHoraMeta,
        dataHora.isAcceptableOrUnknown(data['data_hora']!, _dataHoraMeta),
      );
    } else if (isInserting) {
      context.missing(_dataHoraMeta);
    }
    if (data.containsKey('id_militar_responsavel')) {
      context.handle(
        _idMilitarResponsavelMeta,
        idMilitarResponsavel.isAcceptableOrUnknown(
          data['id_militar_responsavel']!,
          _idMilitarResponsavelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idMilitarResponsavelMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idAnuncioOcorrencia};
  @override
  AnuncioOcorrenciaDiarioTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioOcorrenciaDiarioTabelaData(
      idAnuncioOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio_ocorrencia'],
      )!,
      dataHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_hora'],
      )!,
      idMilitarResponsavel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_militar_responsavel'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioOcorrenciaDiarioTabelaTable createAlias(String alias) {
    return $AnuncioOcorrenciaDiarioTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioOcorrenciaDiarioTabelaData extends DataClass
    implements Insertable<AnuncioOcorrenciaDiarioTabelaData> {
  final String idAnuncioOcorrencia;
  final DateTime dataHora;
  final String idMilitarResponsavel;
  final bool sincronizado;
  const AnuncioOcorrenciaDiarioTabelaData({
    required this.idAnuncioOcorrencia,
    required this.dataHora,
    required this.idMilitarResponsavel,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_anuncio_ocorrencia'] = Variable<String>(idAnuncioOcorrencia);
    map['data_hora'] = Variable<DateTime>(dataHora);
    map['id_militar_responsavel'] = Variable<String>(idMilitarResponsavel);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioOcorrenciaDiarioTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioOcorrenciaDiarioTabelaCompanion(
      idAnuncioOcorrencia: Value(idAnuncioOcorrencia),
      dataHora: Value(dataHora),
      idMilitarResponsavel: Value(idMilitarResponsavel),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioOcorrenciaDiarioTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioOcorrenciaDiarioTabelaData(
      idAnuncioOcorrencia: serializer.fromJson<String>(
        json['idAnuncioOcorrencia'],
      ),
      dataHora: serializer.fromJson<DateTime>(json['dataHora']),
      idMilitarResponsavel: serializer.fromJson<String>(
        json['idMilitarResponsavel'],
      ),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idAnuncioOcorrencia': serializer.toJson<String>(idAnuncioOcorrencia),
      'dataHora': serializer.toJson<DateTime>(dataHora),
      'idMilitarResponsavel': serializer.toJson<String>(idMilitarResponsavel),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioOcorrenciaDiarioTabelaData copyWith({
    String? idAnuncioOcorrencia,
    DateTime? dataHora,
    String? idMilitarResponsavel,
    bool? sincronizado,
  }) => AnuncioOcorrenciaDiarioTabelaData(
    idAnuncioOcorrencia: idAnuncioOcorrencia ?? this.idAnuncioOcorrencia,
    dataHora: dataHora ?? this.dataHora,
    idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioOcorrenciaDiarioTabelaData copyWithCompanion(
    AnuncioOcorrenciaDiarioTabelaCompanion data,
  ) {
    return AnuncioOcorrenciaDiarioTabelaData(
      idAnuncioOcorrencia: data.idAnuncioOcorrencia.present
          ? data.idAnuncioOcorrencia.value
          : this.idAnuncioOcorrencia,
      dataHora: data.dataHora.present ? data.dataHora.value : this.dataHora,
      idMilitarResponsavel: data.idMilitarResponsavel.present
          ? data.idMilitarResponsavel.value
          : this.idMilitarResponsavel,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioOcorrenciaDiarioTabelaData(')
          ..write('idAnuncioOcorrencia: $idAnuncioOcorrencia, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idAnuncioOcorrencia,
    dataHora,
    idMilitarResponsavel,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioOcorrenciaDiarioTabelaData &&
          other.idAnuncioOcorrencia == this.idAnuncioOcorrencia &&
          other.dataHora == this.dataHora &&
          other.idMilitarResponsavel == this.idMilitarResponsavel &&
          other.sincronizado == this.sincronizado);
}

class AnuncioOcorrenciaDiarioTabelaCompanion
    extends UpdateCompanion<AnuncioOcorrenciaDiarioTabelaData> {
  final Value<String> idAnuncioOcorrencia;
  final Value<DateTime> dataHora;
  final Value<String> idMilitarResponsavel;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioOcorrenciaDiarioTabelaCompanion({
    this.idAnuncioOcorrencia = const Value.absent(),
    this.dataHora = const Value.absent(),
    this.idMilitarResponsavel = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioOcorrenciaDiarioTabelaCompanion.insert({
    required String idAnuncioOcorrencia,
    required DateTime dataHora,
    required String idMilitarResponsavel,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idAnuncioOcorrencia = Value(idAnuncioOcorrencia),
       dataHora = Value(dataHora),
       idMilitarResponsavel = Value(idMilitarResponsavel);
  static Insertable<AnuncioOcorrenciaDiarioTabelaData> custom({
    Expression<String>? idAnuncioOcorrencia,
    Expression<DateTime>? dataHora,
    Expression<String>? idMilitarResponsavel,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idAnuncioOcorrencia != null)
        'id_anuncio_ocorrencia': idAnuncioOcorrencia,
      if (dataHora != null) 'data_hora': dataHora,
      if (idMilitarResponsavel != null)
        'id_militar_responsavel': idMilitarResponsavel,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioOcorrenciaDiarioTabelaCompanion copyWith({
    Value<String>? idAnuncioOcorrencia,
    Value<DateTime>? dataHora,
    Value<String>? idMilitarResponsavel,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioOcorrenciaDiarioTabelaCompanion(
      idAnuncioOcorrencia: idAnuncioOcorrencia ?? this.idAnuncioOcorrencia,
      dataHora: dataHora ?? this.dataHora,
      idMilitarResponsavel: idMilitarResponsavel ?? this.idMilitarResponsavel,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idAnuncioOcorrencia.present) {
      map['id_anuncio_ocorrencia'] = Variable<String>(
        idAnuncioOcorrencia.value,
      );
    }
    if (dataHora.present) {
      map['data_hora'] = Variable<DateTime>(dataHora.value);
    }
    if (idMilitarResponsavel.present) {
      map['id_militar_responsavel'] = Variable<String>(
        idMilitarResponsavel.value,
      );
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioOcorrenciaDiarioTabelaCompanion(')
          ..write('idAnuncioOcorrencia: $idAnuncioOcorrencia, ')
          ..write('dataHora: $dataHora, ')
          ..write('idMilitarResponsavel: $idMilitarResponsavel, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnuncioOcorrenciaTabelaTable extends AnuncioOcorrenciaTabela
    with TableInfo<$AnuncioOcorrenciaTabelaTable, AnuncioOcorrenciaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnuncioOcorrenciaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idItemAnuncioOcorrenciaMeta =
      const VerificationMeta('idItemAnuncioOcorrencia');
  @override
  late final GeneratedColumn<String> idItemAnuncioOcorrencia =
      GeneratedColumn<String>(
        'id_item_anuncio_ocorrencia',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _idAnuncioOcorrenciaMeta =
      const VerificationMeta('idAnuncioOcorrencia');
  @override
  late final GeneratedColumn<String> idAnuncioOcorrencia =
      GeneratedColumn<String>(
        'id_anuncio_ocorrencia',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES anuncio_ocorrencia_diario_tabela (id_anuncio_ocorrencia)',
        ),
      );
  static const VerificationMeta _idOcorrenciaMeta = const VerificationMeta(
    'idOcorrencia',
  );
  @override
  late final GeneratedColumn<String> idOcorrencia = GeneratedColumn<String>(
    'id_ocorrencia',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ocorrencia_tabela (id_ocorrencia)',
    ),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idItemAnuncioOcorrencia,
    idAnuncioOcorrencia,
    idOcorrencia,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'anuncio_ocorrencia_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnuncioOcorrenciaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_item_anuncio_ocorrencia')) {
      context.handle(
        _idItemAnuncioOcorrenciaMeta,
        idItemAnuncioOcorrencia.isAcceptableOrUnknown(
          data['id_item_anuncio_ocorrencia']!,
          _idItemAnuncioOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idItemAnuncioOcorrenciaMeta);
    }
    if (data.containsKey('id_anuncio_ocorrencia')) {
      context.handle(
        _idAnuncioOcorrenciaMeta,
        idAnuncioOcorrencia.isAcceptableOrUnknown(
          data['id_anuncio_ocorrencia']!,
          _idAnuncioOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idAnuncioOcorrenciaMeta);
    }
    if (data.containsKey('id_ocorrencia')) {
      context.handle(
        _idOcorrenciaMeta,
        idOcorrencia.isAcceptableOrUnknown(
          data['id_ocorrencia']!,
          _idOcorrenciaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOcorrenciaMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idItemAnuncioOcorrencia};
  @override
  AnuncioOcorrenciaTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnuncioOcorrenciaTabelaData(
      idItemAnuncioOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_item_anuncio_ocorrencia'],
      )!,
      idAnuncioOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_anuncio_ocorrencia'],
      )!,
      idOcorrencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_ocorrencia'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $AnuncioOcorrenciaTabelaTable createAlias(String alias) {
    return $AnuncioOcorrenciaTabelaTable(attachedDatabase, alias);
  }
}

class AnuncioOcorrenciaTabelaData extends DataClass
    implements Insertable<AnuncioOcorrenciaTabelaData> {
  final String idItemAnuncioOcorrencia;
  final String idAnuncioOcorrencia;
  final String idOcorrencia;
  final bool sincronizado;
  const AnuncioOcorrenciaTabelaData({
    required this.idItemAnuncioOcorrencia,
    required this.idAnuncioOcorrencia,
    required this.idOcorrencia,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_item_anuncio_ocorrencia'] = Variable<String>(
      idItemAnuncioOcorrencia,
    );
    map['id_anuncio_ocorrencia'] = Variable<String>(idAnuncioOcorrencia);
    map['id_ocorrencia'] = Variable<String>(idOcorrencia);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  AnuncioOcorrenciaTabelaCompanion toCompanion(bool nullToAbsent) {
    return AnuncioOcorrenciaTabelaCompanion(
      idItemAnuncioOcorrencia: Value(idItemAnuncioOcorrencia),
      idAnuncioOcorrencia: Value(idAnuncioOcorrencia),
      idOcorrencia: Value(idOcorrencia),
      sincronizado: Value(sincronizado),
    );
  }

  factory AnuncioOcorrenciaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnuncioOcorrenciaTabelaData(
      idItemAnuncioOcorrencia: serializer.fromJson<String>(
        json['idItemAnuncioOcorrencia'],
      ),
      idAnuncioOcorrencia: serializer.fromJson<String>(
        json['idAnuncioOcorrencia'],
      ),
      idOcorrencia: serializer.fromJson<String>(json['idOcorrencia']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idItemAnuncioOcorrencia': serializer.toJson<String>(
        idItemAnuncioOcorrencia,
      ),
      'idAnuncioOcorrencia': serializer.toJson<String>(idAnuncioOcorrencia),
      'idOcorrencia': serializer.toJson<String>(idOcorrencia),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  AnuncioOcorrenciaTabelaData copyWith({
    String? idItemAnuncioOcorrencia,
    String? idAnuncioOcorrencia,
    String? idOcorrencia,
    bool? sincronizado,
  }) => AnuncioOcorrenciaTabelaData(
    idItemAnuncioOcorrencia:
        idItemAnuncioOcorrencia ?? this.idItemAnuncioOcorrencia,
    idAnuncioOcorrencia: idAnuncioOcorrencia ?? this.idAnuncioOcorrencia,
    idOcorrencia: idOcorrencia ?? this.idOcorrencia,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  AnuncioOcorrenciaTabelaData copyWithCompanion(
    AnuncioOcorrenciaTabelaCompanion data,
  ) {
    return AnuncioOcorrenciaTabelaData(
      idItemAnuncioOcorrencia: data.idItemAnuncioOcorrencia.present
          ? data.idItemAnuncioOcorrencia.value
          : this.idItemAnuncioOcorrencia,
      idAnuncioOcorrencia: data.idAnuncioOcorrencia.present
          ? data.idAnuncioOcorrencia.value
          : this.idAnuncioOcorrencia,
      idOcorrencia: data.idOcorrencia.present
          ? data.idOcorrencia.value
          : this.idOcorrencia,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioOcorrenciaTabelaData(')
          ..write('idItemAnuncioOcorrencia: $idItemAnuncioOcorrencia, ')
          ..write('idAnuncioOcorrencia: $idAnuncioOcorrencia, ')
          ..write('idOcorrencia: $idOcorrencia, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idItemAnuncioOcorrencia,
    idAnuncioOcorrencia,
    idOcorrencia,
    sincronizado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnuncioOcorrenciaTabelaData &&
          other.idItemAnuncioOcorrencia == this.idItemAnuncioOcorrencia &&
          other.idAnuncioOcorrencia == this.idAnuncioOcorrencia &&
          other.idOcorrencia == this.idOcorrencia &&
          other.sincronizado == this.sincronizado);
}

class AnuncioOcorrenciaTabelaCompanion
    extends UpdateCompanion<AnuncioOcorrenciaTabelaData> {
  final Value<String> idItemAnuncioOcorrencia;
  final Value<String> idAnuncioOcorrencia;
  final Value<String> idOcorrencia;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const AnuncioOcorrenciaTabelaCompanion({
    this.idItemAnuncioOcorrencia = const Value.absent(),
    this.idAnuncioOcorrencia = const Value.absent(),
    this.idOcorrencia = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnuncioOcorrenciaTabelaCompanion.insert({
    required String idItemAnuncioOcorrencia,
    required String idAnuncioOcorrencia,
    required String idOcorrencia,
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idItemAnuncioOcorrencia = Value(idItemAnuncioOcorrencia),
       idAnuncioOcorrencia = Value(idAnuncioOcorrencia),
       idOcorrencia = Value(idOcorrencia);
  static Insertable<AnuncioOcorrenciaTabelaData> custom({
    Expression<String>? idItemAnuncioOcorrencia,
    Expression<String>? idAnuncioOcorrencia,
    Expression<String>? idOcorrencia,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idItemAnuncioOcorrencia != null)
        'id_item_anuncio_ocorrencia': idItemAnuncioOcorrencia,
      if (idAnuncioOcorrencia != null)
        'id_anuncio_ocorrencia': idAnuncioOcorrencia,
      if (idOcorrencia != null) 'id_ocorrencia': idOcorrencia,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnuncioOcorrenciaTabelaCompanion copyWith({
    Value<String>? idItemAnuncioOcorrencia,
    Value<String>? idAnuncioOcorrencia,
    Value<String>? idOcorrencia,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return AnuncioOcorrenciaTabelaCompanion(
      idItemAnuncioOcorrencia:
          idItemAnuncioOcorrencia ?? this.idItemAnuncioOcorrencia,
      idAnuncioOcorrencia: idAnuncioOcorrencia ?? this.idAnuncioOcorrencia,
      idOcorrencia: idOcorrencia ?? this.idOcorrencia,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idItemAnuncioOcorrencia.present) {
      map['id_item_anuncio_ocorrencia'] = Variable<String>(
        idItemAnuncioOcorrencia.value,
      );
    }
    if (idAnuncioOcorrencia.present) {
      map['id_anuncio_ocorrencia'] = Variable<String>(
        idAnuncioOcorrencia.value,
      );
    }
    if (idOcorrencia.present) {
      map['id_ocorrencia'] = Variable<String>(idOcorrencia.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnuncioOcorrenciaTabelaCompanion(')
          ..write('idItemAnuncioOcorrencia: $idItemAnuncioOcorrencia, ')
          ..write('idAnuncioOcorrencia: $idAnuncioOcorrencia, ')
          ..write('idOcorrencia: $idOcorrencia, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MilitarTabelaTable militarTabela = $MilitarTabelaTable(this);
  late final $AnuncioMilitarDiarioTabelaTable anuncioMilitarDiarioTabela =
      $AnuncioMilitarDiarioTabelaTable(this);
  late final $AnuncioMilitarTabelaTable anuncioMilitarTabela =
      $AnuncioMilitarTabelaTable(this);
  late final $AnuncioViaturaDiarioTabelaTable anuncioViaturaDiarioTabela =
      $AnuncioViaturaDiarioTabelaTable(this);
  late final $CursoTabelaTable cursoTabela = $CursoTabelaTable(this);
  late final $ViaturaTabelaTable viaturaTabela = $ViaturaTabelaTable(this);
  late final $AnuncioViaturaTabelaTable anuncioViaturaTabela =
      $AnuncioViaturaTabelaTable(this);
  late final $MilitarCursoTabelaTable militarCursoTabela =
      $MilitarCursoTabelaTable(this);
  late final $DemandaTabelaTable demandaTabela = $DemandaTabelaTable(this);
  late final $OcorrenciaTabelaTable ocorrenciaTabela = $OcorrenciaTabelaTable(
    this,
  );
  late final $AnuncioOcorrenciaDiarioTabelaTable anuncioOcorrenciaDiarioTabela =
      $AnuncioOcorrenciaDiarioTabelaTable(this);
  late final $AnuncioOcorrenciaTabelaTable anuncioOcorrenciaTabela =
      $AnuncioOcorrenciaTabelaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    militarTabela,
    anuncioMilitarDiarioTabela,
    anuncioMilitarTabela,
    anuncioViaturaDiarioTabela,
    cursoTabela,
    viaturaTabela,
    anuncioViaturaTabela,
    militarCursoTabela,
    demandaTabela,
    ocorrenciaTabela,
    anuncioOcorrenciaDiarioTabela,
    anuncioOcorrenciaTabela,
  ];
}

typedef $$MilitarTabelaTableCreateCompanionBuilder =
    MilitarTabelaCompanion Function({
      required String idMilitar,
      required String cpf,
      required String numeroBM,
      required String nomeCompleto,
      required String nomeDeGuerra,
      required String cargo,
      required String credencialMotorista,
      required DateTime dataNascimento,
      required String estadoCivil,
      required String unidadeAtual,
      required String rua,
      required String bairro,
      required String cidade,
      required String numero,
      required String cep,
      required String complementoEndereco,
      required String telefone,
      required String email,
      required String naturalidade,
      required String urlImagem,
      required String funcao,
      required String numeroConta,
      required String banco,
      required String numeroAg,
      required String quantidadeAdi,
      required String obs,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$MilitarTabelaTableUpdateCompanionBuilder =
    MilitarTabelaCompanion Function({
      Value<String> idMilitar,
      Value<String> cpf,
      Value<String> numeroBM,
      Value<String> nomeCompleto,
      Value<String> nomeDeGuerra,
      Value<String> cargo,
      Value<String> credencialMotorista,
      Value<DateTime> dataNascimento,
      Value<String> estadoCivil,
      Value<String> unidadeAtual,
      Value<String> rua,
      Value<String> bairro,
      Value<String> cidade,
      Value<String> numero,
      Value<String> cep,
      Value<String> complementoEndereco,
      Value<String> telefone,
      Value<String> email,
      Value<String> naturalidade,
      Value<String> urlImagem,
      Value<String> funcao,
      Value<String> numeroConta,
      Value<String> banco,
      Value<String> numeroAg,
      Value<String> quantidadeAdi,
      Value<String> obs,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$MilitarTabelaTableReferences
    extends
        BaseReferences<_$AppDatabase, $MilitarTabelaTable, MilitarTabelaData> {
  $$MilitarTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AnuncioMilitarTabelaTable,
    List<AnuncioMilitarTabelaData>
  >
  _anuncioMilitarTabelaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.anuncioMilitarTabela,
        aliasName:
            'militar_tabela__id_militar__anuncio_militar_tabela__id_militar',
      );

  $$AnuncioMilitarTabelaTableProcessedTableManager
  get anuncioMilitarTabelaRefs {
    final manager =
        $$AnuncioMilitarTabelaTableTableManager(
          $_db,
          $_db.anuncioMilitarTabela,
        ).filter(
          (f) => f.idMilitar.idMilitar.sqlEquals(
            $_itemColumn<String>('id_militar')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioMilitarTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $MilitarCursoTabelaTable,
    List<MilitarCursoTabelaData>
  >
  _militarCursoTabelaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.militarCursoTabela,
        aliasName:
            'militar_tabela__id_militar__militar_curso_tabela__id_militar',
      );

  $$MilitarCursoTabelaTableProcessedTableManager get militarCursoTabelaRefs {
    final manager =
        $$MilitarCursoTabelaTableTableManager(
          $_db,
          $_db.militarCursoTabela,
        ).filter(
          (f) => f.idMilitar.idMilitar.sqlEquals(
            $_itemColumn<String>('id_militar')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _militarCursoTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DemandaTabelaTable, List<DemandaTabelaData>>
  _demandaTabelaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.demandaTabela,
    aliasName:
        'militar_tabela__id_militar__demanda_tabela__id_militar_responsavel',
  );

  $$DemandaTabelaTableProcessedTableManager get demandaTabelaRefs {
    final manager = $$DemandaTabelaTableTableManager($_db, $_db.demandaTabela)
        .filter(
          (f) => f.idMilitarResponsavel.idMilitar.sqlEquals(
            $_itemColumn<String>('id_militar')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_demandaTabelaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $AnuncioOcorrenciaDiarioTabelaTable,
    List<AnuncioOcorrenciaDiarioTabelaData>
  >
  _anuncioOcorrenciaDiarioTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.anuncioOcorrenciaDiarioTabela,
    aliasName:
        'militar_tabela__id_militar__anuncio_ocorrencia_diario_tabela__id_militar_responsavel',
  );

  $$AnuncioOcorrenciaDiarioTabelaTableProcessedTableManager
  get anuncioOcorrenciaDiarioTabelaRefs {
    final manager =
        $$AnuncioOcorrenciaDiarioTabelaTableTableManager(
          $_db,
          $_db.anuncioOcorrenciaDiarioTabela,
        ).filter(
          (f) => f.idMilitarResponsavel.idMilitar.sqlEquals(
            $_itemColumn<String>('id_militar')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioOcorrenciaDiarioTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MilitarTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $MilitarTabelaTable> {
  $$MilitarTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idMilitar => $composableBuilder(
    column: $table.idMilitar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroBM => $composableBuilder(
    column: $table.numeroBM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeCompleto => $composableBuilder(
    column: $table.nomeCompleto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeDeGuerra => $composableBuilder(
    column: $table.nomeDeGuerra,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get credencialMotorista => $composableBuilder(
    column: $table.credencialMotorista,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estadoCivil => $composableBuilder(
    column: $table.estadoCivil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unidadeAtual => $composableBuilder(
    column: $table.unidadeAtual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rua => $composableBuilder(
    column: $table.rua,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bairro => $composableBuilder(
    column: $table.bairro,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cidade => $composableBuilder(
    column: $table.cidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get complementoEndereco => $composableBuilder(
    column: $table.complementoEndereco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefone => $composableBuilder(
    column: $table.telefone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get naturalidade => $composableBuilder(
    column: $table.naturalidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlImagem => $composableBuilder(
    column: $table.urlImagem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroConta => $composableBuilder(
    column: $table.numeroConta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get banco => $composableBuilder(
    column: $table.banco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroAg => $composableBuilder(
    column: $table.numeroAg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantidadeAdi => $composableBuilder(
    column: $table.quantidadeAdi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get obs => $composableBuilder(
    column: $table.obs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> anuncioMilitarTabelaRefs(
    Expression<bool> Function($$AnuncioMilitarTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioMilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.anuncioMilitarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnuncioMilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.anuncioMilitarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> militarCursoTabelaRefs(
    Expression<bool> Function($$MilitarCursoTabelaTableFilterComposer f) f,
  ) {
    final $$MilitarCursoTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarCursoTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarCursoTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarCursoTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> demandaTabelaRefs(
    Expression<bool> Function($$DemandaTabelaTableFilterComposer f) f,
  ) {
    final $$DemandaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.demandaTabela,
      getReferencedColumn: (t) => t.idMilitarResponsavel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DemandaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.demandaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> anuncioOcorrenciaDiarioTabelaRefs(
    Expression<bool> Function(
      $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer f,
    )
    f,
  ) {
    final $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idMilitar,
          referencedTable: $db.anuncioOcorrenciaDiarioTabela,
          getReferencedColumn: (t) => t.idMilitarResponsavel,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilitarTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $MilitarTabelaTable> {
  $$MilitarTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idMilitar => $composableBuilder(
    column: $table.idMilitar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroBM => $composableBuilder(
    column: $table.numeroBM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeCompleto => $composableBuilder(
    column: $table.nomeCompleto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeDeGuerra => $composableBuilder(
    column: $table.nomeDeGuerra,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cargo => $composableBuilder(
    column: $table.cargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get credencialMotorista => $composableBuilder(
    column: $table.credencialMotorista,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estadoCivil => $composableBuilder(
    column: $table.estadoCivil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unidadeAtual => $composableBuilder(
    column: $table.unidadeAtual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rua => $composableBuilder(
    column: $table.rua,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bairro => $composableBuilder(
    column: $table.bairro,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cidade => $composableBuilder(
    column: $table.cidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cep => $composableBuilder(
    column: $table.cep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get complementoEndereco => $composableBuilder(
    column: $table.complementoEndereco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefone => $composableBuilder(
    column: $table.telefone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get naturalidade => $composableBuilder(
    column: $table.naturalidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlImagem => $composableBuilder(
    column: $table.urlImagem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get funcao => $composableBuilder(
    column: $table.funcao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroConta => $composableBuilder(
    column: $table.numeroConta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get banco => $composableBuilder(
    column: $table.banco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroAg => $composableBuilder(
    column: $table.numeroAg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantidadeAdi => $composableBuilder(
    column: $table.quantidadeAdi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get obs => $composableBuilder(
    column: $table.obs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MilitarTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilitarTabelaTable> {
  $$MilitarTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idMilitar =>
      $composableBuilder(column: $table.idMilitar, builder: (column) => column);

  GeneratedColumn<String> get cpf =>
      $composableBuilder(column: $table.cpf, builder: (column) => column);

  GeneratedColumn<String> get numeroBM =>
      $composableBuilder(column: $table.numeroBM, builder: (column) => column);

  GeneratedColumn<String> get nomeCompleto => $composableBuilder(
    column: $table.nomeCompleto,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nomeDeGuerra => $composableBuilder(
    column: $table.nomeDeGuerra,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cargo =>
      $composableBuilder(column: $table.cargo, builder: (column) => column);

  GeneratedColumn<String> get credencialMotorista => $composableBuilder(
    column: $table.credencialMotorista,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataNascimento => $composableBuilder(
    column: $table.dataNascimento,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estadoCivil => $composableBuilder(
    column: $table.estadoCivil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unidadeAtual => $composableBuilder(
    column: $table.unidadeAtual,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rua =>
      $composableBuilder(column: $table.rua, builder: (column) => column);

  GeneratedColumn<String> get bairro =>
      $composableBuilder(column: $table.bairro, builder: (column) => column);

  GeneratedColumn<String> get cidade =>
      $composableBuilder(column: $table.cidade, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get complementoEndereco => $composableBuilder(
    column: $table.complementoEndereco,
    builder: (column) => column,
  );

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get naturalidade => $composableBuilder(
    column: $table.naturalidade,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlImagem =>
      $composableBuilder(column: $table.urlImagem, builder: (column) => column);

  GeneratedColumn<String> get funcao =>
      $composableBuilder(column: $table.funcao, builder: (column) => column);

  GeneratedColumn<String> get numeroConta => $composableBuilder(
    column: $table.numeroConta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get banco =>
      $composableBuilder(column: $table.banco, builder: (column) => column);

  GeneratedColumn<String> get numeroAg =>
      $composableBuilder(column: $table.numeroAg, builder: (column) => column);

  GeneratedColumn<String> get quantidadeAdi => $composableBuilder(
    column: $table.quantidadeAdi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get obs =>
      $composableBuilder(column: $table.obs, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> anuncioMilitarTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioMilitarTabelaTableAnnotationComposer a) f,
  ) {
    final $$AnuncioMilitarTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idMilitar,
          referencedTable: $db.anuncioMilitarTabela,
          getReferencedColumn: (t) => t.idMilitar,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioMilitarTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioMilitarTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> militarCursoTabelaRefs<T extends Object>(
    Expression<T> Function($$MilitarCursoTabelaTableAnnotationComposer a) f,
  ) {
    final $$MilitarCursoTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idMilitar,
          referencedTable: $db.militarCursoTabela,
          getReferencedColumn: (t) => t.idMilitar,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MilitarCursoTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.militarCursoTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> demandaTabelaRefs<T extends Object>(
    Expression<T> Function($$DemandaTabelaTableAnnotationComposer a) f,
  ) {
    final $$DemandaTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.demandaTabela,
      getReferencedColumn: (t) => t.idMilitarResponsavel,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DemandaTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.demandaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> anuncioOcorrenciaDiarioTabelaRefs<T extends Object>(
    Expression<T> Function(
      $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idMilitar,
          referencedTable: $db.anuncioOcorrenciaDiarioTabela,
          getReferencedColumn: (t) => t.idMilitarResponsavel,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilitarTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilitarTabelaTable,
          MilitarTabelaData,
          $$MilitarTabelaTableFilterComposer,
          $$MilitarTabelaTableOrderingComposer,
          $$MilitarTabelaTableAnnotationComposer,
          $$MilitarTabelaTableCreateCompanionBuilder,
          $$MilitarTabelaTableUpdateCompanionBuilder,
          (MilitarTabelaData, $$MilitarTabelaTableReferences),
          MilitarTabelaData,
          PrefetchHooks Function({
            bool anuncioMilitarTabelaRefs,
            bool militarCursoTabelaRefs,
            bool demandaTabelaRefs,
            bool anuncioOcorrenciaDiarioTabelaRefs,
          })
        > {
  $$MilitarTabelaTableTableManager(_$AppDatabase db, $MilitarTabelaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilitarTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilitarTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilitarTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idMilitar = const Value.absent(),
                Value<String> cpf = const Value.absent(),
                Value<String> numeroBM = const Value.absent(),
                Value<String> nomeCompleto = const Value.absent(),
                Value<String> nomeDeGuerra = const Value.absent(),
                Value<String> cargo = const Value.absent(),
                Value<String> credencialMotorista = const Value.absent(),
                Value<DateTime> dataNascimento = const Value.absent(),
                Value<String> estadoCivil = const Value.absent(),
                Value<String> unidadeAtual = const Value.absent(),
                Value<String> rua = const Value.absent(),
                Value<String> bairro = const Value.absent(),
                Value<String> cidade = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<String> cep = const Value.absent(),
                Value<String> complementoEndereco = const Value.absent(),
                Value<String> telefone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> naturalidade = const Value.absent(),
                Value<String> urlImagem = const Value.absent(),
                Value<String> funcao = const Value.absent(),
                Value<String> numeroConta = const Value.absent(),
                Value<String> banco = const Value.absent(),
                Value<String> numeroAg = const Value.absent(),
                Value<String> quantidadeAdi = const Value.absent(),
                Value<String> obs = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilitarTabelaCompanion(
                idMilitar: idMilitar,
                cpf: cpf,
                numeroBM: numeroBM,
                nomeCompleto: nomeCompleto,
                nomeDeGuerra: nomeDeGuerra,
                cargo: cargo,
                credencialMotorista: credencialMotorista,
                dataNascimento: dataNascimento,
                estadoCivil: estadoCivil,
                unidadeAtual: unidadeAtual,
                rua: rua,
                bairro: bairro,
                cidade: cidade,
                numero: numero,
                cep: cep,
                complementoEndereco: complementoEndereco,
                telefone: telefone,
                email: email,
                naturalidade: naturalidade,
                urlImagem: urlImagem,
                funcao: funcao,
                numeroConta: numeroConta,
                banco: banco,
                numeroAg: numeroAg,
                quantidadeAdi: quantidadeAdi,
                obs: obs,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idMilitar,
                required String cpf,
                required String numeroBM,
                required String nomeCompleto,
                required String nomeDeGuerra,
                required String cargo,
                required String credencialMotorista,
                required DateTime dataNascimento,
                required String estadoCivil,
                required String unidadeAtual,
                required String rua,
                required String bairro,
                required String cidade,
                required String numero,
                required String cep,
                required String complementoEndereco,
                required String telefone,
                required String email,
                required String naturalidade,
                required String urlImagem,
                required String funcao,
                required String numeroConta,
                required String banco,
                required String numeroAg,
                required String quantidadeAdi,
                required String obs,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilitarTabelaCompanion.insert(
                idMilitar: idMilitar,
                cpf: cpf,
                numeroBM: numeroBM,
                nomeCompleto: nomeCompleto,
                nomeDeGuerra: nomeDeGuerra,
                cargo: cargo,
                credencialMotorista: credencialMotorista,
                dataNascimento: dataNascimento,
                estadoCivil: estadoCivil,
                unidadeAtual: unidadeAtual,
                rua: rua,
                bairro: bairro,
                cidade: cidade,
                numero: numero,
                cep: cep,
                complementoEndereco: complementoEndereco,
                telefone: telefone,
                email: email,
                naturalidade: naturalidade,
                urlImagem: urlImagem,
                funcao: funcao,
                numeroConta: numeroConta,
                banco: banco,
                numeroAg: numeroAg,
                quantidadeAdi: quantidadeAdi,
                obs: obs,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MilitarTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                anuncioMilitarTabelaRefs = false,
                militarCursoTabelaRefs = false,
                demandaTabelaRefs = false,
                anuncioOcorrenciaDiarioTabelaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (anuncioMilitarTabelaRefs) db.anuncioMilitarTabela,
                    if (militarCursoTabelaRefs) db.militarCursoTabela,
                    if (demandaTabelaRefs) db.demandaTabela,
                    if (anuncioOcorrenciaDiarioTabelaRefs)
                      db.anuncioOcorrenciaDiarioTabela,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (anuncioMilitarTabelaRefs)
                        await $_getPrefetchedData<
                          MilitarTabelaData,
                          $MilitarTabelaTable,
                          AnuncioMilitarTabelaData
                        >(
                          currentTable: table,
                          referencedTable: $$MilitarTabelaTableReferences
                              ._anuncioMilitarTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilitarTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).anuncioMilitarTabelaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idMilitar == item.idMilitar,
                              ),
                          typedResults: items,
                        ),
                      if (militarCursoTabelaRefs)
                        await $_getPrefetchedData<
                          MilitarTabelaData,
                          $MilitarTabelaTable,
                          MilitarCursoTabelaData
                        >(
                          currentTable: table,
                          referencedTable: $$MilitarTabelaTableReferences
                              ._militarCursoTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilitarTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).militarCursoTabelaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idMilitar == item.idMilitar,
                              ),
                          typedResults: items,
                        ),
                      if (demandaTabelaRefs)
                        await $_getPrefetchedData<
                          MilitarTabelaData,
                          $MilitarTabelaTable,
                          DemandaTabelaData
                        >(
                          currentTable: table,
                          referencedTable: $$MilitarTabelaTableReferences
                              ._demandaTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilitarTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).demandaTabelaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idMilitarResponsavel == item.idMilitar,
                              ),
                          typedResults: items,
                        ),
                      if (anuncioOcorrenciaDiarioTabelaRefs)
                        await $_getPrefetchedData<
                          MilitarTabelaData,
                          $MilitarTabelaTable,
                          AnuncioOcorrenciaDiarioTabelaData
                        >(
                          currentTable: table,
                          referencedTable: $$MilitarTabelaTableReferences
                              ._anuncioOcorrenciaDiarioTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilitarTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).anuncioOcorrenciaDiarioTabelaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idMilitarResponsavel == item.idMilitar,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MilitarTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilitarTabelaTable,
      MilitarTabelaData,
      $$MilitarTabelaTableFilterComposer,
      $$MilitarTabelaTableOrderingComposer,
      $$MilitarTabelaTableAnnotationComposer,
      $$MilitarTabelaTableCreateCompanionBuilder,
      $$MilitarTabelaTableUpdateCompanionBuilder,
      (MilitarTabelaData, $$MilitarTabelaTableReferences),
      MilitarTabelaData,
      PrefetchHooks Function({
        bool anuncioMilitarTabelaRefs,
        bool militarCursoTabelaRefs,
        bool demandaTabelaRefs,
        bool anuncioOcorrenciaDiarioTabelaRefs,
      })
    >;
typedef $$AnuncioMilitarDiarioTabelaTableCreateCompanionBuilder =
    AnuncioMilitarDiarioTabelaCompanion Function({
      required String idAnuncioMilitar,
      required DateTime dataHora,
      required String idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioMilitarDiarioTabelaTableUpdateCompanionBuilder =
    AnuncioMilitarDiarioTabelaCompanion Function({
      Value<String> idAnuncioMilitar,
      Value<DateTime> dataHora,
      Value<String> idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioMilitarDiarioTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioMilitarDiarioTabelaTable,
          AnuncioMilitarDiarioTabelaData
        > {
  $$AnuncioMilitarDiarioTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AnuncioMilitarTabelaTable,
    List<AnuncioMilitarTabelaData>
  >
  _anuncioMilitarTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.anuncioMilitarTabela,
    aliasName:
        'anuncio_militar_diario_tabela__id_anuncio_militar__anuncio_militar_tabela__id_anuncio',
  );

  $$AnuncioMilitarTabelaTableProcessedTableManager
  get anuncioMilitarTabelaRefs {
    final manager =
        $$AnuncioMilitarTabelaTableTableManager(
          $_db,
          $_db.anuncioMilitarTabela,
        ).filter(
          (f) => f.idAnuncio.idAnuncioMilitar.sqlEquals(
            $_itemColumn<String>('id_anuncio_militar')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioMilitarTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AnuncioMilitarDiarioTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarDiarioTabelaTable> {
  $$AnuncioMilitarDiarioTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idAnuncioMilitar => $composableBuilder(
    column: $table.idAnuncioMilitar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> anuncioMilitarTabelaRefs(
    Expression<bool> Function($$AnuncioMilitarTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioMilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAnuncioMilitar,
      referencedTable: $db.anuncioMilitarTabela,
      getReferencedColumn: (t) => t.idAnuncio,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnuncioMilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.anuncioMilitarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnuncioMilitarDiarioTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarDiarioTabelaTable> {
  $$AnuncioMilitarDiarioTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idAnuncioMilitar => $composableBuilder(
    column: $table.idAnuncioMilitar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnuncioMilitarDiarioTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarDiarioTabelaTable> {
  $$AnuncioMilitarDiarioTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idAnuncioMilitar => $composableBuilder(
    column: $table.idAnuncioMilitar,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataHora =>
      $composableBuilder(column: $table.dataHora, builder: (column) => column);

  GeneratedColumn<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> anuncioMilitarTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioMilitarTabelaTableAnnotationComposer a) f,
  ) {
    final $$AnuncioMilitarTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioMilitar,
          referencedTable: $db.anuncioMilitarTabela,
          getReferencedColumn: (t) => t.idAnuncio,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioMilitarTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioMilitarTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AnuncioMilitarDiarioTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioMilitarDiarioTabelaTable,
          AnuncioMilitarDiarioTabelaData,
          $$AnuncioMilitarDiarioTabelaTableFilterComposer,
          $$AnuncioMilitarDiarioTabelaTableOrderingComposer,
          $$AnuncioMilitarDiarioTabelaTableAnnotationComposer,
          $$AnuncioMilitarDiarioTabelaTableCreateCompanionBuilder,
          $$AnuncioMilitarDiarioTabelaTableUpdateCompanionBuilder,
          (
            AnuncioMilitarDiarioTabelaData,
            $$AnuncioMilitarDiarioTabelaTableReferences,
          ),
          AnuncioMilitarDiarioTabelaData,
          PrefetchHooks Function({bool anuncioMilitarTabelaRefs})
        > {
  $$AnuncioMilitarDiarioTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioMilitarDiarioTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioMilitarDiarioTabelaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AnuncioMilitarDiarioTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioMilitarDiarioTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idAnuncioMilitar = const Value.absent(),
                Value<DateTime> dataHora = const Value.absent(),
                Value<String> idMilitarResponsavel = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioMilitarDiarioTabelaCompanion(
                idAnuncioMilitar: idAnuncioMilitar,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idAnuncioMilitar,
                required DateTime dataHora,
                required String idMilitarResponsavel,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioMilitarDiarioTabelaCompanion.insert(
                idAnuncioMilitar: idAnuncioMilitar,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioMilitarDiarioTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({anuncioMilitarTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (anuncioMilitarTabelaRefs) db.anuncioMilitarTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (anuncioMilitarTabelaRefs)
                    await $_getPrefetchedData<
                      AnuncioMilitarDiarioTabelaData,
                      $AnuncioMilitarDiarioTabelaTable,
                      AnuncioMilitarTabelaData
                    >(
                      currentTable: table,
                      referencedTable:
                          $$AnuncioMilitarDiarioTabelaTableReferences
                              ._anuncioMilitarTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AnuncioMilitarDiarioTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).anuncioMilitarTabelaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idAnuncio == item.idAnuncioMilitar,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AnuncioMilitarDiarioTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioMilitarDiarioTabelaTable,
      AnuncioMilitarDiarioTabelaData,
      $$AnuncioMilitarDiarioTabelaTableFilterComposer,
      $$AnuncioMilitarDiarioTabelaTableOrderingComposer,
      $$AnuncioMilitarDiarioTabelaTableAnnotationComposer,
      $$AnuncioMilitarDiarioTabelaTableCreateCompanionBuilder,
      $$AnuncioMilitarDiarioTabelaTableUpdateCompanionBuilder,
      (
        AnuncioMilitarDiarioTabelaData,
        $$AnuncioMilitarDiarioTabelaTableReferences,
      ),
      AnuncioMilitarDiarioTabelaData,
      PrefetchHooks Function({bool anuncioMilitarTabelaRefs})
    >;
typedef $$AnuncioMilitarTabelaTableCreateCompanionBuilder =
    AnuncioMilitarTabelaCompanion Function({
      required String idMilitar,
      required String idAnuncio,
      required String destinacaoMilitar,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioMilitarTabelaTableUpdateCompanionBuilder =
    AnuncioMilitarTabelaCompanion Function({
      Value<String> idMilitar,
      Value<String> idAnuncio,
      Value<String> destinacaoMilitar,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioMilitarTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioMilitarTabelaTable,
          AnuncioMilitarTabelaData
        > {
  $$AnuncioMilitarTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilitarTabelaTable _idMilitarTable(_$AppDatabase db) =>
      db.militarTabela.createAlias(
        'anuncio_militar_tabela__id_militar__militar_tabela__id_militar',
      );

  $$MilitarTabelaTableProcessedTableManager get idMilitar {
    final $_column = $_itemColumn<String>('id_militar')!;

    final manager = $$MilitarTabelaTableTableManager(
      $_db,
      $_db.militarTabela,
    ).filter((f) => f.idMilitar.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idMilitarTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnuncioMilitarDiarioTabelaTable _idAnuncioTable(
    _$AppDatabase db,
  ) => db.anuncioMilitarDiarioTabela.createAlias(
    'anuncio_militar_tabela__id_anuncio__anuncio_militar_diario_tabela__id_anuncio_militar',
  );

  $$AnuncioMilitarDiarioTabelaTableProcessedTableManager get idAnuncio {
    final $_column = $_itemColumn<String>('id_anuncio')!;

    final manager = $$AnuncioMilitarDiarioTabelaTableTableManager(
      $_db,
      $_db.anuncioMilitarDiarioTabela,
    ).filter((f) => f.idAnuncioMilitar.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAnuncioTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnuncioMilitarTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarTabelaTable> {
  $$AnuncioMilitarTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get destinacaoMilitar => $composableBuilder(
    column: $table.destinacaoMilitar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$MilitarTabelaTableFilterComposer get idMilitar {
    final $$MilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioMilitarDiarioTabelaTableFilterComposer get idAnuncio {
    final $$AnuncioMilitarDiarioTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioMilitarDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioMilitar,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioMilitarDiarioTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioMilitarDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioMilitarTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarTabelaTable> {
  $$AnuncioMilitarTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get destinacaoMilitar => $composableBuilder(
    column: $table.destinacaoMilitar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilitarTabelaTableOrderingComposer get idMilitar {
    final $$MilitarTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioMilitarDiarioTabelaTableOrderingComposer get idAnuncio {
    final $$AnuncioMilitarDiarioTabelaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioMilitarDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioMilitar,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioMilitarDiarioTabelaTableOrderingComposer(
                $db: $db,
                $table: $db.anuncioMilitarDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioMilitarTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioMilitarTabelaTable> {
  $$AnuncioMilitarTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get destinacaoMilitar => $composableBuilder(
    column: $table.destinacaoMilitar,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$MilitarTabelaTableAnnotationComposer get idMilitar {
    final $$MilitarTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioMilitarDiarioTabelaTableAnnotationComposer get idAnuncio {
    final $$AnuncioMilitarDiarioTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioMilitarDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioMilitar,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioMilitarDiarioTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioMilitarDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioMilitarTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioMilitarTabelaTable,
          AnuncioMilitarTabelaData,
          $$AnuncioMilitarTabelaTableFilterComposer,
          $$AnuncioMilitarTabelaTableOrderingComposer,
          $$AnuncioMilitarTabelaTableAnnotationComposer,
          $$AnuncioMilitarTabelaTableCreateCompanionBuilder,
          $$AnuncioMilitarTabelaTableUpdateCompanionBuilder,
          (AnuncioMilitarTabelaData, $$AnuncioMilitarTabelaTableReferences),
          AnuncioMilitarTabelaData,
          PrefetchHooks Function({bool idMilitar, bool idAnuncio})
        > {
  $$AnuncioMilitarTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioMilitarTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioMilitarTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnuncioMilitarTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioMilitarTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idMilitar = const Value.absent(),
                Value<String> idAnuncio = const Value.absent(),
                Value<String> destinacaoMilitar = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioMilitarTabelaCompanion(
                idMilitar: idMilitar,
                idAnuncio: idAnuncio,
                destinacaoMilitar: destinacaoMilitar,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idMilitar,
                required String idAnuncio,
                required String destinacaoMilitar,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioMilitarTabelaCompanion.insert(
                idMilitar: idMilitar,
                idAnuncio: idAnuncio,
                destinacaoMilitar: destinacaoMilitar,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioMilitarTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idMilitar = false, idAnuncio = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idMilitar) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idMilitar,
                                referencedTable:
                                    $$AnuncioMilitarTabelaTableReferences
                                        ._idMilitarTable(db),
                                referencedColumn:
                                    $$AnuncioMilitarTabelaTableReferences
                                        ._idMilitarTable(db)
                                        .idMilitar,
                              )
                              as T;
                    }
                    if (idAnuncio) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idAnuncio,
                                referencedTable:
                                    $$AnuncioMilitarTabelaTableReferences
                                        ._idAnuncioTable(db),
                                referencedColumn:
                                    $$AnuncioMilitarTabelaTableReferences
                                        ._idAnuncioTable(db)
                                        .idAnuncioMilitar,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AnuncioMilitarTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioMilitarTabelaTable,
      AnuncioMilitarTabelaData,
      $$AnuncioMilitarTabelaTableFilterComposer,
      $$AnuncioMilitarTabelaTableOrderingComposer,
      $$AnuncioMilitarTabelaTableAnnotationComposer,
      $$AnuncioMilitarTabelaTableCreateCompanionBuilder,
      $$AnuncioMilitarTabelaTableUpdateCompanionBuilder,
      (AnuncioMilitarTabelaData, $$AnuncioMilitarTabelaTableReferences),
      AnuncioMilitarTabelaData,
      PrefetchHooks Function({bool idMilitar, bool idAnuncio})
    >;
typedef $$AnuncioViaturaDiarioTabelaTableCreateCompanionBuilder =
    AnuncioViaturaDiarioTabelaCompanion Function({
      required String idAnuncioViatura,
      required DateTime dataHora,
      required String idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioViaturaDiarioTabelaTableUpdateCompanionBuilder =
    AnuncioViaturaDiarioTabelaCompanion Function({
      Value<String> idAnuncioViatura,
      Value<DateTime> dataHora,
      Value<String> idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioViaturaDiarioTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioViaturaDiarioTabelaTable,
          AnuncioViaturaDiarioTabelaData
        > {
  $$AnuncioViaturaDiarioTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AnuncioViaturaTabelaTable,
    List<AnuncioViaturaTabelaData>
  >
  _anuncioViaturaTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.anuncioViaturaTabela,
    aliasName:
        'anuncio_viatura_diario_tabela__id_anuncio_viatura__anuncio_viatura_tabela__id_anuncio',
  );

  $$AnuncioViaturaTabelaTableProcessedTableManager
  get anuncioViaturaTabelaRefs {
    final manager =
        $$AnuncioViaturaTabelaTableTableManager(
          $_db,
          $_db.anuncioViaturaTabela,
        ).filter(
          (f) => f.idAnuncio.idAnuncioViatura.sqlEquals(
            $_itemColumn<String>('id_anuncio_viatura')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioViaturaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AnuncioViaturaDiarioTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaDiarioTabelaTable> {
  $$AnuncioViaturaDiarioTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idAnuncioViatura => $composableBuilder(
    column: $table.idAnuncioViatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> anuncioViaturaTabelaRefs(
    Expression<bool> Function($$AnuncioViaturaTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioViaturaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idAnuncioViatura,
      referencedTable: $db.anuncioViaturaTabela,
      getReferencedColumn: (t) => t.idAnuncio,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnuncioViaturaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.anuncioViaturaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AnuncioViaturaDiarioTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaDiarioTabelaTable> {
  $$AnuncioViaturaDiarioTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idAnuncioViatura => $composableBuilder(
    column: $table.idAnuncioViatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnuncioViaturaDiarioTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaDiarioTabelaTable> {
  $$AnuncioViaturaDiarioTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idAnuncioViatura => $composableBuilder(
    column: $table.idAnuncioViatura,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataHora =>
      $composableBuilder(column: $table.dataHora, builder: (column) => column);

  GeneratedColumn<String> get idMilitarResponsavel => $composableBuilder(
    column: $table.idMilitarResponsavel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> anuncioViaturaTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioViaturaTabelaTableAnnotationComposer a) f,
  ) {
    final $$AnuncioViaturaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioViatura,
          referencedTable: $db.anuncioViaturaTabela,
          getReferencedColumn: (t) => t.idAnuncio,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioViaturaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioViaturaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AnuncioViaturaDiarioTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioViaturaDiarioTabelaTable,
          AnuncioViaturaDiarioTabelaData,
          $$AnuncioViaturaDiarioTabelaTableFilterComposer,
          $$AnuncioViaturaDiarioTabelaTableOrderingComposer,
          $$AnuncioViaturaDiarioTabelaTableAnnotationComposer,
          $$AnuncioViaturaDiarioTabelaTableCreateCompanionBuilder,
          $$AnuncioViaturaDiarioTabelaTableUpdateCompanionBuilder,
          (
            AnuncioViaturaDiarioTabelaData,
            $$AnuncioViaturaDiarioTabelaTableReferences,
          ),
          AnuncioViaturaDiarioTabelaData,
          PrefetchHooks Function({bool anuncioViaturaTabelaRefs})
        > {
  $$AnuncioViaturaDiarioTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioViaturaDiarioTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioViaturaDiarioTabelaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AnuncioViaturaDiarioTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioViaturaDiarioTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idAnuncioViatura = const Value.absent(),
                Value<DateTime> dataHora = const Value.absent(),
                Value<String> idMilitarResponsavel = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioViaturaDiarioTabelaCompanion(
                idAnuncioViatura: idAnuncioViatura,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idAnuncioViatura,
                required DateTime dataHora,
                required String idMilitarResponsavel,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioViaturaDiarioTabelaCompanion.insert(
                idAnuncioViatura: idAnuncioViatura,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioViaturaDiarioTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({anuncioViaturaTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (anuncioViaturaTabelaRefs) db.anuncioViaturaTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (anuncioViaturaTabelaRefs)
                    await $_getPrefetchedData<
                      AnuncioViaturaDiarioTabelaData,
                      $AnuncioViaturaDiarioTabelaTable,
                      AnuncioViaturaTabelaData
                    >(
                      currentTable: table,
                      referencedTable:
                          $$AnuncioViaturaDiarioTabelaTableReferences
                              ._anuncioViaturaTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AnuncioViaturaDiarioTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).anuncioViaturaTabelaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idAnuncio == item.idAnuncioViatura,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AnuncioViaturaDiarioTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioViaturaDiarioTabelaTable,
      AnuncioViaturaDiarioTabelaData,
      $$AnuncioViaturaDiarioTabelaTableFilterComposer,
      $$AnuncioViaturaDiarioTabelaTableOrderingComposer,
      $$AnuncioViaturaDiarioTabelaTableAnnotationComposer,
      $$AnuncioViaturaDiarioTabelaTableCreateCompanionBuilder,
      $$AnuncioViaturaDiarioTabelaTableUpdateCompanionBuilder,
      (
        AnuncioViaturaDiarioTabelaData,
        $$AnuncioViaturaDiarioTabelaTableReferences,
      ),
      AnuncioViaturaDiarioTabelaData,
      PrefetchHooks Function({bool anuncioViaturaTabelaRefs})
    >;
typedef $$CursoTabelaTableCreateCompanionBuilder =
    CursoTabelaCompanion Function({
      required String idCurso,
      required String nomeCurso,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$CursoTabelaTableUpdateCompanionBuilder =
    CursoTabelaCompanion Function({
      Value<String> idCurso,
      Value<String> nomeCurso,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$CursoTabelaTableReferences
    extends BaseReferences<_$AppDatabase, $CursoTabelaTable, CursoTabelaData> {
  $$CursoTabelaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $MilitarCursoTabelaTable,
    List<MilitarCursoTabelaData>
  >
  _militarCursoTabelaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.militarCursoTabela,
        aliasName: 'curso_tabela__id_curso__militar_curso_tabela__id_curso',
      );

  $$MilitarCursoTabelaTableProcessedTableManager get militarCursoTabelaRefs {
    final manager =
        $$MilitarCursoTabelaTableTableManager(
          $_db,
          $_db.militarCursoTabela,
        ).filter(
          (f) => f.idCurso.idCurso.sqlEquals($_itemColumn<String>('id_curso')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _militarCursoTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CursoTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $CursoTabelaTable> {
  $$CursoTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idCurso => $composableBuilder(
    column: $table.idCurso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeCurso => $composableBuilder(
    column: $table.nomeCurso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> militarCursoTabelaRefs(
    Expression<bool> Function($$MilitarCursoTabelaTableFilterComposer f) f,
  ) {
    final $$MilitarCursoTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.militarCursoTabela,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarCursoTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarCursoTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CursoTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $CursoTabelaTable> {
  $$CursoTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idCurso => $composableBuilder(
    column: $table.idCurso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeCurso => $composableBuilder(
    column: $table.nomeCurso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CursoTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CursoTabelaTable> {
  $$CursoTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idCurso =>
      $composableBuilder(column: $table.idCurso, builder: (column) => column);

  GeneratedColumn<String> get nomeCurso =>
      $composableBuilder(column: $table.nomeCurso, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> militarCursoTabelaRefs<T extends Object>(
    Expression<T> Function($$MilitarCursoTabelaTableAnnotationComposer a) f,
  ) {
    final $$MilitarCursoTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idCurso,
          referencedTable: $db.militarCursoTabela,
          getReferencedColumn: (t) => t.idCurso,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MilitarCursoTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.militarCursoTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CursoTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CursoTabelaTable,
          CursoTabelaData,
          $$CursoTabelaTableFilterComposer,
          $$CursoTabelaTableOrderingComposer,
          $$CursoTabelaTableAnnotationComposer,
          $$CursoTabelaTableCreateCompanionBuilder,
          $$CursoTabelaTableUpdateCompanionBuilder,
          (CursoTabelaData, $$CursoTabelaTableReferences),
          CursoTabelaData,
          PrefetchHooks Function({bool militarCursoTabelaRefs})
        > {
  $$CursoTabelaTableTableManager(_$AppDatabase db, $CursoTabelaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CursoTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CursoTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CursoTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idCurso = const Value.absent(),
                Value<String> nomeCurso = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CursoTabelaCompanion(
                idCurso: idCurso,
                nomeCurso: nomeCurso,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idCurso,
                required String nomeCurso,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CursoTabelaCompanion.insert(
                idCurso: idCurso,
                nomeCurso: nomeCurso,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CursoTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({militarCursoTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (militarCursoTabelaRefs) db.militarCursoTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (militarCursoTabelaRefs)
                    await $_getPrefetchedData<
                      CursoTabelaData,
                      $CursoTabelaTable,
                      MilitarCursoTabelaData
                    >(
                      currentTable: table,
                      referencedTable: $$CursoTabelaTableReferences
                          ._militarCursoTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CursoTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).militarCursoTabelaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idCurso == item.idCurso,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CursoTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CursoTabelaTable,
      CursoTabelaData,
      $$CursoTabelaTableFilterComposer,
      $$CursoTabelaTableOrderingComposer,
      $$CursoTabelaTableAnnotationComposer,
      $$CursoTabelaTableCreateCompanionBuilder,
      $$CursoTabelaTableUpdateCompanionBuilder,
      (CursoTabelaData, $$CursoTabelaTableReferences),
      CursoTabelaData,
      PrefetchHooks Function({bool militarCursoTabelaRefs})
    >;
typedef $$ViaturaTabelaTableCreateCompanionBuilder =
    ViaturaTabelaCompanion Function({
      required String idViatura,
      required String prefixo,
      required String tipoViatura,
      required String marca,
      required String modelo,
      required String ano,
      required String combustivel,
      required String categoria,
      required String placa,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$ViaturaTabelaTableUpdateCompanionBuilder =
    ViaturaTabelaCompanion Function({
      Value<String> idViatura,
      Value<String> prefixo,
      Value<String> tipoViatura,
      Value<String> marca,
      Value<String> modelo,
      Value<String> ano,
      Value<String> combustivel,
      Value<String> categoria,
      Value<String> placa,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$ViaturaTabelaTableReferences
    extends
        BaseReferences<_$AppDatabase, $ViaturaTabelaTable, ViaturaTabelaData> {
  $$ViaturaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AnuncioViaturaTabelaTable,
    List<AnuncioViaturaTabelaData>
  >
  _anuncioViaturaTabelaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.anuncioViaturaTabela,
        aliasName:
            'viatura_tabela__id_viatura__anuncio_viatura_tabela__id_viatura',
      );

  $$AnuncioViaturaTabelaTableProcessedTableManager
  get anuncioViaturaTabelaRefs {
    final manager =
        $$AnuncioViaturaTabelaTableTableManager(
          $_db,
          $_db.anuncioViaturaTabela,
        ).filter(
          (f) => f.idViatura.idViatura.sqlEquals(
            $_itemColumn<String>('id_viatura')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioViaturaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ViaturaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $ViaturaTabelaTable> {
  $$ViaturaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idViatura => $composableBuilder(
    column: $table.idViatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prefixo => $composableBuilder(
    column: $table.prefixo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoViatura => $composableBuilder(
    column: $table.tipoViatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get combustivel => $composableBuilder(
    column: $table.combustivel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placa => $composableBuilder(
    column: $table.placa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> anuncioViaturaTabelaRefs(
    Expression<bool> Function($$AnuncioViaturaTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioViaturaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idViatura,
      referencedTable: $db.anuncioViaturaTabela,
      getReferencedColumn: (t) => t.idViatura,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AnuncioViaturaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.anuncioViaturaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ViaturaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $ViaturaTabelaTable> {
  $$ViaturaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idViatura => $composableBuilder(
    column: $table.idViatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prefixo => $composableBuilder(
    column: $table.prefixo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoViatura => $composableBuilder(
    column: $table.tipoViatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get combustivel => $composableBuilder(
    column: $table.combustivel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placa => $composableBuilder(
    column: $table.placa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ViaturaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $ViaturaTabelaTable> {
  $$ViaturaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idViatura =>
      $composableBuilder(column: $table.idViatura, builder: (column) => column);

  GeneratedColumn<String> get prefixo =>
      $composableBuilder(column: $table.prefixo, builder: (column) => column);

  GeneratedColumn<String> get tipoViatura => $composableBuilder(
    column: $table.tipoViatura,
    builder: (column) => column,
  );

  GeneratedColumn<String> get marca =>
      $composableBuilder(column: $table.marca, builder: (column) => column);

  GeneratedColumn<String> get modelo =>
      $composableBuilder(column: $table.modelo, builder: (column) => column);

  GeneratedColumn<String> get ano =>
      $composableBuilder(column: $table.ano, builder: (column) => column);

  GeneratedColumn<String> get combustivel => $composableBuilder(
    column: $table.combustivel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get placa =>
      $composableBuilder(column: $table.placa, builder: (column) => column);

  GeneratedColumn<bool> get deletado =>
      $composableBuilder(column: $table.deletado, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> anuncioViaturaTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioViaturaTabelaTableAnnotationComposer a) f,
  ) {
    final $$AnuncioViaturaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idViatura,
          referencedTable: $db.anuncioViaturaTabela,
          getReferencedColumn: (t) => t.idViatura,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioViaturaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioViaturaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ViaturaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ViaturaTabelaTable,
          ViaturaTabelaData,
          $$ViaturaTabelaTableFilterComposer,
          $$ViaturaTabelaTableOrderingComposer,
          $$ViaturaTabelaTableAnnotationComposer,
          $$ViaturaTabelaTableCreateCompanionBuilder,
          $$ViaturaTabelaTableUpdateCompanionBuilder,
          (ViaturaTabelaData, $$ViaturaTabelaTableReferences),
          ViaturaTabelaData,
          PrefetchHooks Function({bool anuncioViaturaTabelaRefs})
        > {
  $$ViaturaTabelaTableTableManager(_$AppDatabase db, $ViaturaTabelaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ViaturaTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ViaturaTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ViaturaTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idViatura = const Value.absent(),
                Value<String> prefixo = const Value.absent(),
                Value<String> tipoViatura = const Value.absent(),
                Value<String> marca = const Value.absent(),
                Value<String> modelo = const Value.absent(),
                Value<String> ano = const Value.absent(),
                Value<String> combustivel = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<String> placa = const Value.absent(),
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ViaturaTabelaCompanion(
                idViatura: idViatura,
                prefixo: prefixo,
                tipoViatura: tipoViatura,
                marca: marca,
                modelo: modelo,
                ano: ano,
                combustivel: combustivel,
                categoria: categoria,
                placa: placa,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idViatura,
                required String prefixo,
                required String tipoViatura,
                required String marca,
                required String modelo,
                required String ano,
                required String combustivel,
                required String categoria,
                required String placa,
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ViaturaTabelaCompanion.insert(
                idViatura: idViatura,
                prefixo: prefixo,
                tipoViatura: tipoViatura,
                marca: marca,
                modelo: modelo,
                ano: ano,
                combustivel: combustivel,
                categoria: categoria,
                placa: placa,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ViaturaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({anuncioViaturaTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (anuncioViaturaTabelaRefs) db.anuncioViaturaTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (anuncioViaturaTabelaRefs)
                    await $_getPrefetchedData<
                      ViaturaTabelaData,
                      $ViaturaTabelaTable,
                      AnuncioViaturaTabelaData
                    >(
                      currentTable: table,
                      referencedTable: $$ViaturaTabelaTableReferences
                          ._anuncioViaturaTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ViaturaTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).anuncioViaturaTabelaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idViatura == item.idViatura,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ViaturaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ViaturaTabelaTable,
      ViaturaTabelaData,
      $$ViaturaTabelaTableFilterComposer,
      $$ViaturaTabelaTableOrderingComposer,
      $$ViaturaTabelaTableAnnotationComposer,
      $$ViaturaTabelaTableCreateCompanionBuilder,
      $$ViaturaTabelaTableUpdateCompanionBuilder,
      (ViaturaTabelaData, $$ViaturaTabelaTableReferences),
      ViaturaTabelaData,
      PrefetchHooks Function({bool anuncioViaturaTabelaRefs})
    >;
typedef $$AnuncioViaturaTabelaTableCreateCompanionBuilder =
    AnuncioViaturaTabelaCompanion Function({
      required String idViatura,
      required String idAnuncio,
      required String destinacaoViatura,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioViaturaTabelaTableUpdateCompanionBuilder =
    AnuncioViaturaTabelaCompanion Function({
      Value<String> idViatura,
      Value<String> idAnuncio,
      Value<String> destinacaoViatura,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioViaturaTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioViaturaTabelaTable,
          AnuncioViaturaTabelaData
        > {
  $$AnuncioViaturaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ViaturaTabelaTable _idViaturaTable(_$AppDatabase db) =>
      db.viaturaTabela.createAlias(
        'anuncio_viatura_tabela__id_viatura__viatura_tabela__id_viatura',
      );

  $$ViaturaTabelaTableProcessedTableManager get idViatura {
    final $_column = $_itemColumn<String>('id_viatura')!;

    final manager = $$ViaturaTabelaTableTableManager(
      $_db,
      $_db.viaturaTabela,
    ).filter((f) => f.idViatura.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idViaturaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AnuncioViaturaDiarioTabelaTable _idAnuncioTable(
    _$AppDatabase db,
  ) => db.anuncioViaturaDiarioTabela.createAlias(
    'anuncio_viatura_tabela__id_anuncio__anuncio_viatura_diario_tabela__id_anuncio_viatura',
  );

  $$AnuncioViaturaDiarioTabelaTableProcessedTableManager get idAnuncio {
    final $_column = $_itemColumn<String>('id_anuncio')!;

    final manager = $$AnuncioViaturaDiarioTabelaTableTableManager(
      $_db,
      $_db.anuncioViaturaDiarioTabela,
    ).filter((f) => f.idAnuncioViatura.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAnuncioTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnuncioViaturaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaTabelaTable> {
  $$AnuncioViaturaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get destinacaoViatura => $composableBuilder(
    column: $table.destinacaoViatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$ViaturaTabelaTableFilterComposer get idViatura {
    final $$ViaturaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idViatura,
      referencedTable: $db.viaturaTabela,
      getReferencedColumn: (t) => t.idViatura,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ViaturaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.viaturaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioViaturaDiarioTabelaTableFilterComposer get idAnuncio {
    final $$AnuncioViaturaDiarioTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioViaturaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioViatura,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioViaturaDiarioTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioViaturaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioViaturaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaTabelaTable> {
  $$AnuncioViaturaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get destinacaoViatura => $composableBuilder(
    column: $table.destinacaoViatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$ViaturaTabelaTableOrderingComposer get idViatura {
    final $$ViaturaTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idViatura,
      referencedTable: $db.viaturaTabela,
      getReferencedColumn: (t) => t.idViatura,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ViaturaTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.viaturaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioViaturaDiarioTabelaTableOrderingComposer get idAnuncio {
    final $$AnuncioViaturaDiarioTabelaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioViaturaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioViatura,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioViaturaDiarioTabelaTableOrderingComposer(
                $db: $db,
                $table: $db.anuncioViaturaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioViaturaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioViaturaTabelaTable> {
  $$AnuncioViaturaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get destinacaoViatura => $composableBuilder(
    column: $table.destinacaoViatura,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$ViaturaTabelaTableAnnotationComposer get idViatura {
    final $$ViaturaTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idViatura,
      referencedTable: $db.viaturaTabela,
      getReferencedColumn: (t) => t.idViatura,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ViaturaTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.viaturaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AnuncioViaturaDiarioTabelaTableAnnotationComposer get idAnuncio {
    final $$AnuncioViaturaDiarioTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncio,
          referencedTable: $db.anuncioViaturaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioViatura,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioViaturaDiarioTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioViaturaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AnuncioViaturaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioViaturaTabelaTable,
          AnuncioViaturaTabelaData,
          $$AnuncioViaturaTabelaTableFilterComposer,
          $$AnuncioViaturaTabelaTableOrderingComposer,
          $$AnuncioViaturaTabelaTableAnnotationComposer,
          $$AnuncioViaturaTabelaTableCreateCompanionBuilder,
          $$AnuncioViaturaTabelaTableUpdateCompanionBuilder,
          (AnuncioViaturaTabelaData, $$AnuncioViaturaTabelaTableReferences),
          AnuncioViaturaTabelaData,
          PrefetchHooks Function({bool idViatura, bool idAnuncio})
        > {
  $$AnuncioViaturaTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioViaturaTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioViaturaTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnuncioViaturaTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioViaturaTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idViatura = const Value.absent(),
                Value<String> idAnuncio = const Value.absent(),
                Value<String> destinacaoViatura = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioViaturaTabelaCompanion(
                idViatura: idViatura,
                idAnuncio: idAnuncio,
                destinacaoViatura: destinacaoViatura,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idViatura,
                required String idAnuncio,
                required String destinacaoViatura,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioViaturaTabelaCompanion.insert(
                idViatura: idViatura,
                idAnuncio: idAnuncio,
                destinacaoViatura: destinacaoViatura,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioViaturaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idViatura = false, idAnuncio = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idViatura) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idViatura,
                                referencedTable:
                                    $$AnuncioViaturaTabelaTableReferences
                                        ._idViaturaTable(db),
                                referencedColumn:
                                    $$AnuncioViaturaTabelaTableReferences
                                        ._idViaturaTable(db)
                                        .idViatura,
                              )
                              as T;
                    }
                    if (idAnuncio) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idAnuncio,
                                referencedTable:
                                    $$AnuncioViaturaTabelaTableReferences
                                        ._idAnuncioTable(db),
                                referencedColumn:
                                    $$AnuncioViaturaTabelaTableReferences
                                        ._idAnuncioTable(db)
                                        .idAnuncioViatura,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AnuncioViaturaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioViaturaTabelaTable,
      AnuncioViaturaTabelaData,
      $$AnuncioViaturaTabelaTableFilterComposer,
      $$AnuncioViaturaTabelaTableOrderingComposer,
      $$AnuncioViaturaTabelaTableAnnotationComposer,
      $$AnuncioViaturaTabelaTableCreateCompanionBuilder,
      $$AnuncioViaturaTabelaTableUpdateCompanionBuilder,
      (AnuncioViaturaTabelaData, $$AnuncioViaturaTabelaTableReferences),
      AnuncioViaturaTabelaData,
      PrefetchHooks Function({bool idViatura, bool idAnuncio})
    >;
typedef $$MilitarCursoTabelaTableCreateCompanionBuilder =
    MilitarCursoTabelaCompanion Function({
      required String idMilitar,
      required String idCurso,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$MilitarCursoTabelaTableUpdateCompanionBuilder =
    MilitarCursoTabelaCompanion Function({
      Value<String> idMilitar,
      Value<String> idCurso,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$MilitarCursoTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MilitarCursoTabelaTable,
          MilitarCursoTabelaData
        > {
  $$MilitarCursoTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilitarTabelaTable _idMilitarTable(_$AppDatabase db) =>
      db.militarTabela.createAlias(
        'militar_curso_tabela__id_militar__militar_tabela__id_militar',
      );

  $$MilitarTabelaTableProcessedTableManager get idMilitar {
    final $_column = $_itemColumn<String>('id_militar')!;

    final manager = $$MilitarTabelaTableTableManager(
      $_db,
      $_db.militarTabela,
    ).filter((f) => f.idMilitar.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idMilitarTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CursoTabelaTable _idCursoTable(_$AppDatabase db) => db.cursoTabela
      .createAlias('militar_curso_tabela__id_curso__curso_tabela__id_curso');

  $$CursoTabelaTableProcessedTableManager get idCurso {
    final $_column = $_itemColumn<String>('id_curso')!;

    final manager = $$CursoTabelaTableTableManager(
      $_db,
      $_db.cursoTabela,
    ).filter((f) => f.idCurso.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCursoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MilitarCursoTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $MilitarCursoTabelaTable> {
  $$MilitarCursoTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$MilitarTabelaTableFilterComposer get idMilitar {
    final $$MilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CursoTabelaTableFilterComposer get idCurso {
    final $$CursoTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursoTabela,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursoTabelaTableFilterComposer(
            $db: $db,
            $table: $db.cursoTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MilitarCursoTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $MilitarCursoTabelaTable> {
  $$MilitarCursoTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilitarTabelaTableOrderingComposer get idMilitar {
    final $$MilitarTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CursoTabelaTableOrderingComposer get idCurso {
    final $$CursoTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursoTabela,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursoTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.cursoTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MilitarCursoTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilitarCursoTabelaTable> {
  $$MilitarCursoTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get deletado =>
      $composableBuilder(column: $table.deletado, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$MilitarTabelaTableAnnotationComposer get idMilitar {
    final $$MilitarTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitar,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CursoTabelaTableAnnotationComposer get idCurso {
    final $$CursoTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCurso,
      referencedTable: $db.cursoTabela,
      getReferencedColumn: (t) => t.idCurso,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CursoTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.cursoTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MilitarCursoTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilitarCursoTabelaTable,
          MilitarCursoTabelaData,
          $$MilitarCursoTabelaTableFilterComposer,
          $$MilitarCursoTabelaTableOrderingComposer,
          $$MilitarCursoTabelaTableAnnotationComposer,
          $$MilitarCursoTabelaTableCreateCompanionBuilder,
          $$MilitarCursoTabelaTableUpdateCompanionBuilder,
          (MilitarCursoTabelaData, $$MilitarCursoTabelaTableReferences),
          MilitarCursoTabelaData,
          PrefetchHooks Function({bool idMilitar, bool idCurso})
        > {
  $$MilitarCursoTabelaTableTableManager(
    _$AppDatabase db,
    $MilitarCursoTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilitarCursoTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilitarCursoTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilitarCursoTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idMilitar = const Value.absent(),
                Value<String> idCurso = const Value.absent(),
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilitarCursoTabelaCompanion(
                idMilitar: idMilitar,
                idCurso: idCurso,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idMilitar,
                required String idCurso,
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MilitarCursoTabelaCompanion.insert(
                idMilitar: idMilitar,
                idCurso: idCurso,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MilitarCursoTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idMilitar = false, idCurso = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idMilitar) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idMilitar,
                                referencedTable:
                                    $$MilitarCursoTabelaTableReferences
                                        ._idMilitarTable(db),
                                referencedColumn:
                                    $$MilitarCursoTabelaTableReferences
                                        ._idMilitarTable(db)
                                        .idMilitar,
                              )
                              as T;
                    }
                    if (idCurso) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idCurso,
                                referencedTable:
                                    $$MilitarCursoTabelaTableReferences
                                        ._idCursoTable(db),
                                referencedColumn:
                                    $$MilitarCursoTabelaTableReferences
                                        ._idCursoTable(db)
                                        .idCurso,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MilitarCursoTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilitarCursoTabelaTable,
      MilitarCursoTabelaData,
      $$MilitarCursoTabelaTableFilterComposer,
      $$MilitarCursoTabelaTableOrderingComposer,
      $$MilitarCursoTabelaTableAnnotationComposer,
      $$MilitarCursoTabelaTableCreateCompanionBuilder,
      $$MilitarCursoTabelaTableUpdateCompanionBuilder,
      (MilitarCursoTabelaData, $$MilitarCursoTabelaTableReferences),
      MilitarCursoTabelaData,
      PrefetchHooks Function({bool idMilitar, bool idCurso})
    >;
typedef $$DemandaTabelaTableCreateCompanionBuilder =
    DemandaTabelaCompanion Function({
      required String idDemanda,
      required String idMilitarResponsavel,
      required String numeroDemanda,
      required String nomeDemanda,
      required DateTime dataInicioDemanda,
      required DateTime dataFimDemanda,
      required String urlDemanda,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$DemandaTabelaTableUpdateCompanionBuilder =
    DemandaTabelaCompanion Function({
      Value<String> idDemanda,
      Value<String> idMilitarResponsavel,
      Value<String> numeroDemanda,
      Value<String> nomeDemanda,
      Value<DateTime> dataInicioDemanda,
      Value<DateTime> dataFimDemanda,
      Value<String> urlDemanda,
      Value<bool> deletado,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$DemandaTabelaTableReferences
    extends
        BaseReferences<_$AppDatabase, $DemandaTabelaTable, DemandaTabelaData> {
  $$DemandaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilitarTabelaTable _idMilitarResponsavelTable(_$AppDatabase db) =>
      db.militarTabela.createAlias(
        'demanda_tabela__id_militar_responsavel__militar_tabela__id_militar',
      );

  $$MilitarTabelaTableProcessedTableManager get idMilitarResponsavel {
    final $_column = $_itemColumn<String>('id_militar_responsavel')!;

    final manager = $$MilitarTabelaTableTableManager(
      $_db,
      $_db.militarTabela,
    ).filter((f) => f.idMilitar.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _idMilitarResponsavelTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DemandaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $DemandaTabelaTable> {
  $$DemandaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idDemanda => $composableBuilder(
    column: $table.idDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroDemanda => $composableBuilder(
    column: $table.numeroDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeDemanda => $composableBuilder(
    column: $table.nomeDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataInicioDemanda => $composableBuilder(
    column: $table.dataInicioDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataFimDemanda => $composableBuilder(
    column: $table.dataFimDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlDemanda => $composableBuilder(
    column: $table.urlDemanda,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$MilitarTabelaTableFilterComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DemandaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $DemandaTabelaTable> {
  $$DemandaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idDemanda => $composableBuilder(
    column: $table.idDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroDemanda => $composableBuilder(
    column: $table.numeroDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeDemanda => $composableBuilder(
    column: $table.nomeDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataInicioDemanda => $composableBuilder(
    column: $table.dataInicioDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataFimDemanda => $composableBuilder(
    column: $table.dataFimDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlDemanda => $composableBuilder(
    column: $table.urlDemanda,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deletado => $composableBuilder(
    column: $table.deletado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilitarTabelaTableOrderingComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DemandaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $DemandaTabelaTable> {
  $$DemandaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idDemanda =>
      $composableBuilder(column: $table.idDemanda, builder: (column) => column);

  GeneratedColumn<String> get numeroDemanda => $composableBuilder(
    column: $table.numeroDemanda,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nomeDemanda => $composableBuilder(
    column: $table.nomeDemanda,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataInicioDemanda => $composableBuilder(
    column: $table.dataInicioDemanda,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataFimDemanda => $composableBuilder(
    column: $table.dataFimDemanda,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlDemanda => $composableBuilder(
    column: $table.urlDemanda,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get deletado =>
      $composableBuilder(column: $table.deletado, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$MilitarTabelaTableAnnotationComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DemandaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DemandaTabelaTable,
          DemandaTabelaData,
          $$DemandaTabelaTableFilterComposer,
          $$DemandaTabelaTableOrderingComposer,
          $$DemandaTabelaTableAnnotationComposer,
          $$DemandaTabelaTableCreateCompanionBuilder,
          $$DemandaTabelaTableUpdateCompanionBuilder,
          (DemandaTabelaData, $$DemandaTabelaTableReferences),
          DemandaTabelaData,
          PrefetchHooks Function({bool idMilitarResponsavel})
        > {
  $$DemandaTabelaTableTableManager(_$AppDatabase db, $DemandaTabelaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DemandaTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DemandaTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DemandaTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idDemanda = const Value.absent(),
                Value<String> idMilitarResponsavel = const Value.absent(),
                Value<String> numeroDemanda = const Value.absent(),
                Value<String> nomeDemanda = const Value.absent(),
                Value<DateTime> dataInicioDemanda = const Value.absent(),
                Value<DateTime> dataFimDemanda = const Value.absent(),
                Value<String> urlDemanda = const Value.absent(),
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DemandaTabelaCompanion(
                idDemanda: idDemanda,
                idMilitarResponsavel: idMilitarResponsavel,
                numeroDemanda: numeroDemanda,
                nomeDemanda: nomeDemanda,
                dataInicioDemanda: dataInicioDemanda,
                dataFimDemanda: dataFimDemanda,
                urlDemanda: urlDemanda,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idDemanda,
                required String idMilitarResponsavel,
                required String numeroDemanda,
                required String nomeDemanda,
                required DateTime dataInicioDemanda,
                required DateTime dataFimDemanda,
                required String urlDemanda,
                Value<bool> deletado = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DemandaTabelaCompanion.insert(
                idDemanda: idDemanda,
                idMilitarResponsavel: idMilitarResponsavel,
                numeroDemanda: numeroDemanda,
                nomeDemanda: nomeDemanda,
                dataInicioDemanda: dataInicioDemanda,
                dataFimDemanda: dataFimDemanda,
                urlDemanda: urlDemanda,
                deletado: deletado,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DemandaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idMilitarResponsavel = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idMilitarResponsavel) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idMilitarResponsavel,
                                referencedTable: $$DemandaTabelaTableReferences
                                    ._idMilitarResponsavelTable(db),
                                referencedColumn: $$DemandaTabelaTableReferences
                                    ._idMilitarResponsavelTable(db)
                                    .idMilitar,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DemandaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DemandaTabelaTable,
      DemandaTabelaData,
      $$DemandaTabelaTableFilterComposer,
      $$DemandaTabelaTableOrderingComposer,
      $$DemandaTabelaTableAnnotationComposer,
      $$DemandaTabelaTableCreateCompanionBuilder,
      $$DemandaTabelaTableUpdateCompanionBuilder,
      (DemandaTabelaData, $$DemandaTabelaTableReferences),
      DemandaTabelaData,
      PrefetchHooks Function({bool idMilitarResponsavel})
    >;
typedef $$OcorrenciaTabelaTableCreateCompanionBuilder =
    OcorrenciaTabelaCompanion Function({
      required String idOcorrencia,
      required String codigoOcorrencia,
      required String nomeOcorrencia,
      required String tipoOcorrencia,
      required bool iapr,
      required bool irrd,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$OcorrenciaTabelaTableUpdateCompanionBuilder =
    OcorrenciaTabelaCompanion Function({
      Value<String> idOcorrencia,
      Value<String> codigoOcorrencia,
      Value<String> nomeOcorrencia,
      Value<String> tipoOcorrencia,
      Value<bool> iapr,
      Value<bool> irrd,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$OcorrenciaTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OcorrenciaTabelaTable,
          OcorrenciaTabelaData
        > {
  $$OcorrenciaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AnuncioOcorrenciaTabelaTable,
    List<AnuncioOcorrenciaTabelaData>
  >
  _anuncioOcorrenciaTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.anuncioOcorrenciaTabela,
    aliasName:
        'ocorrencia_tabela__id_ocorrencia__anuncio_ocorrencia_tabela__id_ocorrencia',
  );

  $$AnuncioOcorrenciaTabelaTableProcessedTableManager
  get anuncioOcorrenciaTabelaRefs {
    final manager =
        $$AnuncioOcorrenciaTabelaTableTableManager(
          $_db,
          $_db.anuncioOcorrenciaTabela,
        ).filter(
          (f) => f.idOcorrencia.idOcorrencia.sqlEquals(
            $_itemColumn<String>('id_ocorrencia')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioOcorrenciaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OcorrenciaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $OcorrenciaTabelaTable> {
  $$OcorrenciaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idOcorrencia => $composableBuilder(
    column: $table.idOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigoOcorrencia => $composableBuilder(
    column: $table.codigoOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeOcorrencia => $composableBuilder(
    column: $table.nomeOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoOcorrencia => $composableBuilder(
    column: $table.tipoOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get iapr => $composableBuilder(
    column: $table.iapr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get irrd => $composableBuilder(
    column: $table.irrd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> anuncioOcorrenciaTabelaRefs(
    Expression<bool> Function($$AnuncioOcorrenciaTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioOcorrenciaTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idOcorrencia,
          referencedTable: $db.anuncioOcorrenciaTabela,
          getReferencedColumn: (t) => t.idOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OcorrenciaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $OcorrenciaTabelaTable> {
  $$OcorrenciaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idOcorrencia => $composableBuilder(
    column: $table.idOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigoOcorrencia => $composableBuilder(
    column: $table.codigoOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeOcorrencia => $composableBuilder(
    column: $table.nomeOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoOcorrencia => $composableBuilder(
    column: $table.tipoOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get iapr => $composableBuilder(
    column: $table.iapr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get irrd => $composableBuilder(
    column: $table.irrd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OcorrenciaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $OcorrenciaTabelaTable> {
  $$OcorrenciaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idOcorrencia => $composableBuilder(
    column: $table.idOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codigoOcorrencia => $composableBuilder(
    column: $table.codigoOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nomeOcorrencia => $composableBuilder(
    column: $table.nomeOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipoOcorrencia => $composableBuilder(
    column: $table.tipoOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get iapr =>
      $composableBuilder(column: $table.iapr, builder: (column) => column);

  GeneratedColumn<bool> get irrd =>
      $composableBuilder(column: $table.irrd, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> anuncioOcorrenciaTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioOcorrenciaTabelaTableAnnotationComposer a)
    f,
  ) {
    final $$AnuncioOcorrenciaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idOcorrencia,
          referencedTable: $db.anuncioOcorrenciaTabela,
          getReferencedColumn: (t) => t.idOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OcorrenciaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OcorrenciaTabelaTable,
          OcorrenciaTabelaData,
          $$OcorrenciaTabelaTableFilterComposer,
          $$OcorrenciaTabelaTableOrderingComposer,
          $$OcorrenciaTabelaTableAnnotationComposer,
          $$OcorrenciaTabelaTableCreateCompanionBuilder,
          $$OcorrenciaTabelaTableUpdateCompanionBuilder,
          (OcorrenciaTabelaData, $$OcorrenciaTabelaTableReferences),
          OcorrenciaTabelaData,
          PrefetchHooks Function({bool anuncioOcorrenciaTabelaRefs})
        > {
  $$OcorrenciaTabelaTableTableManager(
    _$AppDatabase db,
    $OcorrenciaTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OcorrenciaTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OcorrenciaTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OcorrenciaTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idOcorrencia = const Value.absent(),
                Value<String> codigoOcorrencia = const Value.absent(),
                Value<String> nomeOcorrencia = const Value.absent(),
                Value<String> tipoOcorrencia = const Value.absent(),
                Value<bool> iapr = const Value.absent(),
                Value<bool> irrd = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OcorrenciaTabelaCompanion(
                idOcorrencia: idOcorrencia,
                codigoOcorrencia: codigoOcorrencia,
                nomeOcorrencia: nomeOcorrencia,
                tipoOcorrencia: tipoOcorrencia,
                iapr: iapr,
                irrd: irrd,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idOcorrencia,
                required String codigoOcorrencia,
                required String nomeOcorrencia,
                required String tipoOcorrencia,
                required bool iapr,
                required bool irrd,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OcorrenciaTabelaCompanion.insert(
                idOcorrencia: idOcorrencia,
                codigoOcorrencia: codigoOcorrencia,
                nomeOcorrencia: nomeOcorrencia,
                tipoOcorrencia: tipoOcorrencia,
                iapr: iapr,
                irrd: irrd,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OcorrenciaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({anuncioOcorrenciaTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (anuncioOcorrenciaTabelaRefs) db.anuncioOcorrenciaTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (anuncioOcorrenciaTabelaRefs)
                    await $_getPrefetchedData<
                      OcorrenciaTabelaData,
                      $OcorrenciaTabelaTable,
                      AnuncioOcorrenciaTabelaData
                    >(
                      currentTable: table,
                      referencedTable: $$OcorrenciaTabelaTableReferences
                          ._anuncioOcorrenciaTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$OcorrenciaTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).anuncioOcorrenciaTabelaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idOcorrencia == item.idOcorrencia,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$OcorrenciaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OcorrenciaTabelaTable,
      OcorrenciaTabelaData,
      $$OcorrenciaTabelaTableFilterComposer,
      $$OcorrenciaTabelaTableOrderingComposer,
      $$OcorrenciaTabelaTableAnnotationComposer,
      $$OcorrenciaTabelaTableCreateCompanionBuilder,
      $$OcorrenciaTabelaTableUpdateCompanionBuilder,
      (OcorrenciaTabelaData, $$OcorrenciaTabelaTableReferences),
      OcorrenciaTabelaData,
      PrefetchHooks Function({bool anuncioOcorrenciaTabelaRefs})
    >;
typedef $$AnuncioOcorrenciaDiarioTabelaTableCreateCompanionBuilder =
    AnuncioOcorrenciaDiarioTabelaCompanion Function({
      required String idAnuncioOcorrencia,
      required DateTime dataHora,
      required String idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioOcorrenciaDiarioTabelaTableUpdateCompanionBuilder =
    AnuncioOcorrenciaDiarioTabelaCompanion Function({
      Value<String> idAnuncioOcorrencia,
      Value<DateTime> dataHora,
      Value<String> idMilitarResponsavel,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioOcorrenciaDiarioTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioOcorrenciaDiarioTabelaTable,
          AnuncioOcorrenciaDiarioTabelaData
        > {
  $$AnuncioOcorrenciaDiarioTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilitarTabelaTable _idMilitarResponsavelTable(
    _$AppDatabase db,
  ) => db.militarTabela.createAlias(
    'anuncio_ocorrencia_diario_tabela__id_militar_responsavel__militar_tabela__id_militar',
  );

  $$MilitarTabelaTableProcessedTableManager get idMilitarResponsavel {
    final $_column = $_itemColumn<String>('id_militar_responsavel')!;

    final manager = $$MilitarTabelaTableTableManager(
      $_db,
      $_db.militarTabela,
    ).filter((f) => f.idMilitar.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _idMilitarResponsavelTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $AnuncioOcorrenciaTabelaTable,
    List<AnuncioOcorrenciaTabelaData>
  >
  _anuncioOcorrenciaTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.anuncioOcorrenciaTabela,
    aliasName:
        'anuncio_ocorrencia_diario_tabela__id_anuncio_ocorrencia__anuncio_ocorrencia_tabela__id_anuncio_ocorrencia',
  );

  $$AnuncioOcorrenciaTabelaTableProcessedTableManager
  get anuncioOcorrenciaTabelaRefs {
    final manager =
        $$AnuncioOcorrenciaTabelaTableTableManager(
          $_db,
          $_db.anuncioOcorrenciaTabela,
        ).filter(
          (f) => f.idAnuncioOcorrencia.idAnuncioOcorrencia.sqlEquals(
            $_itemColumn<String>('id_anuncio_ocorrencia')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _anuncioOcorrenciaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaDiarioTabelaTable> {
  $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idAnuncioOcorrencia => $composableBuilder(
    column: $table.idAnuncioOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$MilitarTabelaTableFilterComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableFilterComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> anuncioOcorrenciaTabelaRefs(
    Expression<bool> Function($$AnuncioOcorrenciaTabelaTableFilterComposer f) f,
  ) {
    final $$AnuncioOcorrenciaTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioOcorrencia,
          referencedTable: $db.anuncioOcorrenciaTabela,
          getReferencedColumn: (t) => t.idAnuncioOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaDiarioTabelaTable> {
  $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idAnuncioOcorrencia => $composableBuilder(
    column: $table.idAnuncioOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataHora => $composableBuilder(
    column: $table.dataHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilitarTabelaTableOrderingComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaDiarioTabelaTable> {
  $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idAnuncioOcorrencia => $composableBuilder(
    column: $table.idAnuncioOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dataHora =>
      $composableBuilder(column: $table.dataHora, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$MilitarTabelaTableAnnotationComposer get idMilitarResponsavel {
    final $$MilitarTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idMilitarResponsavel,
      referencedTable: $db.militarTabela,
      getReferencedColumn: (t) => t.idMilitar,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilitarTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.militarTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> anuncioOcorrenciaTabelaRefs<T extends Object>(
    Expression<T> Function($$AnuncioOcorrenciaTabelaTableAnnotationComposer a)
    f,
  ) {
    final $$AnuncioOcorrenciaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioOcorrencia,
          referencedTable: $db.anuncioOcorrenciaTabela,
          getReferencedColumn: (t) => t.idAnuncioOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AnuncioOcorrenciaDiarioTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioOcorrenciaDiarioTabelaTable,
          AnuncioOcorrenciaDiarioTabelaData,
          $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer,
          $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer,
          $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer,
          $$AnuncioOcorrenciaDiarioTabelaTableCreateCompanionBuilder,
          $$AnuncioOcorrenciaDiarioTabelaTableUpdateCompanionBuilder,
          (
            AnuncioOcorrenciaDiarioTabelaData,
            $$AnuncioOcorrenciaDiarioTabelaTableReferences,
          ),
          AnuncioOcorrenciaDiarioTabelaData,
          PrefetchHooks Function({
            bool idMilitarResponsavel,
            bool anuncioOcorrenciaTabelaRefs,
          })
        > {
  $$AnuncioOcorrenciaDiarioTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioOcorrenciaDiarioTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idAnuncioOcorrencia = const Value.absent(),
                Value<DateTime> dataHora = const Value.absent(),
                Value<String> idMilitarResponsavel = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioOcorrenciaDiarioTabelaCompanion(
                idAnuncioOcorrencia: idAnuncioOcorrencia,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idAnuncioOcorrencia,
                required DateTime dataHora,
                required String idMilitarResponsavel,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioOcorrenciaDiarioTabelaCompanion.insert(
                idAnuncioOcorrencia: idAnuncioOcorrencia,
                dataHora: dataHora,
                idMilitarResponsavel: idMilitarResponsavel,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioOcorrenciaDiarioTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idMilitarResponsavel = false,
                anuncioOcorrenciaTabelaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (anuncioOcorrenciaTabelaRefs) db.anuncioOcorrenciaTabela,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idMilitarResponsavel) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idMilitarResponsavel,
                                    referencedTable:
                                        $$AnuncioOcorrenciaDiarioTabelaTableReferences
                                            ._idMilitarResponsavelTable(db),
                                    referencedColumn:
                                        $$AnuncioOcorrenciaDiarioTabelaTableReferences
                                            ._idMilitarResponsavelTable(db)
                                            .idMilitar,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (anuncioOcorrenciaTabelaRefs)
                        await $_getPrefetchedData<
                          AnuncioOcorrenciaDiarioTabelaData,
                          $AnuncioOcorrenciaDiarioTabelaTable,
                          AnuncioOcorrenciaTabelaData
                        >(
                          currentTable: table,
                          referencedTable:
                              $$AnuncioOcorrenciaDiarioTabelaTableReferences
                                  ._anuncioOcorrenciaTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AnuncioOcorrenciaDiarioTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).anuncioOcorrenciaTabelaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) =>
                                    e.idAnuncioOcorrencia ==
                                    item.idAnuncioOcorrencia,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AnuncioOcorrenciaDiarioTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioOcorrenciaDiarioTabelaTable,
      AnuncioOcorrenciaDiarioTabelaData,
      $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer,
      $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer,
      $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer,
      $$AnuncioOcorrenciaDiarioTabelaTableCreateCompanionBuilder,
      $$AnuncioOcorrenciaDiarioTabelaTableUpdateCompanionBuilder,
      (
        AnuncioOcorrenciaDiarioTabelaData,
        $$AnuncioOcorrenciaDiarioTabelaTableReferences,
      ),
      AnuncioOcorrenciaDiarioTabelaData,
      PrefetchHooks Function({
        bool idMilitarResponsavel,
        bool anuncioOcorrenciaTabelaRefs,
      })
    >;
typedef $$AnuncioOcorrenciaTabelaTableCreateCompanionBuilder =
    AnuncioOcorrenciaTabelaCompanion Function({
      required String idItemAnuncioOcorrencia,
      required String idAnuncioOcorrencia,
      required String idOcorrencia,
      Value<bool> sincronizado,
      Value<int> rowid,
    });
typedef $$AnuncioOcorrenciaTabelaTableUpdateCompanionBuilder =
    AnuncioOcorrenciaTabelaCompanion Function({
      Value<String> idItemAnuncioOcorrencia,
      Value<String> idAnuncioOcorrencia,
      Value<String> idOcorrencia,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$AnuncioOcorrenciaTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AnuncioOcorrenciaTabelaTable,
          AnuncioOcorrenciaTabelaData
        > {
  $$AnuncioOcorrenciaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AnuncioOcorrenciaDiarioTabelaTable _idAnuncioOcorrenciaTable(
    _$AppDatabase db,
  ) => db.anuncioOcorrenciaDiarioTabela.createAlias(
    'anuncio_ocorrencia_tabela__id_anuncio_ocorrencia__anuncio_ocorrencia_diario_tabela__id_anuncio_ocorrencia',
  );

  $$AnuncioOcorrenciaDiarioTabelaTableProcessedTableManager
  get idAnuncioOcorrencia {
    final $_column = $_itemColumn<String>('id_anuncio_ocorrencia')!;

    final manager = $$AnuncioOcorrenciaDiarioTabelaTableTableManager(
      $_db,
      $_db.anuncioOcorrenciaDiarioTabela,
    ).filter((f) => f.idAnuncioOcorrencia.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idAnuncioOcorrenciaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OcorrenciaTabelaTable _idOcorrenciaTable(
    _$AppDatabase db,
  ) => db.ocorrenciaTabela.createAlias(
    'anuncio_ocorrencia_tabela__id_ocorrencia__ocorrencia_tabela__id_ocorrencia',
  );

  $$OcorrenciaTabelaTableProcessedTableManager get idOcorrencia {
    final $_column = $_itemColumn<String>('id_ocorrencia')!;

    final manager = $$OcorrenciaTabelaTableTableManager(
      $_db,
      $_db.ocorrenciaTabela,
    ).filter((f) => f.idOcorrencia.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOcorrenciaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AnuncioOcorrenciaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaTabelaTable> {
  $$AnuncioOcorrenciaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idItemAnuncioOcorrencia => $composableBuilder(
    column: $table.idItemAnuncioOcorrencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer get idAnuncioOcorrencia {
    final $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioOcorrencia,
          referencedTable: $db.anuncioOcorrenciaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaDiarioTabelaTableFilterComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OcorrenciaTabelaTableFilterComposer get idOcorrencia {
    final $$OcorrenciaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOcorrencia,
      referencedTable: $db.ocorrenciaTabela,
      getReferencedColumn: (t) => t.idOcorrencia,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OcorrenciaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.ocorrenciaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnuncioOcorrenciaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaTabelaTable> {
  $$AnuncioOcorrenciaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idItemAnuncioOcorrencia => $composableBuilder(
    column: $table.idItemAnuncioOcorrencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer get idAnuncioOcorrencia {
    final $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioOcorrencia,
          referencedTable: $db.anuncioOcorrenciaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaDiarioTabelaTableOrderingComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OcorrenciaTabelaTableOrderingComposer get idOcorrencia {
    final $$OcorrenciaTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOcorrencia,
      referencedTable: $db.ocorrenciaTabela,
      getReferencedColumn: (t) => t.idOcorrencia,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OcorrenciaTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.ocorrenciaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnuncioOcorrenciaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnuncioOcorrenciaTabelaTable> {
  $$AnuncioOcorrenciaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idItemAnuncioOcorrencia => $composableBuilder(
    column: $table.idItemAnuncioOcorrencia,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer
  get idAnuncioOcorrencia {
    final $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idAnuncioOcorrencia,
          referencedTable: $db.anuncioOcorrenciaDiarioTabela,
          getReferencedColumn: (t) => t.idAnuncioOcorrencia,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AnuncioOcorrenciaDiarioTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.anuncioOcorrenciaDiarioTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$OcorrenciaTabelaTableAnnotationComposer get idOcorrencia {
    final $$OcorrenciaTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOcorrencia,
      referencedTable: $db.ocorrenciaTabela,
      getReferencedColumn: (t) => t.idOcorrencia,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OcorrenciaTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.ocorrenciaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AnuncioOcorrenciaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnuncioOcorrenciaTabelaTable,
          AnuncioOcorrenciaTabelaData,
          $$AnuncioOcorrenciaTabelaTableFilterComposer,
          $$AnuncioOcorrenciaTabelaTableOrderingComposer,
          $$AnuncioOcorrenciaTabelaTableAnnotationComposer,
          $$AnuncioOcorrenciaTabelaTableCreateCompanionBuilder,
          $$AnuncioOcorrenciaTabelaTableUpdateCompanionBuilder,
          (
            AnuncioOcorrenciaTabelaData,
            $$AnuncioOcorrenciaTabelaTableReferences,
          ),
          AnuncioOcorrenciaTabelaData,
          PrefetchHooks Function({bool idAnuncioOcorrencia, bool idOcorrencia})
        > {
  $$AnuncioOcorrenciaTabelaTableTableManager(
    _$AppDatabase db,
    $AnuncioOcorrenciaTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnuncioOcorrenciaTabelaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$AnuncioOcorrenciaTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AnuncioOcorrenciaTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idItemAnuncioOcorrencia = const Value.absent(),
                Value<String> idAnuncioOcorrencia = const Value.absent(),
                Value<String> idOcorrencia = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioOcorrenciaTabelaCompanion(
                idItemAnuncioOcorrencia: idItemAnuncioOcorrencia,
                idAnuncioOcorrencia: idAnuncioOcorrencia,
                idOcorrencia: idOcorrencia,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idItemAnuncioOcorrencia,
                required String idAnuncioOcorrencia,
                required String idOcorrencia,
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnuncioOcorrenciaTabelaCompanion.insert(
                idItemAnuncioOcorrencia: idItemAnuncioOcorrencia,
                idAnuncioOcorrencia: idAnuncioOcorrencia,
                idOcorrencia: idOcorrencia,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AnuncioOcorrenciaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idAnuncioOcorrencia = false, idOcorrencia = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idAnuncioOcorrencia) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idAnuncioOcorrencia,
                                    referencedTable:
                                        $$AnuncioOcorrenciaTabelaTableReferences
                                            ._idAnuncioOcorrenciaTable(db),
                                    referencedColumn:
                                        $$AnuncioOcorrenciaTabelaTableReferences
                                            ._idAnuncioOcorrenciaTable(db)
                                            .idAnuncioOcorrencia,
                                  )
                                  as T;
                        }
                        if (idOcorrencia) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idOcorrencia,
                                    referencedTable:
                                        $$AnuncioOcorrenciaTabelaTableReferences
                                            ._idOcorrenciaTable(db),
                                    referencedColumn:
                                        $$AnuncioOcorrenciaTabelaTableReferences
                                            ._idOcorrenciaTable(db)
                                            .idOcorrencia,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AnuncioOcorrenciaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnuncioOcorrenciaTabelaTable,
      AnuncioOcorrenciaTabelaData,
      $$AnuncioOcorrenciaTabelaTableFilterComposer,
      $$AnuncioOcorrenciaTabelaTableOrderingComposer,
      $$AnuncioOcorrenciaTabelaTableAnnotationComposer,
      $$AnuncioOcorrenciaTabelaTableCreateCompanionBuilder,
      $$AnuncioOcorrenciaTabelaTableUpdateCompanionBuilder,
      (AnuncioOcorrenciaTabelaData, $$AnuncioOcorrenciaTabelaTableReferences),
      AnuncioOcorrenciaTabelaData,
      PrefetchHooks Function({bool idAnuncioOcorrencia, bool idOcorrencia})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MilitarTabelaTableTableManager get militarTabela =>
      $$MilitarTabelaTableTableManager(_db, _db.militarTabela);
  $$AnuncioMilitarDiarioTabelaTableTableManager
  get anuncioMilitarDiarioTabela =>
      $$AnuncioMilitarDiarioTabelaTableTableManager(
        _db,
        _db.anuncioMilitarDiarioTabela,
      );
  $$AnuncioMilitarTabelaTableTableManager get anuncioMilitarTabela =>
      $$AnuncioMilitarTabelaTableTableManager(_db, _db.anuncioMilitarTabela);
  $$AnuncioViaturaDiarioTabelaTableTableManager
  get anuncioViaturaDiarioTabela =>
      $$AnuncioViaturaDiarioTabelaTableTableManager(
        _db,
        _db.anuncioViaturaDiarioTabela,
      );
  $$CursoTabelaTableTableManager get cursoTabela =>
      $$CursoTabelaTableTableManager(_db, _db.cursoTabela);
  $$ViaturaTabelaTableTableManager get viaturaTabela =>
      $$ViaturaTabelaTableTableManager(_db, _db.viaturaTabela);
  $$AnuncioViaturaTabelaTableTableManager get anuncioViaturaTabela =>
      $$AnuncioViaturaTabelaTableTableManager(_db, _db.anuncioViaturaTabela);
  $$MilitarCursoTabelaTableTableManager get militarCursoTabela =>
      $$MilitarCursoTabelaTableTableManager(_db, _db.militarCursoTabela);
  $$DemandaTabelaTableTableManager get demandaTabela =>
      $$DemandaTabelaTableTableManager(_db, _db.demandaTabela);
  $$OcorrenciaTabelaTableTableManager get ocorrenciaTabela =>
      $$OcorrenciaTabelaTableTableManager(_db, _db.ocorrenciaTabela);
  $$AnuncioOcorrenciaDiarioTabelaTableTableManager
  get anuncioOcorrenciaDiarioTabela =>
      $$AnuncioOcorrenciaDiarioTabelaTableTableManager(
        _db,
        _db.anuncioOcorrenciaDiarioTabela,
      );
  $$AnuncioOcorrenciaTabelaTableTableManager get anuncioOcorrenciaTabela =>
      $$AnuncioOcorrenciaTabelaTableTableManager(
        _db,
        _db.anuncioOcorrenciaTabela,
      );
}
