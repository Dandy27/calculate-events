import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                            hintText: 'Password',
                            isCollapsed: true,
                            border: InputBorder.none),
                        autocorrect: false,
                        obscureText: true,
                        validator: (pass){
                          if(pass.isEmpty || pass.length < 6)
                            return 'Senha inválida';
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci a senha ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
