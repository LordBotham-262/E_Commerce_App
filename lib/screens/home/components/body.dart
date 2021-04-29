import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/productType.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'categories.dart';
import 'item_card.dart';

List<String> categories = [];

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _loading;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future _fetchData() async {
    _loading = true;

    final result = await Future.wait([
      getCategories(),
      getProducts(0),
    ]);

    if (result[0] && result[1]) {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<bool> getProducts(int selectedCategory) async {
    await getProductsByCategoryId(selectedCategory);
    return true;
  }

  callback(newAbc) async {
    setState(() {
      _loading = true;
    });
    final xa = await getProducts(newAbc);
    if (xa) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Woman",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Categories(callback),
          (_loading && kConnectionError)
               ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: CircularProgressIndicator(),
                    ),
                  MaterialBanner(
                    content: const Text('Database Connection Error'),
                    leading: CircleAvatar(child: Icon(Icons.delete)),
                    actions: [
                      TextButton(
                        child: const Text('Contact'),
                        onPressed: () { },
                      ),
                    ],
                  )
                ],
              )
              : Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

        ]);
  }

  Future<bool> getCategories() async {
    List<ProductType> data = await ProductType().getCategories();
    data.forEach((element) {
      categories.add(element.productCat);
    });
    return true;
  }
}