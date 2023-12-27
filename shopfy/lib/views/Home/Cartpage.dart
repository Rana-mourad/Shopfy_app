import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopfy/theme/Appcolor.dart';
import 'package:shopfy/widgets/Headline.dart';
import 'package:shopfy/widgets/custombutton.dart';

final _firebaseStorage = FirebaseStorage.instance.ref();

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Cart"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$200',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Free Domestic shipping',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'CHECKOUT',
                iconColor: Colors.white,
                Icon: Icons.arrow_forward_ios_outlined,
                fontColor: Colors.white,
                colorOfBackgroundIcon: Color(0xFFF5F6F8),
                buttonColor: AppColor.primaryColor,
                onBtnPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HeadlineWidget(title: 'Cart'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        child: FutureBuilder(
                          future: _getImageUrl('products/scarf.png'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Image.network(
                                snapshot.data as String,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bottle Green scrarf",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              )),
                          const SizedBox(height: 3),
                          Text(
                            'Medium, green',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            '\$200',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.remove,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '1',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.blue,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getImageUrl(String filePath) async {
    final downloadUrl = await _firebaseStorage.child(filePath).getDownloadURL();
    return downloadUrl;
  }
}
