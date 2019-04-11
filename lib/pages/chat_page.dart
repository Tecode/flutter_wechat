import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String title;
  ChatPage({Key key, this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.title),
    );
  }
}
