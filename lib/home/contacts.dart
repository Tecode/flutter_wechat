import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[Text('测试')],
      ),
    );
  }
}

class _Contacts extends StatefulWidget {
  @override
  __ContactsState createState() => __ContactsState();
}

class __ContactsState extends State<_Contacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}