import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/demanda.dart';
import 'package:flutter_application_1/screen/home_screen/demandas_widged/demandas_buttom.dart';
import 'package:flutter_application_1/screen/home_screen/demandas_widged/demandas_tile.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class DemandasWidget extends StatefulWidget {
  
 const DemandasWidget({super.key,});

  @override
  State<DemandasWidget> createState() => _DemandasWidgetState();
}

class _DemandasWidgetState extends State<DemandasWidget> { 

  @override
  void initState() {   
    super.initState();   
  }

  @override
  Widget build(BuildContext context) {
   final List<Demanda> listaDemandas = context.watch<Storage>().listaDemandas;   
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.grey),
      borderRadius: BorderRadius.circular(20)),
      height: 400,      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,        
        children: [SizedBox(height: 40,        
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [DemandasButtom(texto: 'O.S Vigentes'),                       
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,            
            itemBuilder: (context, index) {
            return DemandasTile(demanda: listaDemandas[index]);
          },
          itemCount: listaDemandas.length,),
        )],
        

      ),
    );
  }

}