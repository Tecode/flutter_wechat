import 'package:flutter/material.dart';
import '../constants.dart' show AppColors;
import './wechat.dart';
import './contacts.dart';
import './discover.dart';

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
  List<Widget> _pages;
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

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
    // 页面
    _pages = [
      WeChat(),
      Contacts(),
      Discover(),
      Container(
        color: Colors.green,
      )
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

  // navBar导航
  get activeNavBar {
    switch (_currentIndex) {
      case 0:
        return AppBar(
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
        );
      case 1:
        return AppBar(
          title: Text('通讯录'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.contacts),
              onPressed: () {
                print("点击了通讯录的按钮");
              },
            ),
          ],
        );
      case 2:
        return AppBar(
          title: Text('发现'),
          elevation: 0.0,
        );
      case 3:
        return AppBar(
          title: Text('我'),
          elevation: 0.0,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      fixedColor: const Color(AppColors.TabIconActive),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 1), curve: Curves.linear);
        });
      },
    );
    return Scaffold(
      appBar: activeNavBar,
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),    //静止滑动
        itemBuilder: (BuildContext contenx, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          print('当前在第$index页');
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
