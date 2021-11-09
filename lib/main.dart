import 'package:shopie/consts/theme_data.dart';
import 'package:shopie/inner_screens/categories_feeds.dart';
import 'package:shopie/inner_screens/product_details.dart';
import 'package:shopie/inner_screens/upload_product_form.dart';
import 'package:shopie/provider/cart_provider.dart';
import 'package:shopie/provider/dark_theme_provider.dart';
import 'package:shopie/provider/favs_provider.dart';
import 'package:shopie/provider/products.dart';
import 'package:shopie/screens/auth/login.dart';
import 'package:shopie/screens/auth/sign_up.dart';
import 'package:shopie/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/screens/cart.dart';
import 'package:shopie/screens/feeds.dart';
import 'package:shopie/screens/landing_page.dart';
import 'package:shopie/screens/main_screen.dart';
import 'package:shopie/screens/wishlist.dart';

import 'inner_screens/brands_navigation_rail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(
            create: (_) => Products(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavsProvider(),
          ),
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: LandingPage(),
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
							LoginScreen.routeName: (ctx) => LoginScreen(),
							SignUpScreen.routeName: (ctx) => SignUpScreen(),
							BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
							UploadProductForm.routeName: (ctx) => UploadProductForm(),
							MainScreens.routeName: (ctx) => MainScreens(),
            },
          );
        }));
  }
}
