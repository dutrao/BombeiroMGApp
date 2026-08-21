import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/screen/viaturas_screen/viatura_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class ViaturasScreen extends StatefulWidget {
  const ViaturasScreen({super.key});

  @override
  State<ViaturasScreen> createState() => _ViaturasScreenState();
}

class _ViaturasScreenState extends State<ViaturasScreen> {
  bool carregandoDados = false;
  List<Viatura> listaViaturaFiltrada = [];     
  final TextEditingController pesquisaController = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
     await atualizarListaViaturas();
     if(!mounted)return;
     setState(() {
      print('numero total de viaturas pos autalização: ${context.read<Storage>().listaTotalViaturas.length}');
     });
    },);   
  }

  @override
  void dispose() {
    super.dispose();
    pesquisaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final List<Viatura> listaTodasViaturas = storage.listaTotalViaturas;
    listaViaturaFiltrada = context.read<Storage>().listaTotalViaturas;     
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Viaturas da Unidade')),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SearchBar(
                    keyboardType: TextInputType.number,
                    controller: pesquisaController,
                    hintText: 'Digite o prefixo da viatura',
                    onChanged: (value) {
                      if(value == ''){
                        listaViaturaFiltrada = listaTodasViaturas;
                        setState(() {                          
                        });
                      }else{
                       listaViaturaFiltrada = listaTodasViaturas.where((viatura) {
                         return viatura.prefixo.toLowerCase().contains(value.toLowerCase());
                       },).toList();
                       setState(() {                         
                       });
                      }
                    },                    
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ViaturaTile(viatura: listaViaturaFiltrada[index]);
                      },
                      itemCount: listaViaturaFiltrada.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (carregandoDados) ...[
          ModalBarrier(color: Colors.black26),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }  

  Future<void> atualizarListaViaturas()async{
   await context.read<Storage>().atualizarListaTotalViaturas();      
  }
  
}
