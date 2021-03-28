import 'package:calculate_events_app/models/product.dart';
import 'package:calculate_events_app/models/product_manager.dart';
import 'package:calculate_events_app/models/user_manager.dart';
import 'package:calculate_events_app/screens/base/base_screen.dart';
import 'package:calculate_events_app/screens/base/login/login_screen.dart';
import 'package:calculate_events_app/screens/base/signup/signup_screen.dart';
import 'package:calculate_events_app/screens/product/product_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(builder: (_) => MyApp()));
}
// Firestore.instance.collection('teste').add({'teste': 'teste'});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Calculate Events',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF0561F9),
          accentColor: Color(0xFFD90D69),
        ),
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/product':
              return MaterialPageRoute(builder: (_) => ProductScreen(
                  settings.arguments as Product
              ));
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
