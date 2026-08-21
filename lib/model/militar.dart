import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/database/database.dart';

class Militar {
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
  final String complementoEndereco;
  final String rua;
  final String bairro;
  final String cidade;
  final String numeroResidencia;
  final String cep;
  final String telefone;
  final String email;
  final String numeroConta;
  final String banco;
  final String numeroAg;
  final String quantidadeAdi;
  final String naturalidade;
  final String urlImagem;
  final String funcao;
  final String obs;
  final bool sincronizado;

  Militar({
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
    required this.numeroResidencia,
    required this.cep,
    required this.telefone,
    required this.email,
    required this.naturalidade,
    required this.urlImagem,
    required this.funcao,
    required this.obs,
    required this.sincronizado,
    required this.numeroConta,
    required this.banco,
    required this.numeroAg,
    required this.quantidadeAdi,
    required this.complementoEndereco,
  });

factory Militar.fromMap(Map<String, dynamic> map) {
  return Militar(
    idMilitar: map['idMilitar'] ?? map['uuid'] ?? '',
    cpf: map['cpf'] ?? '',
    numeroBM: map['numeroBM']?.toString() ?? '',
    nomeCompleto: map['nomeCompleto'] ?? '',
    nomeDeGuerra: map['nomeDeGuerra'] ?? '',
    cargo: map['cargo'] ?? '',
    credencialMotorista: map['credencialMotorista'] ?? '',

    dataNascimento: map['dataNascimento'] is Timestamp
        ? (map['dataNascimento'] as Timestamp).toDate()
        : map['dataNascimento'] is DateTime
            ? map['dataNascimento']
            : DateTime.tryParse(
                  map['dataNascimento']?.toString() ?? '',
                ) ??
                DateTime(1900),

    estadoCivil: map['estadoCivil'] ?? '',
    unidadeAtual: map['unidadeAtual'] ?? '',
    rua: map['rua'] ?? '',
    bairro: map['bairro'] ?? '',
    cidade: map['cidade'] ?? '',
    numeroResidencia: map['numero']?.toString() ?? '',
    cep: map['cep'] ?? '',
    telefone: map['telefone']?.toString() ?? '',
    email: map['email'] ?? '',
    naturalidade: map['naturalidade'] ?? '',
    urlImagem: map['urlImagem'] ?? '',
    funcao: map['funcao'] ?? '',
    obs: map['obs'] ?? '',
    sincronizado: map['sincronizado'] ?? false,
    numeroConta: map['numeroConta']?.toString() ?? '',
    banco: map['banco'] ?? '',
    numeroAg: map['numeroAg']?.toString() ?? '',
    quantidadeAdi: map['quantidadeAdi']?.toString() ?? '',
    complementoEndereco: map['complementoEndereco'] ?? '',
  );
}

  Map<String, dynamic> toMap() {
    return {
      'idMilitar': idMilitar,
      'cpf': cpf,
      'numeroBM': numeroBM,
      'nomeCompleto': nomeCompleto,
      'nomeDeGuerra': nomeDeGuerra,
      'cargo': cargo,
      'credencialMotorista': credencialMotorista,
      'dataNascimento': dataNascimento,
      'estadoCivil': estadoCivil,
      'unidadeAtual': unidadeAtual,
      'rua': rua,
      'bairro': bairro,
      'cidade': cidade,
      'numero': numeroResidencia,
      'cep': cep,
      'complementoEndereco': complementoEndereco,
      'telefone': telefone,
      'email': email,
      'banco': banco,
      'numeroConta': numeroConta,
      'numeroAg': numeroAg,
      'quantidadeAdi': quantidadeAdi,
      'naturalidade': naturalidade,
      'urlImagem': urlImagem,
      'funcao': funcao,
      'obs': obs,
      'sincronizado': sincronizado,
    };
  }

  factory Militar.fromDrift(MilitarTabelaData data) {
    return Militar(
      idMilitar: data.idMilitar,
      cpf: data.cpf,
      numeroBM: data.numeroBM,
      nomeCompleto: data.nomeCompleto,
      nomeDeGuerra: data.nomeDeGuerra,
      cargo: data.cargo,
      credencialMotorista: data.credencialMotorista,
      dataNascimento: data.dataNascimento,
      estadoCivil: data.estadoCivil,
      unidadeAtual: data.unidadeAtual,
      rua: data.rua,
      bairro: data.bairro,
      cidade: data.cidade,
      numeroResidencia: data.numero,
      cep: data.cep,
      telefone: data.telefone,
      email: data.email,
      naturalidade: data.naturalidade,
      urlImagem: data.urlImagem,
      funcao: data.funcao,
      obs: data.obs,
      sincronizado: true,
      numeroConta: data.numeroConta,
      banco: data.banco,
      numeroAg: data.numeroAg,
      quantidadeAdi: data.quantidadeAdi,
      complementoEndereco: data.complementoEndereco,
    );
  }

  String get numeroBMFormatado {
    return '${numeroBM.substring(0, 3)}.${numeroBM.substring(3, 6)}-${numeroBM.substring(6)}';
  }

  String get dataNascimentoFormatado {
  final dia = dataNascimento.day.toString().padLeft(2, '0');
  final mes = dataNascimento.month.toString().padLeft(2, '0');

  return '$dia/$mes/${dataNascimento.year}';
}
}
