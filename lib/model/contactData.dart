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
      avatar: "https://randomuser.me/api/portraits/women/21.jpg",
    ),
    Contact(
      name: "刘慧",
      nameIndex: "L",
      avatar: "https://randomuser.me/api/portraits/women/13.jpg",
    ),
    Contact(
      name: "Mohawk",
      nameIndex: "M",
      avatar: "https://randomuser.me/api/portraits/women/11.jpg",
    ),
    Contact(
      name: "Linux",
      nameIndex: "L",
      avatar: "https://randomuser.me/api/portraits/women/12.jpg",
    ),
    Contact(
      name: "Mohawk",
      nameIndex: "M",
      avatar: "https://randomuser.me/api/portraits/women/11.jpg",
    ),
    Contact(
      name: "Linux",
      nameIndex: "L",
      avatar: "https://randomuser.me/api/portraits/women/12.jpg",
    ),
  ];
}
