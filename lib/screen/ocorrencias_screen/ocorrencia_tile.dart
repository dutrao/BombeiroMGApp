import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/ocorrencia.dart';
import 'package:google_fonts/google_fonts.dart';

class OcorrenciaTile extends StatefulWidget {
  final Ocorrencia ocorrencia;
  const OcorrenciaTile({super.key, required this.ocorrencia});

  @override
  State<OcorrenciaTile> createState() => _OcorrenciaTileState();
}

class _OcorrenciaTileState extends State<OcorrenciaTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(
        widget.ocorrencia.codigo,
        style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        widget.ocorrencia.nomeOcorrencia,
        style: GoogleFonts.inter(fontSize: 13),
      ),
    );
  }
}
