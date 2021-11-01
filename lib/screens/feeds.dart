import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/models/product.dart';
import 'package:shopie/provider/products.dart';
import 'package:shopie/widgets/feeds_product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class FeedsScreen extends StatelessWidget {
	static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
		final popular = ModalRoute.of(context).settings.arguments as String;
		final productsProvider = Provider.of<Products>(context);
		List<Product> productsList= productsProvider.products;
		if (popular=='popular') {
			productsList= productsProvider.PopularProducts;
		}
    return Scaffold(
//         body: StaggeredGridView.countBuilder(
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) => FeedProduct(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// )
				body: GridView.count(
      crossAxisCount: 2,
			childAspectRatio: 240/470,
			crossAxisSpacing: 8,
			mainAxisSpacing: 8,
			children: 
				List.generate(productsList.length, (index) {
					return ChangeNotifierProvider.value(
						value: productsList[index],
					  child: FeedProduct(
					  	
					  ),
					);
				}),
			
    ),
		);
  }
}
