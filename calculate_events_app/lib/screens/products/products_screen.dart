import 'package:calculate_events_app/common/custom_drawer/custom_drawer.dart';
import 'package:calculate_events_app/models/product_manager.dart';
import 'package:calculate_events_app/screens/products/components/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showDialog(context: context, builder: (_) => SearchDialog());
          })
        ],
        elevation: 0,
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(4),
              itemCount: productManager.allProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(productManager.allProducts[index]);
              });
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,

    );
  }
}
