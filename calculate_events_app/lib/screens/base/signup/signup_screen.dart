import 'package:calculate_events_app/helpers/validators.dart';
import 'package:calculate_events_app/models/user.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 50, right: 50),
            child: Form(
              key: formKey,
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
                      onSaved: (name) => user.name = name,
                      decoration: InputDecoration(
                          hintText: 'Nome Completo',
                          isCollapsed: true,
                          border: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (name) {
                        if(name.isEmpty)
                          return 'Campo obrigatório';
                        else if(name.trim().split(' ').length <= 1)
                          return 'Preencha seu nome completo';
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
                      onSaved: (email) => user.email = email,
                      decoration: InputDecoration(
                          hintText: 'E-mail',
                          isCollapsed: true,
                          border: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if(email.isEmpty)
                          return 'Campo obrigatório';
                        else if(!emailValid(email))
                          return 'Email inválido';
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
                      onSaved: (pass) => user.password = pass,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo Obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
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
                      onSaved: (pass) => user.confirmPassword = pass,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo obrigatório';
                        else if(pass.length < 6)
                          return 'Senha muito fraca';
                        return null;
                      },
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
                        if(formKey.currentState.validate()){
                          formKey.currentState.save();

                          if(user.password != user.confirmPassword){
                            scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Senhas não coincidem!'),
                                  backgroundColor:
                                  Theme.of(context)
                                      .accentColor,
                                )
                            );

                            return;
                          }
                          //usermanager
                        }
                      },
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
