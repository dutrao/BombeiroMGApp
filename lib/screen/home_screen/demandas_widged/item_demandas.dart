class ItemDemandas {
  final String numero;
  final String titulo;
  final String dataInicio;
  final String dataFinal;
  final String pathDownload;

  ItemDemandas({
    required this.numero,
    required this.titulo,
    required this.dataInicio,
    required this.dataFinal,
    required this.pathDownload,
  });

  factory ItemDemandas.fromMap(Map map) {
    return ItemDemandas(
      numero: map['numero'],
      titulo: map['titulo'],
      dataInicio: map['dataInicio'],
      dataFinal: map['dataFim'],
      pathDownload: '',
    );
  }
}
