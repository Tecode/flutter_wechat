import 'package:flutter/material.dart';
import '../model/discoverData.dart' show DiscoverData, DiscoverItem;

class _DiscoverItem extends StatelessWidget {
  final String icon;
  final String title;
  final String image;
  final VoidCallback onTap;
  final bool isGroup;

  _DiscoverItem(
      {@required this.icon,
      @required this.title,
      this.image,
      this.onTap,
      this.isGroup})
      : assert(icon != null),
        assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 6.0),
      child: Row(
      children: <Widget>[
        Container(
          height: 20.0,
          width: 20.0,
          color: Colors.red,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Text(title),
        ),
        Icon(Icons.chevron_right)
      ],
    ),
    );
  }
}

class Discover extends StatelessWidget {
  final List _listData = DiscoverData().discoverData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        DiscoverItem data = _listData[index];
        return _DiscoverItem(
          icon: data.icon,
          title: data.title,
          isGroup: data.isGroup,
        );
      },
      itemCount: _listData.length,
    );
  }
}
