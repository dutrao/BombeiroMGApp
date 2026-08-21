import 'package:flutter/widgets.dart';

class ListaMilitarTile extends StatelessWidget {
  final IconData iconData;
  final String nomeInformacao;
  final String dadoMilitar;
  const ListaMilitarTile({
    super.key,
    required this.iconData,
    required this.nomeInformacao,
    required this.dadoMilitar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfffefffe)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Row(children: [Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Icon(iconData),
            ), Text(nomeInformacao)]),
          ),
          Expanded(child: Text(dadoMilitar, maxLines: 1, overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }
}
