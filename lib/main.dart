import 'package:shopie/consts/theme_data.dart';
import 'package:shopie/inner_screens/product_details.dart';
import 'package:shopie/provider/dark_theme_provider.dart';
import 'package:shopie/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/screens/cart.dart';
import 'package:shopie/screens/feeds.dart';
import 'package:shopie/screens/wishlist.dart';

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
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
						routes: {
              //   '/': (ctx) => LandingPage(),
              // BrandNavigationRailScreen.routeName: (ctx) =>
              //     BrandNavigationRailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              FeedsScreen.routeName: (ctx) => FeedsScreen(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
							ProductDetails.routeName: (ctx) => ProductDetails(),
            },
          );
        }));
  }
}
