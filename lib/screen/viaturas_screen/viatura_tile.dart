import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/viatura.dart';
import 'package:flutter_application_1/screen/detalhes_viatura_screen/detalhes_viatura_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ViaturaTile extends StatelessWidget {
  final Viatura viatura;
  const ViaturaTile({super.key, required this.viatura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesViaturaScreen(viatura: viatura),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          height: 80,
          child: Row(
            children: [
              escolherImagem(viatura.tipoViatura),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${viatura.tipoViatura}-${viatura.prefixo}',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }

  Image escolherImagem(String tipoViatura){
   switch(tipoViatura){
      case 'ASL':
      return Image.asset('assets/ASL.png', height: 100, width: 100,);

      case 'UR': 
      return Image.asset('assets/UR.png', height: 100, width: 100);

      case 'ABTS': 
      return Image.asset('assets/ABTS.png',  height: 100, width: 100);

      case 'APF': 
      return Image.asset('assets/APF.png',  height: 100, width: 100);

      case 'TC':
      return Image.asset('assets/TC.png',  height: 100, width: 100);

      case 'K9':
      return Image.asset('assets/K9.png',  height: 100, width: 100);

      case 'ASM':
      return Image.asset('assets/ASM.png',  height: 100, width: 100);

      default:
      return Image.asset('assets/APF.png',  height: 100, width: 100);
    }
  }
}
