import 'package:flutter/material.dart';

class DiscoverItem {
  final String icon;
  final String title;
  final String image;
  final bool isGroup;
  final VoidCallback onTap;

  DiscoverItem(
      {@required this.icon,
      @required this.title,
      this.image,
      this.onTap,
      this.isGroup})
      : assert(icon != null),
        assert(title != null);
}

class DiscoverData {
  final List discoverData = [
    DiscoverItem(icon: "assets/images/moments.jpg", title: "朋友圈", onTap: () {}, isGroup: true),
    DiscoverItem(icon: "assets/images/scan.jpg", title: "扫码", onTap: () {}, isGroup: true),
    DiscoverItem(icon: "assets/images/shake.jpg", title: "摇一摇", onTap: () {}),
    DiscoverItem(icon: "assets/images/top_stories.jpg", title: "头条新闻", onTap: () {}, isGroup: true),
    DiscoverItem(icon: "assets/images/search.jpg", title: "搜索", onTap: () {}),
    DiscoverItem(icon: "assets/images/people_nearby.jpg", title: "附件的人", onTap: () {}, isGroup: true),
    DiscoverItem(icon: "assets/images/message_bottle.jpg", title: "漂流瓶", onTap: () {}),
    DiscoverItem(icon: "assets/images/games.jpg", title: "游戏", onTap: () {}, isGroup: true),
    DiscoverItem(icon: "assets/images/mini_programs.jpg", title: "小程序", onTap: () {}, isGroup: true)
  ];
}
