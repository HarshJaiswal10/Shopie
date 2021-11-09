import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shopie/consts/colors.dart';
import 'package:shopie/provider/cart_provider.dart';
import 'package:shopie/services/global_method.dart';
import 'package:shopie/widgets/cart_empty.dart';
import 'package:shopie/widgets/cart_full.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
		GlobalMethods globalMethods = GlobalMethods();
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(context, cartProvider.totalAmount),
            appBar: AppBar(
							backgroundColor: Theme.of(context).backgroundColor,
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              actions: [
                IconButton(
                  icon: Icon(Feather.trash),
                  onPressed: () {
										globalMethods.showDialogg(
                                  "Clear cart!",
                                  "Your cart will be cleared!",
                                  () => cartProvider
                                      .clearCart(),context);
										// cartProvider.clearCart();
									},
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemCount: cartProvider.getCartItems.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return ChangeNotifierProvider.value(
                    value: cartProvider.getCartItems.values.toList()[index],
                    child: CartFull(
                      productId: cartProvider.getCartItems.keys.toList()[index],
                      // id: cartProvider.getCartItems.values.toList()[index].id,
                      // productId: cartProvider.getCartItems.keys.toList()[index],
                      // price: cartProvider.getCartItems.values.toList()[index].price,
                      // title: cartProvider.getCartItems.values.toList()[index].title,
                      // imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
                      // quantity: cartProvider.getCartItems.values.toList()[index].quantity,
                    ),
                  );
                },
              ),
            ),
          );
  }

  Widget checkoutSection(BuildContext context, double subtotal) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    ColorsConsts.gradiendFStart,
                    ColorsConsts.gradiendFEnd,
                  ], stops: [
                    0.0,
                    0.7
                  ]),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total',
              style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'US ${subtotal.toStringAsFixed(3)}',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
