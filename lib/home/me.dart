import 'package:flutter/material.dart';
import '../model/meData.dart' show MeItem, MeData;

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      color: Colors.yellow,
    );
  }
}

class _MeState extends State<Me> {
  final List _itemDatas = MeData().meData;

  @override
  Widget build(BuildContext context) {
    print(_itemDatas);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _MeItem();
      },
      itemCount: _itemDatas.length,
    );
  }
}
