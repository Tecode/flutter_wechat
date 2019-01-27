import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyle, Constants;
import '../model/weChatData.dart' show WeChatData, mockWeChatData;

enum Device { MAC, WIN }

class _WeChatListItem extends StatelessWidget {
  const _WeChatListItem({Key key, this.weChatItem})
      // 类型断言不能为空
      : assert(weChatItem != null),
        super(key: key);

  final WeChatData weChatItem;

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    Widget avatarContainer;
    Widget rightArea;

    if (weChatItem.isAvatartFromNet()) {
      avatar = Image.network(
        weChatItem.avatar,
        width: Constants.CoverAvaterSize,
        height: Constants.CoverAvaterSize,
      );
    } else {
      avatar = Image.asset(
        weChatItem.avatar,
        width: Constants.CoverAvaterSize,
        height: Constants.CoverAvaterSize,
      );
    }
    // 未读消息
    Widget unreadMsgCountText = Container(
      width: Constants.NotifyDotSize,
      height: Constants.NotifyDotSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.NotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotColor)),
      child: Text(
        weChatItem.unreadMsgCount.toString(),
        style:
            TextStyle(color: Color(AppColors.NotifyTextColor), fontSize: 12.0),
      ),
    );

    // 判断未读消息
    if (weChatItem.unreadMsgCount > 0) {
      // 堆栈式布局，类似与绝对布局或相对布局
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            //定位
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    // 判断是否是勿扰模式
    if (weChatItem.isMute) {
      // 勿扰模式图标
      rightArea = Image.asset(
        'assets/images/mute_icon.png',
        width: 20.0,
        height: 20.0,
      );
    } else {
      rightArea = SizedBox(
        width: 20.0,
        height: 20.0,
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.WeChatListBackgoundColor),
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.DriverColor),
                  width: Constants.DividerWidth))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                weChatItem.title,
                style: AppStyle.TitleStyle,
              ),
              Text(
                weChatItem.descript,
                style: AppStyle.DiscriptionStyle,
              )
            ],
          )),
          Column(
            children: <Widget>[Text(weChatItem.creatAt), rightArea],
          )
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  final Device device;

  Widget get iconType {
    return device == Device.MAC
        ? Icon(Icons.desktop_mac)
        : Icon(Icons.desktop_windows);
  }

  String get driviceName => device == Device.MAC ? 'Mac' : 'Windows';

  const _DeviceInfoItem({this.device: Device.MAC}) : assert(device != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.WeChatListBackgoundColor),
          border: Border(
              bottom: BorderSide(
                  width: Constants.DividerWidth,
                  color: Color(AppColors.DriverColor)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          this.iconType,
          SizedBox(width: 10.0),
          Text('${this.driviceName}微信已登录，微信通知已关闭。')
        ],
      ),
    );
  }
}

class WeChat extends StatefulWidget {
  @override
  _WeChatDataState createState() => _WeChatDataState();
}

class _WeChatDataState extends State<WeChat>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (mockWeChatData['device'] != null) {
          if (index == 0) {
            return _DeviceInfoItem(device: Device.MAC);
          }
        }
        return _WeChatListItem(
          weChatItem: mockWeChatData['device'] == null
              ? mockWeChatData['weChatData'][index]
              : mockWeChatData['weChatData'][index - 1],
        );
      },
      itemCount: mockWeChatData['device'] == null
          ? mockWeChatData['weChatData'].length
          : mockWeChatData['weChatData'].length + 1,
    );
  }
}
