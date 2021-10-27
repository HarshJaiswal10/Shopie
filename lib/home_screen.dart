import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver AppBar tutorial'),
            pinned: true,
            centerTitle: true,
            expandedHeight: 200,
            backgroundColor: Colors.blue,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Text("Hello World");
              },
							childCount: 50,
            ),
          ),
          // SliverFillRemaining(
          //   child: Center(
          //     child: Text('Hello world'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
