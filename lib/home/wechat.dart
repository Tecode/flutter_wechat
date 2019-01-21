import 'package:flutter/material.dart';

class _WeChatListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/favorite.png'),
          Container(color: Colors.red),
          Container(color: Colors.limeAccent)
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
    return Container(
      color: Colors.black38,
      child: _WeChatListItem(),
    );
  }
}