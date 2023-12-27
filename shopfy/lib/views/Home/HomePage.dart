import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Provider/AppAuthProvider.dart';
import 'package:shopfy/Provider/HomeProvider.dart';
import 'package:shopfy/Provider/ProductProvider.dart';
import 'package:shopfy/Provider/category.provider.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:shopfy/widgets/Adswidget.dart';
import 'package:shopfy/widgets/Headline.dart';
import 'package:shopfy/widgets/Product.dart';
import 'package:shopfy/widgets/categories_row.home.widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeadlineWidget(title: 'Categories'),
            Consumer<CategoryProvider>(
              builder: (__, categoryProvider, _) {
                return FutureBuilder(
                    future: categoryProvider.getCategory(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return CategoriesRowHome(
                            categories: snapshot.data ?? [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const HeadlineWidget(title: 'Ads'),
            const SizedBox(
              height: 10,
            ),
            Consumer<HomeProvider>(
              builder: (__, HomeProvider, _) {
                return FutureBuilder(
                  future: HomeProvider.getAds(context, limit: 3),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error While Get Ads Data');
                      } else if (snapshot.hasData) {
                        return FlexibleGridView(
                          axisCount: GridLayoutEnum.threeElementsInRow,
                          shrinkWrap: true,
                          children: snapshot.data
                                  ?.map((e) => AdWidget(ad: e))
                                  .toList() ??
                              [],
                        );
                      } else {
                        return Text('No Ads Data Found');
                      }
                    } else {
                      return Text(
                          'Connection State ${snapshot.connectionState}');
                    }
                  },
                );
              },
            ),
            const HeadlineWidget(title: 'Latest'),
            const SizedBox(
              height: 10,
            ),
            const HeadlineWidget(title: 'Products'),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductProvider>(
              builder: (__, productProvider, _) {
                return FutureBuilder(
                    future: productProvider.getProducts(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return FlexibleGridView(
                            axisCount: GridLayoutEnum.threeElementsInRow,
                            shrinkWrap: true,
                            children: snapshot.data
                                    ?.map((e) => ProductWidget(
                                          product: e,
                                          onTap: () {},
                                        ))
                                    .toList() ??
                                [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),
            ElevatedButton(
                onPressed: () =>
                    Provider.of<AppAuthProvider>(context, listen: false)
                        .onLogout(context),
                child: Text('LogOut')),
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    withData: true,
                    type: FileType.image,
                  );
                  var refrence = FirebaseStorage.instance
                      .ref('products/${result?.files.first.name}');

                  if (result?.files.first.bytes != null) {
                    var uploadResult = await refrence.putData(
                        result!.files.first.bytes!,
                        SettableMetadata(contentType: 'products/image.png'));

                    if (uploadResult.state == TaskState.success) {
                      print(
                          '>>>>>>>>>>>>>>>>${await refrence.getDownloadURL()}');
                    }
                  }
                },
                child: Text('upload image')),
          ],
        ),
      ),
    );
  }
}
