class Anuncio {
  final String idAnuncio;

  final DateTime dataHora;
  final String idMilitarResponsavel;
  final bool sincronizado;

  Anuncio({
    required this.idAnuncio,

    required this.dataHora,
    required this.idMilitarResponsavel,
    this.sincronizado = false,
  });

  factory Anuncio.fromMap(Map<String, dynamic> map) {
    return Anuncio(
      idAnuncio: map['idAnuncio'] ?? '',

      dataHora: map['dataHora'] is DateTime
          ? map['dataHora']
          : DateTime.parse(map['dataHora']).toLocal(),
      idMilitarResponsavel: map['idMilitarResponsavel'] ?? '',
      sincronizado: map['sincronizado'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idAnuncio': idAnuncio,

      'dataHora': dataHora.toIso8601String(),
      'idMilitarResponsavel': idMilitarResponsavel,
      'sincronizado': sincronizado,
    };
  }
}
