import 'package:flutter/material.dart';

class Contact {
  const Contact(
      {@required this.avatar, @required this.name, @required this.nameIndex});

  final String avatar;
  final String name;
  final String nameIndex;
}

class ContactData {
  final List<Contact> contactData = [
    Contact(
      name: "小明",
      nameIndex: "X",
      avatar: "https://randomuser.me/api/portraits/women/22.jpg",
    ),
    Contact(
      name: "邪惡只爲笑的炫",
      nameIndex: "X",
      avatar: "https://randomuser.me/api/portraits/women/21.jpg",
    ),
    Contact(
      name: "白腿亮眼_丶",
      nameIndex: "B",
      avatar: "https://randomuser.me/api/portraits/women/2.jpg",
    ),
    Contact(
      name: "刘慧",
      nameIndex: "L",
      avatar: "https://randomuser.me/api/portraits/women/13.jpg",
    ),
    Contact(
      name: "红唇高跟_丶",
      nameIndex: "H",
      avatar: "https://randomuser.me/api/portraits/women/10.jpg",
    ),
    Contact(
      name: "雨落伊人",
      nameIndex: "Y",
      avatar: "https://randomuser.me/api/portraits/women/1.jpg",
    ),
    Contact(
      name: "北有凉城",
      nameIndex: "B",
      avatar: "https://randomuser.me/api/portraits/women/32.jpg",
    ),
    Contact(
      name: "埋藏树下",
      nameIndex: "M",
      avatar: "https://randomuser.me/api/portraits/women/30.jpg",
    ),
  ];
}
