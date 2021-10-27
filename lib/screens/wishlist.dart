import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopie/widgets/cart_full.dart';
import 'package:shopie/widgets/wishlist_empty.dart';
import 'package:shopie/widgets/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    List WishlistList = [];
    return WishlistList.isNotEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
						appBar: AppBar(
							title: Text('Wishlist ()'),
						),
            body: ListView.builder(
							itemCount: 1,
							itemBuilder: (BuildContext ctc, int index){
								return WishlistFull();
							}
						),
          );
  }
}
