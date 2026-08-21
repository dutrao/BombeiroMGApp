import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/screen/detalhes_militar_screen/detalhes_militar_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMilitar extends StatefulWidget {
  final Militar militar;
  const CardMilitar({super.key, required this.militar});

  @override
  State<CardMilitar> createState() => _CardMilitarState();
}

class _CardMilitarState extends State<CardMilitar> {
  bool carregandoImagem = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetalhesMilitarScreen(militar: widget.militar),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(4),
          height: 100,
          child: Row(
            children: [
              SizedBox(width: 10,),
              widget.militar.urlImagem == ''
                  ? CircleAvatar(radius: 40, child: Icon(Icons.person))
                  : ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(40),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,                        
                        widget.militar.urlImagem,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const SizedBox(
                            height: 80,
                            width: 80,
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.militar.nomeCompleto,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${widget.militar.cargo} BM',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(widget.militar.numeroBMFormatado),
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
}
