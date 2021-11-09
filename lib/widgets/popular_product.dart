import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopie/inner_screens/product_details.dart';
import 'package:shopie/models/product.dart';
import 'package:shopie/provider/cart_provider.dart';
import 'package:shopie/provider/favs_provider.dart';

class PopularProducts extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String description;
  // final double price;

  // const PopularProducts({Key key, this.imageUrl, this.title, this.description, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productAttributes = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productAttributes.id),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productAttributes.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12.0,
                      top: 10.0,
                      child: Icon(
                        Entypo.star,
                        color: favsProvider.getFavsItems.containsKey(productAttributes.id) ? Colors.red :Colors.grey.shade800,
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      top: 7.0,
                      child: Icon(
                        Entypo.star_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 3,
                      bottom: 4,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          '\$ ${productAttributes.price}',
                          style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productAttributes.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              productAttributes.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 1,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: cartProvider.getCartItems
                                        .containsKey(productAttributes.id)
                                    ? () {}
                                    : () {
                                        cartProvider.addProductToCart(
                                            productAttributes.id,
                                            productAttributes.price,
                                            productAttributes.title,
                                            productAttributes.imageUrl);
                                      },
                                borderRadius: BorderRadius.circular(30.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    cartProvider.getCartItems
                                            .containsKey(productAttributes.id)
                                        ? MaterialCommunityIcons.check_all
                                        : MaterialCommunityIcons.cart_plus,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
