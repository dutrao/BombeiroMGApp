import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/lista_militar_tile.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/model_detalhes_militar_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class ListaDetalhesMilitar extends StatefulWidget {
  final Militar militar;
  final String nomeLista;
  final List<ModelDetalhesMilitarTile> listaInformacoesTile;
  const ListaDetalhesMilitar({
    super.key,
    required this.nomeLista,
    required this.listaInformacoesTile,
    required this.militar,
  });

  @override
  State<ListaDetalhesMilitar> createState() => _ListaDetalhesMilitarState();
}

class _ListaDetalhesMilitarState extends State<ListaDetalhesMilitar> {
  List<String> listaCursosDoMilitar = [];
  String idMilitar = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      idMilitar = await context.read<Storage>().pegarIdMilitarUsuario();
      carregarCursosDosMilitar(idMilitar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Color.fromARGB(255, 48, 61, 88),width: 0.1 ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xffF7F7F7)),
            child: Text(
              widget.nomeLista,
              style: TextStyle(fontSize: 18, color: Color(0xff8d1917), fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListaMilitarTile(
                  iconData: widget.listaInformacoesTile[index].iconData,
                  nomeInformacao: widget.listaInformacoesTile[index].nomeDado,
                  dadoMilitar: encontrarDadoMilitar(
                    widget.listaInformacoesTile[index].nomeDado,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(indent: 50, thickness: 1, color: Color(0xffE5E7EB)),
              itemCount: widget.listaInformacoesTile.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> carregarCursosDosMilitar(String idMilitar) async {
    listaCursosDoMilitar = await context
        .read<Storage>()
        .pegarListaNomeCursosPorMilitar(idMilitar);
    print('numero cursos do militar: ${listaCursosDoMilitar.length}');
  }

  String encontrarDadoMilitar(String nomeInformacao) {
    switch (nomeInformacao) {
      case 'Nome Completo':
        return widget.militar.nomeCompleto;

      case 'Nome de Guerra':
        return widget.militar.nomeDeGuerra;

      case 'Data de nascimento':
        return widget.militar.dataNascimentoFormatado;

      case 'CPF':
        return widget.militar.cpf;

      case 'Cidade':
        return widget.militar.cidade;

      case 'Bairro':
        return widget.militar.bairro;

      case 'Rua':
        return widget.militar.rua;

      case 'Número':
        return widget.militar.numeroResidencia;

      case 'Complemento':
        return widget.militar.complementoEndereco;

      case 'CEP':
        return widget.militar.cep;

      case 'Naturalidade':
        return widget.militar.naturalidade;

      case 'Estado Civil':
        return widget.militar.estadoCivil;

      case 'Posto / Graduação':
        return widget.militar.cargo;

      case 'Unidade atual':
        return widget.militar.unidadeAtual;

      case 'Credenciamento Motorista':
        return widget.militar.credencialMotorista;

      case 'Cursos':
        return 'Não informado';

      // DADOS DSP
      case 'Banco da CC':
        return widget.militar.banco;

      case 'Número da CC':
        return widget.militar.numeroConta;

      case 'Número da Agência':
        return widget.militar.numeroAg;

      case 'Quantidade ADI':
        return widget.militar.quantidadeAdi;

      case 'Telefone':
        return widget.militar.telefone;

      case 'E-mail':
        return widget.militar.email;

      default:
        return 'Não informado';
    }
  }
}
