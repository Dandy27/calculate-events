import 'package:calculate_events_app/common/custom_drawer/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController prodController = TextEditingController();
  TextEditingController quantController = TextEditingController();
  TextEditingController pesoBrutoController = TextEditingController();
  TextEditingController taraController = TextEditingController();
  TextEditingController pesoGrfAbertaController = TextEditingController();

  String _infoText = '0 doses)';

  void _resetFields() {
    prodController.text = '';
    quantController.text = '';
    pesoBrutoController.text = '';
    taraController.text = '';
    pesoGrfAbertaController.text = '';
    setState(() {
      _infoText = '(0 doses)';
    });
  }

  void _calculate() {
    setState(() {
      double quantDoses = double.parse(quantController.text);
      double pesoBruto = double.parse(pesoBrutoController.text);
      double tara = double.parse(taraController.text);
      double pesoGrfAberta = double.parse(pesoGrfAbertaController.text);
      double total = ((pesoGrfAberta - tara) * quantDoses) / (pesoBruto - tara);
      print(total);
      if ((pesoGrfAberta >= tara) &&
          (pesoGrfAberta <= pesoBruto) &&
          (quantDoses >= 1)) {
        _infoText = '(${total.toStringAsFixed(1)}) doses';
      } else {
        _infoText = 'ERROR';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.add), onPressed: (){
                      Navigator.of(context).pushNamed('/cadastrar');
                    }),
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        padding: EdgeInsets.only(right: 20),
                        onPressed: () {
                          _resetFields();
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                )
              ],
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Calculate Drink",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image.network(
                    // "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350"
                  // 'https://images.pexels.com/photos/401098/pexels-photo-401098.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                // 'https://images.pexels.com/photos/989959/pexels-photo-989959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
// 'https://s1.static.brasilescola.uol.com.br/be/conteudo/images/gua.jpg'
//                   'https://static.mundoeducacao.uol.com.br/mundoeducacao/conteudo_legenda/83e137b1b6a951e41d3b9552d26fa52a.jpg'
//                   'https://www.falamart.com.br/wp-content/uploads/2018/12/garrafas-lista-de-bebidas.jpg'
// 'https://jordanaribeiropsi.files.wordpress.com/2016/06/bebidas.jpg?w=640'
              // 'https://asset1.zankyou.com/images/mag-card-c/d66/f6e3/878/623/-/br/wp-content/uploads/2019/04/z-capa-top.jpg'
// 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrx0w5AksNH0eRck5AKlGPRNeWh539Z2VvyOI0_8IBig0BM5P5mc3Qwdds-iUD0at__10&usqp=CAU'
'https://bsbflash.com.br/wp-content/uploads/2020/02/gin-sabores-diferentes.jpg'


                  ,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 35, top: 25, right: 35),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return "Insira o o nome do produto";
                              return null;
                            },
                            controller: prodController,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Insira a quantidade de doses';
                              return null;
                            },
                            controller: quantController,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return 'Insira o peso Bruto';
                              return null;
                            },
                            controller: pesoBrutoController,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) return 'insira a tara';
                              return null;
                            },
                            controller: taraController,
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
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Insira peso da grf aberta';
                              return null;
                            },
                            controller: pesoGrfAbertaController,
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
                                'Calculate',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _calculate();
                                }
                              },
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
                              Expanded(
                                child: Text(
                                  'Result: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Text(
                                _infoText,
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
            ),
          );
        }),
      ),
    );
  }
}
