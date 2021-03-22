import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 50, right: 50),
            child: ListView(
              children: [
                SizedBox(
                  width: 300,
                  height: 56,
                  child: Image.asset('images/logo_events.png'),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 18),
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nome Completo',
                        isCollapsed: true,
                        border: InputBorder.none),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 18),
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'E-mail',
                        isCollapsed: true,
                        border: InputBorder.none),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 18),
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Senha',
                        isCollapsed: true,
                        border: InputBorder.none),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 18),
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: ' Repetir Senha',
                        isCollapsed: true,
                        border: InputBorder.none),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 52,
                  child: MouseRegion(
                      child: ElevatedButton(
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
