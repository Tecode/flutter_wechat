import 'package:flutter/material.dart';
import '../model/discoverData.dart' show DiscoverData, DiscoverItem;
import '../constants.dart' show Constants, AppColors;

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

  get boderStyle {
    if (isGroup != null) {
      return Border(
          bottom:
              BorderSide(width: 1.0, color: Color(AppColors.DiscoverBoderLine)),
          top: BorderSide(
              width: isGroup != null ? 1.0 : 0.0,
              color: Color(AppColors.DiscoverBoderLine)));
    }
    return Border(
        bottom:
            BorderSide(width: 1.0, color: Color(AppColors.DiscoverBoderLine)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        margin: EdgeInsets.only(top: isGroup != null ? 20.0 : 0.0),
        decoration: BoxDecoration(
            color: Color(AppColors.WeChatListBackgoundColor),
            border: boderStyle),
        child: Row(
          children: <Widget>[
            Image.asset(
              icon,
              width: Constants.DiscoverIconSize,
              height: Constants.DiscoverIconSize,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Text(title),
            ),
            Icon(
              Icons.chevron_right,
              color: Color(AppColors.DiscoverArrowColor),
            )
          ],
        ),
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
