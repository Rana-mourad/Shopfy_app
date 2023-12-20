import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:shopfy/views/Home/HomePage.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    Text(
      'Categories Page',
    ),
    Text(
      'Profile Page',
    ),
    Text(
      'Cart Page',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 60,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Color(0xFF515C6F),
        elevation: 8,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        activeIndex: _selectedIndex,
        itemCount: 5,
        tabBuilder: (index, isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                index == 0
                    ? LineIcons.home
                    : index == 1
                        ? LineIcons.search
                        : index == 2
                            ? LineIcons.shoppingCart
                            : index == 3
                                ? LineIcons.user
                                : LineIcons.bars,
                size: 30,
                color: isActive ? Colors.white : Color(0xFF727C8E),
              ),
              Text(
                index == 0
                    ? 'Home'
                    : index == 1
                        ? 'Search'
                        : index == 2
                            ? 'Cart'
                            : index == 3
                                ? 'Profile'
                                : 'More',
                style: TextStyle(
                  color: isActive ? Colors.white : Color(0xFF727C8E),
                ),
              ),
            ],
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          'Let\'s Have Shopping',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF515C6F),
      ),
      body: Column(
        children: <Widget>[_pages[_selectedIndex]],
      ),
    );
  }
}
