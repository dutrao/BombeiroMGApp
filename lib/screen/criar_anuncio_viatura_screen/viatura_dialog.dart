import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item_anuncio_viaturas.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/dialog_viatura_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

import '../../model/viatura.dart';

class ViaturaDialog extends StatefulWidget {
  final ItemAnuncioViaturas itemAnuncio;
  const ViaturaDialog({super.key, required this.itemAnuncio});

  @override
  State<ViaturaDialog> createState() => _ViaturaDialogState();
}

class _ViaturaDialogState extends State<ViaturaDialog> {
  List<Viatura> listaTodasViatura = [];
  List<Viatura> listaViaturaFiltrada = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    atualizarViaturas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 450,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Adicionar Viatura',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 10),
               SearchBar(
                keyboardType: TextInputType.number,              
                hintText: 'Digite  prefixo da viatura',
                onChanged: (value) async {
                  if (value.isEmpty) {
                    listaViaturaFiltrada = listaTodasViatura;
                  }else {
                    listaViaturaFiltrada = listaTodasViatura.where((
                      viatura,
                    ) {
                      return viatura.prefixo.contains(
                        value
                      );
                    }).toList();
                  }
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DialogViaturaTile(
                      itemAnuncio: widget.itemAnuncio,
                      viatura: listaViaturaFiltrada[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: listaViaturaFiltrada.length,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> atualizarViaturas()async {
    await context.read<Storage>().atualizarListaTotalViaturas();
    setState(() {
      listaTodasViatura = context.read<Storage>().listaTotalViaturas;
      listaViaturaFiltrada = listaTodasViatura;      
    });    
  }
}
