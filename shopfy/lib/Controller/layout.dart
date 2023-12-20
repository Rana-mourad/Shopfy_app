import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _LayoutItem {
  String name;
  Widget screen;
  String iconPath;

  _LayoutItem({
    required this.name,
    required this.screen,
    required this.iconPath,
  });
}

class LayoutController extends GetxController {
  late List<_LayoutItem> items;
  RxInt index = 0.obs;

  List<Widget> pages = [
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Search Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Cart Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'More Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    items = [
      _LayoutItem(
          name: 'Home', screen: pages[0], iconPath: 'path_to_home_icon'),
      _LayoutItem(
          name: 'Search', screen: pages[1], iconPath: 'path_to_search_icon'),
      _LayoutItem(
          name: 'Cart', screen: pages[2], iconPath: 'path_to_cart_icon'),
      _LayoutItem(
          name: 'Profile', screen: pages[3], iconPath: 'path_to_profile_icon'),
      _LayoutItem(
          name: 'More', screen: pages[4], iconPath: 'path_to_more_icon'),
    ];
  }

  void onChange(int selectedIndex) {
    index.value = selectedIndex;
  }

  bool isItemSelected(_LayoutItem item) {
    return items.indexOf(item) == index.value;
  }
}
