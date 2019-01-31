import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconNormal = 0xff999999;
  static const TabIconActive = 0xff46c11b;
  static const AppBarPopupMenuTextColor = 0xffffffff;
  static const WeChatListBackgoundColor = 0xffffffff;
  static const ConversationTitleColor = 0xff353535;
  static const DescreptionColor = 0xff9e9e9e;
  static const DriverColor = 0xfff1f1f1;
  static const NotifyDotColor = 0xfff43530;
  static const NotifyTextColor = 0xffffffff;
  static const DeviceInfoTextColor = 0xff353535;
  static const BorderColor = 0xffdedede;
  static const TagBackgroundColor = 0xffebebeb;
  static const DiscoverBodyColor = 0xffefeff3;
  static const DiscoverArrowColor = 0xffc7c7cb;
}

class AppStyle {
  static const TitleStyle =
      TextStyle(fontSize: 20.0, color: Color(AppColors.ConversationTitleColor));
  static const DiscriptionStyle =
      TextStyle(fontSize: 14.0, color: Color(AppColors.DescreptionColor));
  static const UnreadMsgDotStyle =
      TextStyle(color: Color(AppColors.NotifyTextColor), fontSize: 12);
  static const DeviceInfoTextStyle =
      TextStyle(color: Color(AppColors.DeviceInfoTextColor), fontSize: 14.0);
}

class Constants {
  static const CoverAvaterSize = 48.0;
  static const DividerWidth = 1.0;
  static const NotifyDotSize = 20.0;
  static const DeviceInfoHeight = 36.0;
  static const ContactAvatarSize = 36.0;
  static const DiscoverIconSize = 28.0;
}
