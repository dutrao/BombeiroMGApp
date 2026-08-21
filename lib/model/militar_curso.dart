class MilitarCurso {
  String idCurso;
  String idMilitar;
  bool deletado;
  bool sincronizado;

  MilitarCurso({
    required this.idCurso,
    required this.idMilitar,
    this.sincronizado = false,
    this.deletado = false,
  });

  factory MilitarCurso.fromMap(Map<String, dynamic> map) {
    return MilitarCurso(
      idCurso: map['idCurso'] ?? '',
      idMilitar: map['idMilitar'] ?? '',
      sincronizado:
          map['sincronizado'] == true ||
          map['sincronizado'] == 1,
      deletado:
          map['deletado'] == true ||
          map['deletado'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCurso': idCurso,
      'idMilitar': idMilitar,
      'sincronizado': sincronizado,
      'deletado': deletado,
    };
  }
}