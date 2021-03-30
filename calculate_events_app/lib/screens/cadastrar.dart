import 'package:flutter/material.dart';

class CadastrarScreen extends StatelessWidget {
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
    _infoText = '(0 doses)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar',
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
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 57,
                        child: ElevatedButton(
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).pushNamed('/lista_produtos');
                            }
                          },
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
    );
  }
}
