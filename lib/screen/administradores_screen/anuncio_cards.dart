import 'package:flutter/material.dart';

class AnuncioCards extends StatelessWidget {
  final String nomeAnuncio;
  final IconData iconeAnuncio;
  final VoidCallback onTap;
  const AnuncioCards({super.key, required this.nomeAnuncio, required this.iconeAnuncio, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(
          height: 150,
          width: double.infinity,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(iconeAnuncio, size: 50,),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Anúncio de $nomeAnuncio',                        
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Clique aqui para ser direcionado para tela de criação de anúncio de $nomeAnuncio',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
