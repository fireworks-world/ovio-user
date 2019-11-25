import 'package:flutter/material.dart';
import 'package:ovio_user/browser.dart';

import 'account.dart';
import 'customColors.dart';
import 'favorites.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _children = [Browser(), Favorites(), Account()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              backgroundColor: customColor1,
              icon: new Icon(
                Icons.open_in_browser,
              ),
              title: new Text(
                'Browser',
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: customColor1,
              icon: new Icon(
                Icons.favorite,
              ),
              title: new Text(
                'Favorites',
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: customColor1,
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text(
                'Account',
              ),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }
}
