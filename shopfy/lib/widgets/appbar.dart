import 'package:flutter/material.dart';
import 'package:shopfy/theme/colorsutil.dart';
import 'package:shopfy/widgets/Cart_widget.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        surfaceTintColor: Colors.white,
        actions: [
          const CartBadgeWidget(),
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
