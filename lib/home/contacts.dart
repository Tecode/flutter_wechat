import 'package:flutter/material.dart';
import '../model/contactData.dart' show Contact, ContactData;
import '../constants.dart' show Constants, AppColors;

class _ContactsItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onpressed;

  _ContactsItem(
      {@required this.title,
      @required this.avatar,
      this.groupTitle,
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
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.0, color: Color(AppColors.BorderColor)))),
      child: Row(
        children: <Widget>[
          avatarWidget,
          SizedBox(width: 10.0, height: 10.0),
          Text(this.title)
        ],
      ),
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactDatas
      ..addAll(ContactData().contactData)
      ..addAll(ContactData().contactData)
      ..addAll(ContactData().contactData);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext contax, int index) {
        if (index < functionButton.length) {
          return functionButton[index];
        }
        final int listIndex = index - functionButton.length;
        Contact _contactData = _contactDatas[listIndex];
        return _ContactsItem(
            avatar: _contactData.avatar, title: _contactData.name);
      },
      itemCount: _contactDatas.length,
    );
  }
}
