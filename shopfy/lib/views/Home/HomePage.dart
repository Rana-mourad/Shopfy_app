import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Provider/AppAuthProvider.dart';
import 'package:shopfy/Provider/ProductProvider.dart';
import 'package:shopfy/Provider/category.provider.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:shopfy/widgets/Headline.dart';
import 'package:shopfy/widgets/Product.dart';
import 'package:shopfy/widgets/categories_row.home.widget.dart';

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
                  future: categoryProvider.getCategories(context, limit: 3),
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
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
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
                                  ?.map((e) => ProductWidget(product: e))
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
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () =>
                  Provider.of<AppAuthProvider>(context, listen: false)
                      .onLogout(context),
              child: Text('Log Out'),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
