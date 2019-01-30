import 'package:flutter/material.dart';

class DiscoverItem {
  final String icon;
  final String title;
  final String image;
  final VoidCallback onTap;

  DiscoverItem(
      {@required this.icon, @required this.title, this.image, this.onTap})
      : assert(icon != null),
        assert(title != null);
}

class DiscoverData {
  final List discoverData = [
    [DiscoverItem(icon: "text", title: "朋友圈", onTap: () {})],
    [
      DiscoverItem(icon: "text", title: "扫码", onTap: () {}),
      DiscoverItem(icon: "text", title: "摇一摇", onTap: () {})
    ],
    [
      DiscoverItem(icon: "text", title: "头条新闻", onTap: () {}),
      DiscoverItem(icon: "text", title: "搜索", onTap: () {})
    ],
    [
      DiscoverItem(icon: "text", title: "附件的人", onTap: () {}),
      DiscoverItem(icon: "text", title: "漂流瓶", onTap: () {})
    ],
    [DiscoverItem(icon: "text", title: "游戏", onTap: () {})],
    [DiscoverItem(icon: "text", title: "小程序", onTap: () {})],
  ];
}
