class AnuncioMilitar {
  final String idMilitar;
  final String idAnuncio;
  final String destinacaoMilitar;
  final bool sincronizado;

  AnuncioMilitar({
    required this.idMilitar,
    required this.idAnuncio,
    required this.destinacaoMilitar,
    this.sincronizado = false,
  });

  factory AnuncioMilitar.fromMap(Map<String, dynamic> map) {
    return AnuncioMilitar(
      idMilitar: map['idMilitar'] ?? '',
      idAnuncio: map['idAnuncio'] ?? '',
      destinacaoMilitar: map['destinacaoMilitar'] ?? '',
      sincronizado: map['sincronizado'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMilitar': idMilitar,
      'idAnuncio': idAnuncio,
      'destinacaoMilitar': destinacaoMilitar,
      'sincronizado': sincronizado,
    };
  }
}