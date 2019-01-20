import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class NavigationIconView {
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon})
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

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(
            0xe740,
            fontFamily: 'appIconFont'
          ),
          activeIcon: IconData(
            0xe740,
            fontFamily: 'appIconFont'
          )),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(
            0xe749,
            fontFamily: 'appIconFont'
          ),
          activeIcon: IconData(
            0xe749,
            fontFamily: 'appIconFont'
          )),
      NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe74b,
            fontFamily: 'appIconFont'
          ),
          activeIcon: IconData(
            0xe74b,
            fontFamily: 'appIconFont'
          )),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe743,
            fontFamily: 'appIconFont'
          ),
          activeIcon: IconData(
            0xe743,
            fontFamily: 'appIconFont'
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('$index');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('显示下拉列表');
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
