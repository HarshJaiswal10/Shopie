import 'package:flutter/material.dart';
import 'package:shopie/screens/upload_product_form.dart';
import 'package:shopie/screens/bottom_bar.dart';


class MainScreens extends StatelessWidget {
	static const routeName = '/MainScreens';

	@override
	Widget build(BuildContext context) {
		return PageView(
			children: [
				BottomBarScreen(),UploadProductForm()
			],
		);
	}
}