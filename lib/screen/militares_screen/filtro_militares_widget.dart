import 'package:flutter/material.dart';

class FiltroMilitaresWidget extends StatefulWidget {
  final List<String> listaNomeCursos;
  final List<String> listaNomeCursosFiltragem;
  final Function() onFiltroAlterado;

  const FiltroMilitaresWidget({
    super.key,
    required this.listaNomeCursos,
    required this.listaNomeCursosFiltragem, required this.onFiltroAlterado,
  });

  @override
  State<FiltroMilitaresWidget> createState() =>
      _FiltroMilitaresWidgetState();
}

class _FiltroMilitaresWidgetState
    extends State<FiltroMilitaresWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [Icon(Icons.filter_list),
                Text('Filtro por cursos'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8,0,8),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.1)
                ),
                child: ExpansionTile(
                  title: const Text('Cursos'),
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,            
                        itemCount: widget.listaNomeCursos.length,
                        itemBuilder: (context, index) {
                          final nomeCurso = widget.listaNomeCursos[index];
                          return ListTile(
                            title: Text(nomeCurso),
                            trailing: Checkbox(
                              value: widget.listaNomeCursosFiltragem.contains(nomeCurso),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    widget.listaNomeCursosFiltragem.add(nomeCurso);
                                  } else {
                                    widget.listaNomeCursosFiltragem.remove(nomeCurso);
                                  }
                                });
                                widget.onFiltroAlterado();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}