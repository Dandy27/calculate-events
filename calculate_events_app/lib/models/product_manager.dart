import 'package:calculate_events_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProduct();
  }

  final Firestore firestore = Firestore.instance;
  List<Product> allProducts = [];

  String _search = '';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];

    if (search.isEmpty) {
      filteredProducts.addAll(allProducts);
    } else {
      filteredProducts.addAll(allProducts
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase())
      ),
      );
    }
    return filteredProducts;
  }

  Future<void> _loadAllProduct() async {
    QuerySnapshot snapProducts =
        await firestore.collection('products').getDocuments();

    allProducts =
        snapProducts.documents.map((d) => Product.fromDocument(d)).toList();

    notifyListeners();
  }
}
