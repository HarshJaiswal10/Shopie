import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/consts/colors.dart';
import 'package:shopie/consts/my_icons.dart';
import 'package:shopie/models/product.dart';
import 'package:shopie/provider/cart_provider.dart';
import 'package:shopie/provider/favs_provider.dart';
import 'package:shopie/provider/products.dart';
import 'package:shopie/screens/cart.dart';
import 'package:shopie/screens/wishlist.dart';
import 'package:shopie/widgets/feeds_product.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


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
				appBar: AppBar(
					backgroundColor: Theme.of(context).cardColor,
					title: Text('Feeds'),
					actions: [
						Consumer<FavsProvider>(
									builder: (_, favs, ch)
									=> Badge(
									badgeColor: ColorsConsts.cartBadgeColor,
									animationType: BadgeAnimationType.slide,
									toAnimate: true,
									position: BadgePosition.topEnd(top: 5, end: 7),
									badgeContent: Text(favs.getFavsItems.length.toString(),
									style: TextStyle(color: Colors.white),
									),
                    child: IconButton(
                        icon: Icon(
                          MyAppIcons.wishlist,
                          color: ColorsConsts.favColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(WishlistScreen.routeName);
                        }),
                  ),
                ),
								 Consumer<CartProvider>(
									builder: (_, cart, ch)
									=> Badge(
									badgeColor: ColorsConsts.cartBadgeColor,
									animationType: BadgeAnimationType.slide,
									toAnimate: true,
									position: BadgePosition.topEnd(top: 5, end: 7),
									badgeContent: Text(cart.getCartItems.length.toString(),
									style: TextStyle(color: Colors.white),
									),
                    child: IconButton(
                    icon: Icon(
                      MyAppIcons.cart,
                      color: ColorsConsts.cartColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    }),
                  ),
                ),
					],
				),
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
