import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Model/productmodel.dart';
import 'package:shopfy/Provider/ProductProvider.dart';
import 'package:shopfy/theme/Appcolor.dart';
import 'package:shopfy/theme/customcard.dart';
import 'package:shopfy/theme/custometext.dart';
import 'package:shopfy/widgets/buildimage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Categories",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Container(
                height: 120,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/categories');
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              "assets/images/arrow_right_s.svg",
                              fit: BoxFit.scaleDown,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 8),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: "See More",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomText(
              text: "Latest",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              height: 185,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/Base.jpg",
                    fit: BoxFit.cover,
                    width: Get.width,
                    height: 185,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "For all your\nsummer clothing\nneeds",
                          fontSize: 18,
                          color: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 8),
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(text: "SEE MORE"),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/arrow_right_s.svg",
                                  fit: BoxFit.scaleDown,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider.products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return _BuildProductItem(
                    model: productProvider.products[index],
                    onTap: () {},
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _BuildProductItem extends StatelessWidget {
  const _BuildProductItem({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final Product model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        width: 130,
        radius: 15,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildImage(
              imageUrl: model.image!,
              width: 80,
              height: 80,
            ),
            CustomText(
              text: model.title!,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            CustomText(
              text: "\$${model.price!}",
              maxLines: 1,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
