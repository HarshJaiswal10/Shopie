import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopie/consts/colors.dart';
import 'package:shopie/provider/dark_theme_provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAUD'),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
											 Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
								Container(
									color: Theme.of(context).scaffoldBackgroundColor,
									child: Padding(
									  padding: const EdgeInsets.all(16.0),
									  child: Column(
									  	crossAxisAlignment: CrossAxisAlignment.start,
									  	children: [
									  		Container(
									  			width: MediaQuery.of(context).size.width * 0.9,
									  			child: Text(
									  				'title',
									  				maxLines: 2,
									  				style: TextStyle(
									  					// color: Theme.of(context).textSelectionColor,
									  					fontSize: 28.0,
									  					fontWeight: FontWeight.w600,
									  				),
									  			),
									  		),
									  		SizedBox(height: 8),
									  		Text(
									  			'US \$ 15',
									  			style: TextStyle(
									  				color: themeState.darkTheme 
									  				? Theme.of(context).disabledColor
									  				: ColorsConsts.subTitle,
									  				fontSize: 21.0,
									  				fontWeight: FontWeight.bold,
									  			),
									  		),
									  	],
									  ),
									),
									
								),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
