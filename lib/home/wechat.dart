import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyle, Constants;
import '../model/weChatData.dart' show weChatData;

class _WeChatListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/avatar_women.jpg',
            width: Constants.CoverAvaterSize,
            height: Constants.CoverAvaterSize,
          ),
          Container(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '微信新闻',
                style: AppStyle.TitleStyle,
              ),
              Text(
                '百年南开：牢记嘱托 立德树人',
                style: AppStyle.DiscriptionStyle,
              )
            ],
          )),
          Column(
            children: <Widget>[Text('17:12')],
          )
        ],
      ),
      color: Color(AppColors.WeChatListBackgoundColor),
    );
  }
}

class WeChat extends StatefulWidget {
  @override
  _WeChatDataState createState() => _WeChatDataState();
}

class _WeChatDataState extends State<WeChat>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _WeChatListItem();
      },
      itemCount: weChatData.length,
    );
  }
}
