class Viatura {
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

  Viatura({
    required this.idViatura,
    required this.prefixo,
    required this.tipoViatura,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.combustivel,
    required this.categoria,
    required this.placa,
    this.deletado = false,
    this.sincronizado = false,
  });

  factory Viatura.fromMap(Map<String, dynamic> map) {
    return Viatura(
      idViatura: map['idViatura'] ?? map['id_viatura'] ?? '',
      prefixo: map['prefixo'] ?? '',
      tipoViatura: map['tipoViatura'] ?? map['tipo_viatura'] ?? '',
      marca: map['marca'] ?? '',
      modelo: map['modelo'] ?? '',
      ano: map['ano']?.toString() ?? '',
      combustivel: map['combustivel'] ?? '',
      categoria: map['categoria'] ?? '',
      placa: map['placa'] ?? '',
      deletado: map['deletado'] == true || map['deletado'] == 1,
      sincronizado:
          map['sincronizado'] == true || map['sincronizado'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idViatura': idViatura,
      'prefixo': prefixo,
      'tipoViatura': tipoViatura,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'combustivel': combustivel,
      'categoria': categoria,
      'placa': placa,
      'deletado': deletado,
      'sincronizado': sincronizado,
    };
  }
}