import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class ListaCursosTile extends StatefulWidget {
  final Militar militar;

  const ListaCursosTile({super.key, required this.militar});

  @override
  State<ListaCursosTile> createState() => _ListaCursosTileState();
}

class _ListaCursosTileState extends State<ListaCursosTile> {
  List<String> cursosDoMilitar = [];

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      cursosDoMilitar = await context
          .read<Storage>()
          .pegarListaNomeCursosPorMilitar(widget.militar.idMilitar);

      if (!mounted) return;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink(
            padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),

            child: Text(
              'Cursos',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff8d1917),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cursosDoMilitar.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  cursosDoMilitar[index],
                  style: TextStyle(fontSize: 14),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(indent: 50, thickness: 1, color: Color(0xffE5E7EB)),
          ),
        ],
      ),
    );
  }
}
