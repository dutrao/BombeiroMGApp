import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/militar.dart';

class ChatTile extends StatefulWidget {
  final Militar militar;
  const ChatTile({super.key, required this.militar});

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(        
        onTap: () {          
        },
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.black,),
          title: Text(widget.militar.nomeDeGuerra),
        ),
      ),
    );
  }
}
