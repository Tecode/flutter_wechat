import 'package:flutter/material.dart';
import '../colors.dart' show AppColors;

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(title),
            backgroundColor: Colors.white);
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  num _currentIntex = 0;

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(0xe740, fontFamily: 'appIconFont'),
          activeIcon: IconData(0xe740, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(0xe749, fontFamily: 'appIconFont'),
          activeIcon: IconData(0xe749, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '发现',
          icon: IconData(0xe74b, fontFamily: 'appIconFont'),
          activeIcon: IconData(0xe74b, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '我',
          icon: IconData(0xe743, fontFamily: 'appIconFont'),
          activeIcon: IconData(0xe743, fontFamily: 'appIconFont')),
    ];
  }

  // 构建出图标
  _buildPopupMenuItem(
    num icon,
    String title,
  ) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(
            icon,
            fontFamily: 'appIconFont',
          ),
          color: Color(AppColors.AppBarPopupMenuTextColor),
        ),
        Container(width: 8),
        Text(
          title,
          style: TextStyle(color: Color(AppColors.AppBarPopupMenuTextColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      fixedColor: const Color(AppColors.TabIconActive),
      currentIndex: _currentIntex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIntex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext contenx) {
              return <PopupMenuItem>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe740, '发起群聊'),
                  value: 'new_chat',
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe743, '添加朋友'),
                  value: 'add_contact',
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe74f, '扫一扫'),
                  value: 'scan',
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe754, '收付款'),
                  value: 'money',
                ),
              ];
            },
            icon: Icon(
              Icons.add,
              size: 26,
            ),
            onSelected: (Object selected) {
              print('点击的是$selected');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.deepOrange,
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
