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

  bool isAvatartFromNet() {
    if (this.avartar.indexOf('http') == 0 ||
        this.avartar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }
}

const List<WeChatData> weChatData = [
  const WeChatData(
      avartar: "assets/images/tencent_news.png",
      descript: "削减航班量，吊销机长与副驾驶执照",
      creatAt: "14:32",
      unreadMsgCount: 0,
      title: "腾讯新闻"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/men/68.jpg",
      descript: "[语音]",
      creatAt: "09:32",
      unreadMsgCount: 7,
      title: "张佳宁同学"),
  const WeChatData(
      avartar: "assets/images/file_send.png",
      descript: "[图片]",
      creatAt: "20:32",
      unreadMsgCount: 22,
      title: "文件传输助手"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/10.jpg",
      descript: "你什么时候回来",
      creatAt: "14:32",
      unreadMsgCount: 99,
      title: "小慧"),
  const WeChatData(
      avartar: "assets/images/subscribe_account.png",
      descript: "麦当劳网上订餐 | 麦乐送",
      creatAt: "18:32",
      unreadMsgCount: 1,
      title: "麦当劳"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/20.jpg",
      descript: "冲Q币送Q币",
      creatAt: "14:32",
      unreadMsgCount: 99,
      isMute: true,
      title: "小马哥"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/60.jpg",
      descript: "好久不见了！",
      creatAt: "14:32",
      unreadMsgCount: 2,
      isMute: true,
      title: "小花花"),
  const WeChatData(
      avartar: "https://randomuser.me/api/portraits/women/65.jpg",
      descript: "该换花呗了，明天最后期限",
      creatAt: "昨天",
      unreadMsgCount: 0,
      title: "马云"),
];
