import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/chat_screen/chat_tile.dart';

class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({super.key});

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  List<Militar> listaConversa = [
   /* Militar(
      idMilitar: 'uuidMilitar',
      cpf: '',
      nomeCompleto: 'Lucas Dutra Cabral',
      nomeDeGuerra: 'Dutra',
      numeroBM: '1236742',
      cargo: '2º Ten',
      credencialMotorista: '',
      dataNascimento: DateTime(1994, 9, 28),
      estadoCivil: 'solteiro',
      unidadeAtual: '7º BBM',
      rua: '',
      bairro: '',
      cidade: '',
      numero: '',
      cep: '',
      telefone: '33999885026',
      email: 'dutra@bombeiros',
      naturalidade: '',
      urlImagem: 'urlImagem',
      funcao: '',
      obs: 'obs',
      sincronizado: false,
    ),
    Militar(
      idMilitar: 'uuidMilitar2',
      cpf: '',
      nomeCompleto: 'Lucas Dutra Cabral',
      nomeDeGuerra: 'Dutra',
      numeroBM: '1236742',
      cargo: '2º Ten',
      credencialMotorista: '',
      dataNascimento: DateTime(1994, 9, 28),
      estadoCivil: 'solteiro',
      unidadeAtual: '7º BBM',
      rua: '',
      bairro: '',
      cidade: '',
      numero: '',
      cep: '',
      telefone: '33999885026',
      email: 'dutra@bombeiros',
      naturalidade: '',
      urlImagem: 'urlImagem',
      funcao: '',
      obs: 'obs',
      sincronizado: false,
    ),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchBar(
                leading: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaConversa.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                    child: ChatTile(
                      militar: listaConversa[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void carregarConversas() {}
}