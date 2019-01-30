import 'package:flutter/material.dart';
import '../model/discoverData.dart' show DiscoverData;


class _DiscoverItem extends StatelessWidget {
  final String icon;
  final String title;
  final String image;
  final VoidCallback onTap;

  _DiscoverItem(
      {@required this.icon, @required this.title, this.image, this.onTap})
      : assert(icon != null),
        assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      color: Colors.red,
      child: Text("45"),
    );
  }
}

class Discover extends StatelessWidget {
  final List _listData = DiscoverData().discoverData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _DiscoverItem(icon: '', title: '');
      },
      itemCount: _listData.length,
    );
  }
}
