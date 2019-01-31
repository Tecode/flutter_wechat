import 'package:flutter/material.dart';

class MeItem {
  final String icon;
  final String title;
  final String image;
  final bool isGroup;
  final String weChatId;
  final VoidCallback onTap;

  MeItem(
      {this.icon,
      @required this.title,
      this.image,
      this.onTap,
      this.weChatId,
      this.isGroup})
      : assert(title != null);
}

class MeData {
  final List meData = [
    // MeItem(
    //     image: "assets/images/avatar_women.jpg",
    //     title: "阿明",
    //     onTap: () {},
    //     isGroup: true,
    //     weChatId: "xm283731869"),
    MeItem(icon: "assets/images/wallet.jpg", title: "钱包", onTap: () {}, isGroup: true),
    MeItem(icon: "assets/images/facorites.jpg", title: "收藏", onTap: () {}, isGroup: true),
    MeItem(icon: "assets/images/my_posts.jpg", title: "相册", onTap: () {}),
    MeItem(icon: "assets/images/cards_offers.jpg", title: "卡包", onTap: () {}),
    MeItem(icon: "assets/images/sticker_gallery.jpg", title: "表情", onTap: () {}),
    MeItem(icon: "assets/images/settings.jpg", title: "设置", onTap: () {}, isGroup: true)
  ];
}
