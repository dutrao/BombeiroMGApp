import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/model_detalhes_militar_tile.dart';
import 'package:flutter_application_1/screen/detalhes_viatura_screen/lista_viatura_tile.dart';

class ListaDetalhesViatura extends StatelessWidget {
  final Viatura viatura;
  final String nomeLista;
  final List<ModelDetalhesMilitarTile> listaInformacoesTile;
  const ListaDetalhesViatura({
    super.key,
    required this.nomeLista,
    required this.listaInformacoesTile,
    required this.viatura,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color(0xffE5E7EB), width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xffF7F7F7)),
            child: Text(
              nomeLista,
              style: TextStyle(fontSize: 18, color: Color(0xff8d1917)),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListaViaturaTile(
                  iconData: listaInformacoesTile[index].iconData,
                  nomeInformacao: listaInformacoesTile[index].nomeDado,
                  dadoViatura: encontrarDadoViatura(
                    listaInformacoesTile[index].nomeDado,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(indent: 50, thickness: 1, color: Color(0xffE5E7EB)),
              itemCount: listaInformacoesTile.length,
            ),
          ),
        ],
      ),
    );
  }

  String encontrarDadoViatura(String nomeInformacao) {
    switch (nomeInformacao) {
      case 'Marca':
        return viatura.marca;
      case 'Modelo':
        return viatura.modelo;
      case 'Ano':
        return viatura.ano.toString();
      case 'Combustível':
        return viatura.combustivel;
      case 'Categoria':
        return viatura.categoria;
      case 'Placa':
        return viatura.placa;
      default:
        return '';
    }
  }
}
