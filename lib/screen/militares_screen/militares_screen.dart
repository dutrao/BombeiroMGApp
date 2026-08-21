import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/card_militar.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/militares_screen/filtro_militares_widget.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class MilitaresScreen extends StatefulWidget {
  const MilitaresScreen({super.key});

  @override
  State<MilitaresScreen> createState() => _MilitaresScreenState();
}

class _MilitaresScreenState extends State<MilitaresScreen> {
  bool carregandoDados = true;
  bool mostrandoFiltro = false;
  List<Militar> listaMilitaresFiltrada = [];
  List<String> listaNomeCursosFiltro = [];
  List<String> listaNomeCursosParaFiltragem = [];
  final TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await atualizarListaMilitares();

      if (!mounted) return;

      final storage = context.read<Storage>();

      final listaTodosCursos = storage.listaCursos;

      setState(() {
        listaMilitaresFiltrada = storage.listaTotalMilitares;

        listaNomeCursosFiltro = listaTodosCursos.map((curso) {
          return curso.nomeCurso;
        }).toList();
      });

      print('numero total de cursos: ${listaNomeCursosFiltro.length}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    pesquisaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    final listaTodosMilitares = storage.listaTotalMilitares;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Militares da Unidade'),
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  setState(() {
                    mostrandoFiltro = !mostrandoFiltro;
                  });
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SearchBar(
                    controller: pesquisaController,
                    hintText: 'Digite o nome do militar',
                    onChanged: (value) async {
                      if (value.isEmpty &&
                          listaNomeCursosParaFiltragem.isEmpty) {
                        listaMilitaresFiltrada = listaTodosMilitares;
                      } else if (value.isEmpty &&
                          listaNomeCursosParaFiltragem.isNotEmpty) {
                        listaMilitaresFiltrada = await context
                            .read<Storage>()
                            .buscarMilitaresPorListaCurso(
                              listaNomeCursosParaFiltragem,
                            );
                      } else {
                        listaMilitaresFiltrada = listaTodosMilitares.where((
                          militar,
                        ) {
                          return militar.nomeCompleto.toLowerCase().contains(
                            value.toLowerCase(),
                          );
                        }).toList();
                      }
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: mostrandoFiltro,
                    child: FiltroMilitaresWidget(
                      listaNomeCursos: listaNomeCursosFiltro,
                      listaNomeCursosFiltragem: listaNomeCursosParaFiltragem,
                      onFiltroAlterado: () async {
                        if (listaNomeCursosParaFiltragem.isEmpty) {
                          listaMilitaresFiltrada = listaTodosMilitares;
                        } else {
                          listaMilitaresFiltrada = await context
                              .read<Storage>()
                              .buscarMilitaresPorListaCurso(
                                listaNomeCursosParaFiltragem,
                              );
                        }
              
                        if (!mounted) return;
              
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CardMilitar(
                          militar: listaMilitaresFiltrada[index],
                        );
                      },
                      itemCount: listaMilitaresFiltrada.length,
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

  Future<void> atualizarListaMilitares() async {
    try {
      await context.read<Storage>().atualizarListaTodosMilitares();
    } on Exception catch (e) {
      print(e);
      // TODO
    } finally {
      if (!mounted) return;
      setState(() {
        carregandoDados = false;
      });
    }
  }
}
