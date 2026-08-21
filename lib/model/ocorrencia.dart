class Ocorrencia {
  final String idOcorrencia;
  final String codigo;
  final String nomeOcorrencia;
  final String tipo;
  final bool iapr;
  final bool irrd;
  final bool sincronizacao;

  Ocorrencia({
    required this.idOcorrencia,
    required this.codigo,
    required this.nomeOcorrencia,
    required this.tipo,
    required this.iapr,
    required this.irrd,
    required this.sincronizacao,
  });

  factory Ocorrencia.fromMap(Map<String, dynamic> map) {
    return Ocorrencia(
      idOcorrencia: map['idOcorrencia'] ?? '',
      codigo: map['codigo'] ?? '',
      nomeOcorrencia: map['nomeNatureza'] ?? '',
      tipo: map['tipo'] ?? '',
      iapr: map['iapr'] ?? false,
      irrd: map['irrd'] ?? false,
      sincronizacao: map['sincronizacao'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idOcorrencia': idOcorrencia,
      'codigo': codigo,
      'nomeNatureza': nomeOcorrencia,
      'tipo': tipo,
      'iapr': iapr,
      'irrd': irrd,
      'sincronizacao': sincronizacao,
    };
  }
}