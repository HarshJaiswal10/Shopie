// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:list_tile_switch/list_tile_switch.dart';

// class UserScreen extends StatefulWidget {
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   ScrollController _scrollController;
//   var top = 0.0;
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _uid;
//   String _name;
//   String _email;
//   String _joinedAt;
//   String _userImageUrl;
//   int _phoneNumber;

//   // @override
//   // void initState() {
//   // 	super.initState();
//   // 	_scrollController = ScrollController();
//   // 	_scrollController.addListener(() {
//   // 		setState(() {});
//   // 	});
//   // 	// getData();
//   // }

//   // void getData() async{
//   // 	User user = _auth.currentUser;
//   // 	_uid = user.uid;

//   // 	print("user.displayName ${user.displayName}");
//   // 	print("user.photoURL ${user.photoURL}");
//   // 	final DocumentSnapshot userDoc = user.isAnonymous
//   // 	? null
//   // 	: await FirebaseFirestore.instance.collection('users').doc(_uid).get();
//   // 	if (userDoc == null){
//   // 		return;
//   // 	} else {
//   // 		setState(() {
//   // 			_name = userDoc.get('name');
//   // 			_email = user.email;
//   // 			_joinedAt = userDoc.get('joinedAt');
//   // 			_phoneNumber = userDoc.get('phoneNumber');
//   // 			_userImageUrl = userDoc.get('imageUrl');
//   // 		});
//   // 	}
//   // 	}
//   // }
//   bool _value = false;
//   @override
//   Widget build(BuildContext context) {
//     // final ThemeChange = Provider.of<DarkThemeProvider>(context);
//     return Scaffold(
//       body: Stack(
// 				children: [
// 					CustomScrollView(
// 						controller: _scrollController,
// 						slivers: [
// 							SliverAppBar(
// 								automaticallyImplyLeading: false,
// 								elevation: 4,
// 								expandedHeight: 200,
// 								pinned: true,
// 								flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
// 									top = constraints.biggest.height;
// 									return Container(
// 										decoration: BoxDecoration(
// 											gradient: LinearGradient(
// 												colors: [
// 													ColorsConsts.starterColor,
// 													ColorsConsts.endColor,
// 												],
// 												begin: const FractionalOffset(0.0, 0.0),
// 												end: const FractionalOffset(1.0, 0.0),
// 												stops: [0.0, 1.0],
// 												tileMode: TileMode.clamp,
// 											),
// 										),
// 										child: FlexibleSpaceBar(
// 											collapseMode: CollapseMode.parallax,
// 											centerTitle: true,
// 											title: Row(
// 												crossAxisAlignment: CrossAxisAlignment.center,
// 												children: [
// 													AnimatedOpacity(
// 														opacity: top <= 110.0 ? 1.0 : 0, 
// 														duration: Duration(milliseconds: 300),
// 														child: Row(
// 															children: [
// 																SizedBox(
// 																	width: 12,
// 																),
// 																Container(
// 																	height: kToolbarHeight / 1.8,
// 																)
// 															],
// 														),
// 													),
// 												],
// 											),
// 										),
// 									);
// 								}
// 								),
// 							)
// 						],
// 					),
// 				],
// 			),
//     );
//   }

//   List<IconData> _userTileIcons = [
//     Icons.email,
//     Icons.phone,
//     Icons.local_shipping,
//     Icons.watch_later,
//     Icons.exit_to_app_rounded,
//   ];

//   Widget userListTile(
//       String title, String subtitle, int index, BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         splashColor: Theme.of(context).splashColor,
//         child: ListTile(
//           onTap: () {},
//           title: Text(title),
//           subtitle: Text(subtitle),
//           leading: Icon(_userTileIcons[index]),
//         ),
//       ),
//     );
//   }

//   Widget userTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//       ),
//     );
//   }
// }
