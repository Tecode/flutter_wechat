import 'package:flutter/material.dart';

class MeItem {
  final String icon;
  final String title;
  final String image;
  final bool isGroup;
  final String isImage;
  final String weChatId;
  final VoidCallback onTap;

  MeItem(
      {this.icon,
      @required this.title,
      this.image,
      this.onTap,
      this.isImage,
      this.weChatId,
      this.isGroup})
      : assert(title != null);
}

class MeData {
  final List meData = [
    MeItem(
        image: "text",
        title: "阿明",
        onTap: () {},
        isGroup: true,
        weChatId: "xm283731869"),
    MeItem(icon: "text", title: "钱包", onTap: () {}, isGroup: true),
    MeItem(icon: "text", title: "收藏", onTap: () {}, isGroup: true),
    MeItem(icon: "text", title: "相册", onTap: () {}),
    MeItem(icon: "text", title: "卡包", onTap: () {}),
    MeItem(icon: "text", title: "表情", onTap: () {}),
    MeItem(icon: "text", title: "设置", onTap: () {}, isGroup: true)
  ];
}
