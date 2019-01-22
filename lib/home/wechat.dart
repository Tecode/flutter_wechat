import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyle, Constants;
import '../model/weChatData.dart' show WeChatData, weChatData;

class _WeChatListItem extends StatelessWidget {
  const _WeChatListItem({Key key, this.weChatItem})
      // 类型断言不能为空
      : assert(weChatItem != null),
        super(key: key);

  final WeChatData weChatItem;

  @override
  Widget build(BuildContext context) {
    Widget avartar;
    Widget avartarContainer;
    Widget rightArea;

    if (weChatItem.isAvatartFromNet()) {
      avartar = Image.network(
        weChatItem.avartar,
        width: Constants.CoverAvaterSize,
        height: Constants.CoverAvaterSize,
      );
    } else {
      avartar = Image.asset(
        weChatItem.avartar,
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
      avartarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avartar,
          Positioned(
            //定位
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avartarContainer = avartar;
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
          avartarContainer,
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
        return _WeChatListItem(
          weChatItem: weChatData[index],
        );
      },
      itemCount: weChatData.length,
    );
  }
}
