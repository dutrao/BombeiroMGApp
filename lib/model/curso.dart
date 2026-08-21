class Curso {
  String idCurso;
  String nomeCurso;
  bool sincronizado;

  Curso({
    required this.idCurso,
    required this.nomeCurso,
    this.sincronizado = false,
  });

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      idCurso: map['idCurso'] ?? '',
      nomeCurso: map['nomeCurso'] ?? '',
      sincronizado:
          map['sincronizado'] == true || map['sincronizado'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCurso': idCurso,
      'nomeCurso': nomeCurso,
      'sincronizado': sincronizado,
    };
  }
}