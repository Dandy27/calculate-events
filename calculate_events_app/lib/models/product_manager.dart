import 'package:calculate_events_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductManager extends ChangeNotifier {


  ProductManager(){
   _loadAllProduct();
  }

  final Firestore firestore = Firestore.instance;
  List<Product> allProducts = [];

  Future<void>  _loadAllProduct() async{
    QuerySnapshot snapProducts = await firestore.collection('products').getDocuments();
    
    
    allProducts = snapProducts.documents.map(
            (d) => Product.fromDocument(d)).toList();

    notifyListeners();

   

  }

}