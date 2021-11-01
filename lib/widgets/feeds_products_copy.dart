// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart';
// import 'package:shopie/inner_screens/product_details.dart';

// class FeedProduct extends StatefulWidget {
//   @override
//   _FeedProductState createState() => _FeedProductState();
// }

// class _FeedProductState extends State<FeedProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
// 				onTap: () => Navigator.of(context).pushNamed(ProductDetails.routeName),
//         child: Container(
//           width: 250,
//           height: 290,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             color: Theme.of(context).backgroundColor,
//           ),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
								
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(2),
//                     child: Container(
//                       width: double.infinity,
//                       constraints: BoxConstraints(
//                           minHeight: 100,
//                           maxHeight: MediaQuery.of(context).size.height * 0.3),
//                       child: Image.network(
//                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAUD',
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//                   ),
// 								Positioned(
// 									// right: 0,
// 									// left: 0,
// 									// bottom: 0,
// 								  child: Badge(
// 								  	// alignment: Alignment.center,
// 								  	toAnimate: true,
// 								  	shape: BadgeShape.square,
// 								  	badgeColor: Colors.pink,
// 								  	borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
// 								  	badgeContent: Text('NEW', style: TextStyle(color: Colors.white)),
// 								  ),
// 								),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 5),
//                 margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       'Description',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(
//                         '\$ 160.99',
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     Row(
// 									mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Quantity: 2',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () {},
//                             borderRadius: BorderRadius.circular(18),
//                             child: Icon(
//                               Icons.more_horiz,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
