import 'package:flutter/material.dart';

class WeChatData {
  const WeChatData(
      {@required this.avartar,
      @required this.title,
      this.descript,
      this.titleColor: 0xff000000,
      @required this.creatAt,
      this.unreadMsgCount: 0,
      this.displayDot: false,
      this.isMute: false})
      : assert(avartar != null),
        assert(title != null),
        assert(creatAt != null);

  final String avartar;
  final String title;
  final String descript;
  final String creatAt;
  final int titleColor;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;
}

const List<WeChatData> weChatData = [
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/9.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 12,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/men/68.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 7,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/2.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 22,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/10.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 60,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/14.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 40,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/6.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 84,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/4.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 62,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/10.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 60,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/14.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 40,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/6.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 84,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/4.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 62,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/men/68.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 7,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/2.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 22,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/10.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 60,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/14.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 40,
      title: "Girl"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/6.jpg",
      descript: "助力中小企业把握每一次成长契机",
      creatAt: "14:32",
      unreadMsgCount: 84,
      title: "Girl"),
];
