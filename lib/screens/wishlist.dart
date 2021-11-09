import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/consts/my_icons.dart';
import 'package:shopie/provider/favs_provider.dart';
import 'package:shopie/services/global_method.dart';
import 'package:shopie/widgets/wishlist_empty.dart';
import 'package:shopie/widgets/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    final favsProvider = Provider.of<FavsProvider>(context);
		GlobalMethods globalMethods = GlobalMethods();
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
						appBar: AppBar(
							title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
							actions: [
                IconButton(
                  icon: Icon(MyAppIcons.trash),
                  onPressed: () {
										globalMethods.showDialogg(
                                  "Clear wishlist!",
                                  "Your wishlist will be cleared!",
                                  () => favsProvider
                                      .clearFavs(),context);
										// cartProvider.clearCart();
									},
                ),
              ],
						),
            body: ListView.builder(
							itemCount: favsProvider.getFavsItems.length,
							itemBuilder: (BuildContext ctc, int index){
								return ChangeNotifierProvider.value(
									value: favsProvider.getFavsItems.values.toList()[index],
									child: WishlistFull(
										productId: favsProvider.getFavsItems.keys.toList()[index],
									),
								);
							}
						),
          );
  }
}
