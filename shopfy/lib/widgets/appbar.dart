import 'package:flutter/material.dart';
import 'package:shopfy/theme/colorsutil.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        surfaceTintColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Messages.svg')),
              Positioned(
                  bottom: 6,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: Text('5'),
                  ))
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ColorsUtil.iconColor,
                ),
              ),
              Positioned(
                  bottom: 6,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: Text('5'),
                  ))
            ],
          ),
        ],
      );
}
