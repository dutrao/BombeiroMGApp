import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/lista_cursos_tile.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/lista_detalhes_militar.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/model_detalhes_militar_tile.dart';

class DetalhesMilitarScreen extends StatefulWidget {
  final Militar militar;
  const DetalhesMilitarScreen({super.key, required this.militar});

  @override
  State<DetalhesMilitarScreen> createState() => _DetalhesMilitarScreenState();
}

Map<String, List<ModelDetalhesMilitarTile>> dadosMilitar = {
  'dadosPessoais': [
    ModelDetalhesMilitarTile(iconData: Icons.person, nomeDado: 'Nome Completo'),
    ModelDetalhesMilitarTile(
      iconData: Icons.person_outline,
      nomeDado: 'Nome de Guerra',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.calendar_month,
      nomeDado: 'Data de nascimento',
    ),
    ModelDetalhesMilitarTile(iconData: Icons.badge_outlined, nomeDado: 'CPF'),
    ModelDetalhesMilitarTile(iconData: Icons.location_city, nomeDado: 'Cidade'),
    ModelDetalhesMilitarTile(iconData: Icons.home, nomeDado: 'Bairro'),
    ModelDetalhesMilitarTile(iconData: Icons.add_road, nomeDado: 'Rua'),
    ModelDetalhesMilitarTile(iconData: Icons.tag, nomeDado: 'Número'),
    ModelDetalhesMilitarTile(
      iconData: Icons.description_outlined,
      nomeDado: 'Complemento',
    ),
    ModelDetalhesMilitarTile(iconData: Icons.mail_outline, nomeDado: 'CEP'),
  ],
  'dadosMilitares': [
    ModelDetalhesMilitarTile(
      iconData: Icons.military_tech,
      nomeDado: 'Posto / Graduação',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.location_city,
      nomeDado: 'Unidade atual',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.credit_card,
      nomeDado: 'Cred Motorista',
    ),
    ModelDetalhesMilitarTile(iconData: Icons.work, nomeDado: 'Função'),
  ],
  'dadosDSP': [
    ModelDetalhesMilitarTile(
      iconData: Icons.account_balance,
      nomeDado: 'Banco da CC',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.account_balance_wallet_outlined,
      nomeDado: 'Número da CC',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.business,
      nomeDado: 'Número da Agência',
    ),
    ModelDetalhesMilitarTile(
      iconData: Icons.payments_outlined,
      nomeDado: 'Quantidade ADI',
    ),
  ],

  'contato': [
    ModelDetalhesMilitarTile(iconData: Icons.phone, nomeDado: 'Telefone'),
    ModelDetalhesMilitarTile(
      iconData: Icons.email_outlined,
      nomeDado: 'E-mail',
    ),
  ],
};

class _DetalhesMilitarScreenState extends State<DetalhesMilitarScreen> {
  bool mostrandoImagem = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Dados do Militar')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.militar.urlImagem == ''
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      mostrandoImagem = true;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 35,
                                    child: Icon(Icons.person, size: 50),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    35,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        mostrandoImagem = true;
                                      });
                                    },
                                    child: Image.network(
                                      widget.militar.urlImagem,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${widget.militar.cargo} ${widget.militar.nomeDeGuerra}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      2,
                                      0,
                                      4,
                                    ),
                                    child: Text(
                                      widget.militar.funcao,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(widget.militar.numeroBMFormatado),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListaDetalhesMilitar(
                    militar: widget.militar,
                    nomeLista: 'Dados Pessoais',
                    listaInformacoesTile: dadosMilitar['dadosPessoais']!,
                  ),
                  SizedBox(height: 20),
                  ListaDetalhesMilitar(
                    militar: widget.militar,
                    nomeLista: 'Dados Militares',
                    listaInformacoesTile: dadosMilitar['dadosMilitares']!,
                  ),
                  SizedBox(height: 20),
                  ListaCursosTile(militar: widget.militar),
                  SizedBox(height: 20),
                  ListaDetalhesMilitar(
                    militar: widget.militar,
                    nomeLista: 'Dados DSP',
                    listaInformacoesTile: dadosMilitar['dadosDSP']!,
                  ),
                  SizedBox(height: 20),
                  ListaDetalhesMilitar(
                    militar: widget.militar,
                    nomeLista: 'Contato',
                    listaInformacoesTile: dadosMilitar['contato']!,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (mostrandoImagem) ...[
          ModalBarrier(
            color: Colors.black45,
            onDismiss: () {
              setState(() {
                mostrandoImagem = false;
              });
            },
          ),
          widget.militar.urlImagem == ''
              ? Center(
                child: CircleAvatar(
                  radius: 150,
                  child: Icon(Icons.person, size: 200),
                ),
              )
              : Center(
                child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(150),
                    child: Image.network(
                      widget.militar.urlImagem,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
        ],
      ],
    );
  }

  void carregarImagem() {}
}
