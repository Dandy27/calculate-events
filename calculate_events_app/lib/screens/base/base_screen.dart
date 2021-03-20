import 'package:calculate_events_app/common/custom_drawer/custom_drawer.dart';
import 'package:calculate_events_app/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(_pageController),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Home'),
            ),
          ),
          Container(color: Colors.red,),
          Container(color: Colors.yellow),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
