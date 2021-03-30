import 'package:flutter/material.dart';

class ListProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de produtos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, contraints){
          return ListView(
            children: [

            ],
          );
        },
      ),
    );
  }
}
