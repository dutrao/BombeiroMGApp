import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screen/administradores_screen/anuncio_cards.dart';
import 'package:flutter_application_1/screen/criacao_anuncio_ocorrencias_screen/criacao_anuncio_ocorrencias_screen.dart';
import 'package:flutter_application_1/screen/criacao_demanda_screen/criacao_demanda_screen.dart';
import 'package:flutter_application_1/screen/criar_anuncio_militar_screens/criar_anuncio_militar_screen.dart';
import 'package:flutter_application_1/screen/criar_anuncio_viatura_screen/criacao_anuncio_viatura_screen.dart';

class AdministradorScreen extends StatefulWidget {
  const AdministradorScreen({super.key});

  @override
  State<AdministradorScreen> createState() => _AdministradorScreenState();
}

class _AdministradorScreenState extends State<AdministradorScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30,0,0),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('Escolha o tipo de', style: TextStyle(fontSize: 22)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  'Anúncio',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff8d1917),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:  8.0),
              child: Divider(indent: 16 ,endIndent: 220, thickness: 3,color: Color(0xff8d1917)),
            ),
            AnuncioCards(
              key: ValueKey(Constants.administradoresScreenAnuncioMilitarCard),
              nomeAnuncio: 'Militares',
              iconeAnuncio: Icons.groups,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CriarAnuncioMilitarScreen()),
              ),
            ),
            AnuncioCards(
              key: ValueKey(Constants.administradoresScreenAnuncioViaturaCard),
              nomeAnuncio: 'Viaturas',
              iconeAnuncio: Icons.fire_truck,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CriacaoViaturaAnuncioScreen(),
                ),
              ),
            ),
            AnuncioCards(
              key: ValueKey(Constants.administradoresScreenAnuncioOcorrenciaCard),
              nomeAnuncio: 'Ocorrencias',
              iconeAnuncio: Icons.list,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CriacaoAnuncioOcorrenciasScreen(),
                ),
              ),
            ),
            AnuncioCards(
              nomeAnuncio: 'Demandas',
              iconeAnuncio: Icons.assignment,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CriacaoDemandaScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
