import 'package:flutter/material.dart';

class AdicionarMilitarAnuncioButtom extends StatelessWidget {
  final VoidCallback onTap;  
  const AdicionarMilitarAnuncioButtom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20),      
      color: Colors.transparent,
      child: InkWell(        
        onTap: () {
          onTap();
        },
        child: Ink(                         
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person_add),
                SizedBox(width: 5,),
                Text('Adicionar Militar',style: TextStyle(color: Color(0xff8d1917), fontSize: 15, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}