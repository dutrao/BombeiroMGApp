import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen/home_cards.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/home_screen/efetivo_card.dart';
import 'package:flutter_application_1/screen/ocorrencias_screen/ocorrencias_screen.dart';
import 'package:flutter_application_1/screen/chat_screen/home_chat_screen.dart';
import 'package:flutter_application_1/screen/efetivo_operacional/efetivo_operacional_screen.dart';
import 'package:flutter_application_1/screen/frota_operacional_screen/frota_operacional_screen.dart';
import 'package:flutter_application_1/screen/militares_screen/militares_screen.dart';
import 'package:flutter_application_1/screen/home_screen/demandas_widged/demandas_widget.dart';
import 'package:flutter_application_1/screen/home_screen/ocorrencias_home_card.dart';
import 'package:flutter_application_1/screen/perfil_screen/perfil_screen.dart';
import 'package:flutter_application_1/screen/viaturas_screen/viaturas_screen.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> itensHome = [
    {
      'icone': Icons.people,
      'nome': 'Anúncio Efetivo',
      'tela': EfetivoOperacionalScreen(),
    },
    {
      'icone': Icons.fire_truck,
      'nome': 'Anúncio Frota',
      'tela': FrotaOperacionalScreen(),
    },
    {
      'icone': Icons.assignment,
      'nome': 'Anúncio Ocorrências',
      'tela': OcorrenciasScreen(),
    },
    {'icone': Icons.person, 'nome': 'Militares', 'tela': MilitaresScreen()},
     {
      'icone': Icons.fire_truck,
      'nome': 'Viaturas',
      'tela': ViaturasScreen(),
    },
    {'icone': Icons.chat, 'nome': 'Chat', 'tela': HomeChatScreen()},
  ];
  Militar? militarUsuario;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await atualizarDadosUsuario();         
    },); 
    
  }

  @override
  Widget build(BuildContext context) {   
    return SingleChildScrollView(
      key: ValueKey(Constants.homeSingleScrollView),
      child: Column(
        children: [
          Container(
            height: 185,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff9e0f20), Color(0xffe35033)])
            ),
            child: Row(              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/brasao.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Olá, ${militarUsuario?.cargo ?? '---'} ${militarUsuario?.nomeDeGuerra ?? ''}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      
                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.fromLTRB(0,30,0,0),
                  child: Align(alignment: AlignmentGeometry.centerLeft, child: Image.asset('assets/logo_7bbm_preto.png',width: 140, height: 140,)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 0);
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          child: HomeCards(
                            icone: itensHome[index]['icone'],
                            cardName: itensHome[index]['nome'],
                            tela: itensHome[index]['tela'],
                          ),
                        );
                      },
                      itemCount: itensHome.length,
                    ),
                  ),
                  EfetivoCard(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: OcorrenciasHomeCard(),
                  ),
                  DemandasWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> atualizarDadosUsuario() async {
    militarUsuario = await context.read<Storage>().pegarDadosUsuario();
    if(!mounted){return;}   
    
    setState(() {});
  } 

  Future navegarParaPerfil() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PerfilScreen()),
    );
  }
}
