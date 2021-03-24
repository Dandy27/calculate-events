import 'package:calculate_events_app/common/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Calculate Drink',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 35, top: 25, right: 35),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Produto:',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(),
                            prefixText: 'name: '),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Quant/doses:',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(),
                            prefixText: 'quant: '),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Peso Bruto:',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(),
                            prefixText: 'gramas: '),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Tara:',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(),
                            prefixText: 'gramas: '),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: ' Peso da grf aberta:',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(),
                            prefixText: 'gramas: '),
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      height: 57,
                      width: 200,
                      child: SizedBox(
                        height: 57,
                        child: ElevatedButton(
                          child: Text(
                            'CALCULATE',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Result: ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
