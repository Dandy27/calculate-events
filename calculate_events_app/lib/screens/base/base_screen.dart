import 'package:calculate_events_app/common/custom_drawer/custom_drawer.dart';
import 'package:calculate_events_app/models/page_manager.dart';
import 'package:calculate_events_app/screens/base/login/login_screen.dart';
import 'package:calculate_events_app/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'home_screen.dart';

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
          Home(),
          ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Home2'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Home3'),
            ),
          )
        ],
      ),
    );
  }
}
