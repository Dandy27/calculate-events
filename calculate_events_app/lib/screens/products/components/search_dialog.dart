import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  color: Colors.grey[700],
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                  Navigator.of(context).pop();
                  },
                ),
              ),
              onFieldSubmitted: (text){
                Navigator.of(context).pop(text);
              } ,
            ),
          ),
        )
      ],
    );
  }
}