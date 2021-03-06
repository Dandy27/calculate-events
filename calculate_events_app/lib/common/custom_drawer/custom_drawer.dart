import 'dart:ui';

import 'package:calculate_events_app/common/custom_drawer/custom_drawer_header.dart';
import 'package:calculate_events_app/common/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Colors.white,
               const Color.fromARGB(255, 203, 236, 241)
              ],
                begin: Alignment.topCenter,
                  end : Alignment.bottomCenter
              ),
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(
                iconData: Icons.home,
                title: 'Home',
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.list,
                title: 'Produtos',
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.playlist_add_check,
                title: 'Meus Produtos',
                page: 2,
              ),
              DrawerTile(
                iconData: Icons.location_on,
                title: 'Lojas',
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
