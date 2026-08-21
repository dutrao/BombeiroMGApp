import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/anuncio_item.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/dialog_militar_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class MilitaresDialog extends StatefulWidget {
  final ItemAnuncioMilitares itemAnuncio;
  const MilitaresDialog({super.key, required this.itemAnuncio});

  @override
  State<MilitaresDialog> createState() => _MilitaresDialogState();
}

class _MilitaresDialogState extends State<MilitaresDialog> {
  List<Militar> listaMilitaresDialog = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    atualizarMilitares();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Storage>(context);
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
                'Adicionar Militar',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 10),
              SearchBar(
                controller: searchController,
                leading: Icon(Icons.search),
                hintText: 'Buscar militar por nome',
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DialogMilitarTile(
                      itemAnuncio: widget.itemAnuncio,
                      militar: listaMilitaresDialog[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: listaMilitaresDialog.length,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {                    
                  });
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void atualizarMilitares() {
    listaMilitaresDialog = context.read<Storage>().listaTotalMilitares;
  }
}
