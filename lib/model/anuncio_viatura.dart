class AnuncioViatura {
  final String idAnuncio;
  final String idViatura;
  final String destinacaoViatura;
  final bool sincronizado;

  AnuncioViatura({
    required this.idAnuncio,
    required this.idViatura,
    required this.destinacaoViatura,
    this.sincronizado = false,
  });

  factory AnuncioViatura.fromMap(Map<String, dynamic> map) {
    return AnuncioViatura(
      idViatura: map['idViatura'] ?? '',
      idAnuncio: map['idAnuncio'] ?? '',
      destinacaoViatura: map['destinacaoViatura'] ?? '',      
      sincronizado: map['sincronizado'] ?? '',      
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'idViatura': idViatura,
      'idAnuncio': idAnuncio,
      'destinacaoViatura': destinacaoViatura,      
      'sincronizado': sincronizado,      
    };
  }

}
