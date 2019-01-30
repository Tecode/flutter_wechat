import 'package:flutter/material.dart';
import '../model/contactData.dart' show Contact, ContactData;
import '../constants.dart' show Constants, AppColors;

class _ContactsItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final String nameIndex;
  final VoidCallback onpressed;
  static const double _indexBoxHeight = 20.0;
  static const double _itemPadding = 10.0;
  _ContactsItem(
      {@required this.title,
      @required this.avatar,
      this.groupTitle,
      this.nameIndex,
      this.onpressed});

  // 头像
  Widget get avatarWidget {
    if (this.avatar.indexOf('http') > -1 || this.avatar.indexOf('https') == 0) {
      return Container(
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(this.avatar), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(2.0)),
      );
    }
    return Container(
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(this.avatar), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(2.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 判断是否显示标签索引

    // 显示名称索引
    Widget _itemIndex;
    // 列表主体部分
    Widget _itemData = Container(
      padding: EdgeInsets.symmetric(vertical: _itemPadding),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.0, color: Color(AppColors.BorderColor)))),
      child: Row(
        children: <Widget>[
          this.avatarWidget,
          SizedBox(width: 10.0, height: 10.0),
          Text(title)
        ],
      ),
    );
    if (this.nameIndex != null) {
      _itemIndex = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            height: _indexBoxHeight,
            alignment: Alignment.centerLeft,
            child: Text(this.nameIndex,
                style: TextStyle(color: Colors.black54, fontSize: 14.0)),
            color: Color(AppColors.TagBackgroundColor),
          ),
          _itemData
        ],
      );
    } else {
      _itemIndex = _itemData;
    }

    return _itemIndex;
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

// 單詞索引
const List<String> indexBarWords = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  'P',
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];

class _ContactsState extends State<Contacts> {
  ScrollController _scrollController;
  final List<Contact> _contactDatas = [];
  final List<_ContactsItem> functionButton = [
    _ContactsItem(
      avatar: "assets/images/new_friends.png",
      title: "添加新朋友",
      onpressed: () {
        print("点击了我");
      },
    ),
    _ContactsItem(
      avatar: "assets/images/group_chat.png",
      title: "群聊",
      onpressed: () {
        print("点击了我");
      },
    ),
    _ContactsItem(
      avatar: "assets/images/official_acconut.png",
      title: "添加公众号",
      onpressed: () {
        print("点击了我");
      },
    ),
    _ContactsItem(
      avatar: "assets/images/wechat_work_contacts.png",
      title: "微信工作联系人",
      onpressed: () {
        print("点击了我");
      },
    ),
  ];
  // 存放索引的Y坐标
  Map<String, double> _indexMap = {};

  @override
  void initState() {
    double _itemHeight = (functionButton.length-1)*(Constants.ContactAvatarSize + _ContactsItem._itemPadding * 2) - _ContactsItem._indexBoxHeight;
    // TODO: implement initState
    super.initState();
    _contactDatas
      ..addAll(ContactData().contactData)
      ..addAll(ContactData().contactData)
      ..addAll(ContactData().contactData);
    _contactDatas
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    for (int index = 0; index < _contactDatas.length; index++) {
      bool isGroupTitle = true;
      if (index > 0 &&
          _contactDatas[index].nameIndex ==
              _contactDatas[index - 1].nameIndex) {
        isGroupTitle = false;
      }
      _itemHeight +=
          Constants.ContactAvatarSize + _ContactsItem._itemPadding * 2 + 1.0;
      if (isGroupTitle) {
        Contact _contactData = _contactDatas[index];
        _itemHeight += _ContactsItem._indexBoxHeight;
        _indexMap[_contactData.nameIndex] = _itemHeight;
      }
    }

    // 初始化滚动控件
    _scrollController = new ScrollController();
  }

  @override
  void dispose() {
    // 销毁
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = indexBarWords.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();
    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            bool isGroupTitle = true;
            if (index < functionButton.length) {
              return functionButton[index];
            }
            final int listIndex = index - functionButton.length;
            if (listIndex > 0 &&
                _contactDatas[listIndex].nameIndex ==
                    _contactDatas[listIndex - 1].nameIndex) {
              isGroupTitle = false;
            }
            Contact _contactData = _contactDatas[listIndex];
            return _ContactsItem(
              avatar: _contactData.avatar,
              title: _contactData.name,
              nameIndex: isGroupTitle ? _contactData.nameIndex : null,
            );
          },
          itemCount: _contactDatas.length,
        ),
        Positioned(
            width: 20.0,
            bottom: 0,
            top: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragDown: (DragDownDetails detail) {
                _scrollController.animateTo(_indexMap['B'],
                    curve: Curves.bounceIn,
                    duration: Duration(microseconds: 200));
                print("dragedown");
              },
              onVerticalDragEnd: (DragEndDetails detail) {
                print("drageEnd");
              },
              onVerticalDragCancel: () {
                print(_indexMap);
              },
              child: Column(
                children: _letters,
              ),
            ))
      ],
    );
  }
}
