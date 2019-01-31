import 'package:flutter/material.dart';
import '../model/meData.dart' show MeItem, MeData;
import '../constants.dart' show AppColors, Constants;

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeItem extends StatelessWidget {
  final String icon;
  final String title;
  final String image;
  final bool isGroup;
  final String isImage;
  final String weChatId;
  final VoidCallback onTap;

  _MeItem(
      {this.icon,
      @required this.title,
      this.image,
      this.onTap,
      this.isImage,
      this.weChatId,
      this.isGroup});

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
              width: Constants.MeIconSize,
              height: Constants.MeIconSize,
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

class _MeState extends State<Me> {
  final List _itemData = MeData().meData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        MeItem _data = _itemData[index];
        return _MeItem(
          title: _data.title,
          icon: _data.icon,
          weChatId: _data.weChatId,
          isGroup: _data.isGroup,
        );
      },
      itemCount: _itemData.length,
    );
  }
}
