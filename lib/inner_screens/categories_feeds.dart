import 'package:shopie/models/product.dart';
import 'package:shopie/provider/products.dart';
// import 'package:shopie/widgets/feeds_product.dart';
import 'package:shopie/widgets/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/provider/products.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  
  static const routeName = '/CategoriesFeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    print(categoryName);
    final productsList= productsProvider.findByCategory(categoryName);
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 240 / 470,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(productsList.length, (index) {
        return ChangeNotifierProvider.value(
          value: productsList[index],
          child: FeedProduct(
          ),
        );
      }),
    ),
//         StaggeredGridView.countBuilder(
//           padding: ,
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// ),
        );
  }
}