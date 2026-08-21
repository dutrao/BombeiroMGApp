class AnuncioOcorrencia {
  final String idItemAnuncioOcorrencia;
  final String idAnuncio;
  final String idOcorrencia;
  final bool sincronizado;

  AnuncioOcorrencia({
    required this.idItemAnuncioOcorrencia,
    required this.idAnuncio,
    required this.idOcorrencia,
    this.sincronizado = false,
  });

  factory AnuncioOcorrencia.fromMap(Map<String, dynamic> map) {
    return AnuncioOcorrencia(
      idItemAnuncioOcorrencia:
          map['idItemAnuncioOcorrencia'] ?? '',
      idAnuncio: map['idAnuncio'] ?? '',
      idOcorrencia: map['idOcorrencia'] ?? '',
      sincronizado: map['sincronizado'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idItemAnuncioOcorrencia': idItemAnuncioOcorrencia,
      'idAnuncio': idAnuncio,
      'idOcorrencia': idOcorrencia,
      'sincronizado': sincronizado,
    };
  }
}