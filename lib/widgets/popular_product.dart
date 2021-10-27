import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
				onTap: (){},
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
										height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAUD'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12.0,
                      top: 10.0,
                      child: Icon(
                        Entypo.star,
                        color: Colors.grey.shade800,
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
                          '\$ 12.2',
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
                        'Title',
                        maxLines: 1,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
											// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Description',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
												Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(30.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  MaterialCommunityIcons.cart_plus,
                                  size: 25,
                                  color: Colors.black,
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