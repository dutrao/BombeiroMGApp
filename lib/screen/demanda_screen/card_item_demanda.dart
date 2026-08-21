import 'package:flutter/material.dart';

class CardItemDemanda extends StatelessWidget {
  final String nomeItem;
  final String dadoOS;

  const CardItemDemanda({
    super.key,
    required this.nomeItem,
    required this.dadoOS,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(
                  0xff8b1012,
                ).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                pegarIconePorNomeItemDemanda(),
                color: const Color(0xff8b1012),
                size: 22,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomeItem,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    dadoOS,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
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

  IconData pegarIconePorNomeItemDemanda() {
    switch (nomeItem) {
      case 'Número':
        return Icons.tag;

      case 'Nome':
        return Icons.assignment_outlined;

      case 'Data início':
        return Icons.calendar_today_outlined;

      case 'Data fim':
        return Icons.event_available_outlined;

      case 'Responsável':
        return Icons.person_outline;

      default:
        return Icons.info_outline;
    }
  }
}