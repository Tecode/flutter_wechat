import 'package:flutter/material.dart';
import '../model/contactData.dart' show Contact, ContactData;
import '../constants.dart' show Constants, AppColors;

class _ContactsItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;

  _ContactsItem({@required this.title, @required this.avatar, this.groupTitle});

  // 头像
  Widget get avatarWidget {
    return Image.network(
      this.avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
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
  final _contactDatas = ContactData().contactData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext contax, int index) {
        Contact _contactData = _contactDatas[index];
        return _ContactsItem(
            avatar: _contactData.avatar, title: _contactData.name);
      },
      itemCount: _contactDatas.length,
    );
  }
}
