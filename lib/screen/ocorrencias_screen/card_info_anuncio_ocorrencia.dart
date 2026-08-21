import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/efetivo_operacional/info_texto.dart';

class CardInformacoesAnuncioOcorrencia extends StatelessWidget {
  final String responsavel;
  final String dataHorario;

  const CardInformacoesAnuncioOcorrencia({super.key, 
    required this.responsavel,
    required this.dataHorario,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.red,
                    size: 34,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoTexto(
                      titulo: 'Responsável',
                      valor: responsavel,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 1,
              color: Colors.grey.shade300,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.event_rounded,
                    color: Colors.red,
                    size: 34,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoTexto(
                      titulo: 'Data e horário',
                      valor: dataHorario,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
