import 'package:flutter/material.dart';
import 'package:shopfy/theme/Appcolor.dart';
import 'package:shopfy/views/Auth/Login.dart';
import 'package:shopfy/views/Home/Myorders.dart';
import 'package:shopfy/widgets/BuildItem.dart';
import 'package:shopfy/widgets/customcard.dart';
import 'package:shopfy/widgets/customtext.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "EDIT PROFILE",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildOrdersCard(context),
            SizedBox(height: 20),
            _buildOtherOptionsCard(),
            SizedBox(height: 20),
            _buildLogoutButton(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersCard(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BuildItem(
            title: "All My Orders",
            icon: Icons.shopping_cart,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOrdersPage(
                    orders: [],
                  ),
                ),
              );
            },
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Pending Shipments",
            icon: Icons.schedule,
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Pending Payments",
            icon: Icons.payment,
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Finished Orders",
            icon: Icons.check_circle,
          ),
        ],
      ),
    );
  }

  Widget _buildOtherOptionsCard() {
    return CustomCard(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BuildItem(
            onTap: () {},
            title: "Invite Friends",
            icon: Icons.person_add,
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Customer Support",
            icon: Icons.headset_mic,
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Rate Our App",
            icon: Icons.star,
          ),
          Divider(indent: 40),
          BuildItem(
            title: "Make a Suggestion",
            icon: Icons.lightbulb_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: CustomText(
          text: "LOGOUT",
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
