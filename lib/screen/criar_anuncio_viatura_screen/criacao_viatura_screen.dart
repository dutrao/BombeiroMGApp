import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/confirm_criacao_viatura_dialog.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../storage/storage.dart';

class CriacaoViaturaScreen extends StatefulWidget {
  const CriacaoViaturaScreen({super.key});

  @override
  State<CriacaoViaturaScreen> createState() => _CriacaoViaturaScreenState();
}

class _CriacaoViaturaScreenState extends State<CriacaoViaturaScreen> {
  TextEditingController prefixoController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController placaController = TextEditingController();

  bool enviandoAnuncio = false;

  String tipoViatura = '';
  String marcaViatura = '';
  String anoViatura = '';
  String tipoCombustivel = '';
  String categoriaViatura = '';
  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text('Cadastrar Viatura')),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prefixo', style: TextStyle(fontSize: 18)),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: prefixoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o prefixo';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Placa', style: TextStyle(fontSize: 18)),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),                        
                        controller: placaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite a placa';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      Text('Tipo de Viatura', style: TextStyle(fontSize: 18)),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpansionTile(
                          title: tipoViatura.isEmpty
                              ? Text('Selecione o tipo da viatura')
                              : Text(tipoViatura),
                          children: [
                            ListTile(
                              title: Text('ASL'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'ASL';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('UR'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'UR';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('ABTS'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'ABTS';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('ASM'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'ASM';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('APF'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'APF';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('TC'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'TC';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('ABTF'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'ABTF';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('K9'),
                              onTap: () {
                                setState(() {
                                  tipoViatura = 'K9';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Marca', style: TextStyle(fontSize: 18)),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpansionTile(
                          title: marcaViatura.isEmpty
                              ? Text('Selecione a marca viatura')
                              : Text(marcaViatura),
                          children: [
                            ListTile(
                              title: Text('VolksWagen'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'VolksWagen';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Toyota'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Toyota';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Fiat'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Fiat';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Chevrolet'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Chevrolet';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Ford'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Ford';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Renault'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Renault';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Mercedes'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Mercedes';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Scania'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Scania';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Outros'),
                              onTap: () {
                                setState(() {
                                  marcaViatura = 'Outros';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Modelo', style: TextStyle(fontSize: 18)),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        controller: modeloController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite o modelo';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Ano', style: TextStyle(fontSize: 18)),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpansionTile(
                          title: anoViatura == ''
                              ? Text('Selecione o ano da Viatura')
                              : Text(anoViatura),
                          children: [
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: 30,
                                itemBuilder: (context, index) {
                                  final int ano =
                                      DateTime.now().year + 1 - index;
                                  return ListTile(
                                    title: Text(ano.toString()),
                                    onTap: () {
                                      setState(() {
                                        anoViatura = ano.toString();
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Combustível', style: TextStyle(fontSize: 18)),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpansionTile(
                          title: tipoCombustivel.isEmpty
                              ? Text('Selecione o tipo de Combustível')
                              : Text(tipoCombustivel),
                          children: [
                            ListTile(
                              title: Text('Gasolina'),
                              onTap: () {
                                setState(() {
                                  tipoCombustivel = 'Gasolina';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Alcool'),
                              onTap: () {
                                setState(() {
                                  tipoCombustivel = 'Alcool';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Diesel'),
                              onTap: () {
                                setState(() {
                                  tipoCombustivel = 'Diesel';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Categoria', style: TextStyle(fontSize: 18)),
                      Ink(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpansionTile(
                          title: categoriaViatura.isEmpty
                              ? Text('Selecione a categoria')
                              : Text(categoriaViatura),
                          children: [
                            ListTile(
                              title: Text('Caminhonete'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Caminhonete';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Caminhão'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Caminhão';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Ambulância'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Ambulância';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Sedan'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Sedan';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Hatch'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Hatch';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('SUV'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'SUV';
                                });
                              },
                            ),
                            ListTile(
                              title: Text('Caminhoneta'),
                              onTap: () {
                                setState(() {
                                  categoriaViatura = 'Caminhoneta';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              await confirmarEnvioDialog(cadastrarViatura);                             
                            },
                            child: Text('Cadastrar Viatura'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (enviandoAnuncio) ...[
          ModalBarrier(dismissible: false, color: Colors.black26,),
          Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

Future<void> cadastrarViatura() async {
  // 1. Primeiro valida os campos
  if (categoriaViatura == '' ||
      tipoCombustivel == '' ||
      tipoViatura == '' ||
      anoViatura == '' ||
      marcaViatura == ''
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.close),
            SizedBox(width: 8),
            Expanded(
              child: Text('Preencha/selecione todos os campos'),
            ),
          ],
        ),
      ),
    );

    return;
  }

  if (!_formKey.currentState!.validate()) {
    return;
  }

  // 2. Somente agora começa o envio
  setState(() {
    enviandoAnuncio = true;
  });

  final timer = Timer(
    const Duration(seconds: 5),
    () {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange,),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Serviço com lentidão. Verifique sua conexão com a internet',
                ),
              ),
            ],
          ),
        ),
      );
      setState(() {
        enviandoAnuncio = false;
      });
    },
  );

  try {    
    await inserirViaturaNoDrift();    
    await sincronizarViaturasLocalParaNuvem();
   
    timer.cancel();

    if (!mounted) return;

    setState(() {
      enviandoAnuncio = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Expanded(
              child: Text('Sucesso ao registrar viatura'),
            ),
          ],
        ),
      ),
    );
  } on Exception catch (e) {
    timer.cancel();

    if (!mounted) return;

    setState(() {
      enviandoAnuncio = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.close),
            SizedBox(width: 8),
            Expanded(
              child: Text('Erro ao tentar registrar viatura'),
            ),
          ],
        ),
      ),
    );
    debugPrint('Erro ao cadastrar viatura: $e');
  }
}

  Future<void> inserirViaturaNoDrift() async {
    context.read<Storage>().adicionarViaturaNoDrift(
      Viatura(
        idViatura: Uuid().v4(),
        prefixo: prefixoController.text,
        tipoViatura: tipoViatura,
        marca: marcaViatura,
        modelo: modeloController.text,
        ano: anoViatura.toString(),
        combustivel: tipoCombustivel,
        categoria: categoriaViatura,
        placa: placaController.text,
      ),
    );
  }

  Future<void> sincronizarViaturasLocalParaNuvem() async {
   await  context.read<Storage>().sincronizarViaturaLocalParaNuvem();
  }

   Future<void> confirmarEnvioDialog(Future<void> Function() function) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmarCriacaoViaturaDialog(function: function),
    );
  }
}
