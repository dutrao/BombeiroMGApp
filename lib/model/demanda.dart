import 'package:cloud_firestore/cloud_firestore.dart';

class Demanda {
  final String idDemanda;
  final String idMilitarResponsavel;
  final String numeroDemanda;
  final String nomeDemanda;
  final DateTime dataInicioDemanda;
  final DateTime dataFimDemanda;
  final String urlDemanda;
  final bool deletado;
  final bool sincronizado;

  Demanda({
    required this.idDemanda,
    required this.idMilitarResponsavel,
    required this.numeroDemanda,
    required this.nomeDemanda,
    required this.dataInicioDemanda,
    required this.dataFimDemanda,
    required this.urlDemanda,
    this.deletado = false,
    this.sincronizado = false,
  });

  factory Demanda.fromMap(Map<String, dynamic> map) {
    return Demanda(
      idDemanda: map['idDemanda'] ?? '',
      idMilitarResponsavel: map['idMilitarResponsavel'] ?? '',
      numeroDemanda: map['numeroDemanda'] ?? '',
      nomeDemanda: map['nomeDemanda'] ?? '',
      dataInicioDemanda: _converterData(map['dataInicioDemanda']),
      dataFimDemanda: _converterData(map['dataFimDemanda']),
      urlDemanda: map['urlDemanda'] ?? '',
      deletado: map['deletado'] ?? false,
      sincronizado: map['sincronizado'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDemanda': idDemanda,
      'idMilitarResponsavel': idMilitarResponsavel,
      'numeroDemanda': numeroDemanda,
      'nomeDemanda': nomeDemanda,
      'dataInicioDemanda': dataInicioDemanda,
      'dataFimDemanda': dataFimDemanda,
      'urlDemanda': urlDemanda,
      'deletado': deletado,
      'sincronizado': sincronizado,
    };
  }

  static DateTime _converterData(dynamic valor) {
    if (valor is Timestamp) {
      return valor.toDate();
    }

    if (valor is DateTime) {
      return valor;
    }

    if (valor is String) {
      return DateTime.parse(valor);
    }

    return DateTime.now();
  }

  String get dataInicioDemandaFormatada {
    return '${dataInicioDemanda.day.toString().padLeft(2, '0')}/'
        '${dataInicioDemanda.month.toString().padLeft(2, '0')}/'
        '${dataInicioDemanda.year}';
  }

  String get dataFimDemandaFormatada {
    return '${dataFimDemanda.day.toString().padLeft(2, '0')}/'
        '${dataFimDemanda.month.toString().padLeft(2, '0')}/'
        '${dataFimDemanda.year}';
  }
}