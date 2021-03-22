import 'package:calculate_events_app/models/user_manager.dart';
import 'package:calculate_events_app/screens/base/base_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => MyApp()
  ));

  // Firestore.instance.collection('teste').add({'teste': 'teste'});

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Calculate Events',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF0561F9),
          accentColor: Color(0xFFD90D69),
        ),
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        home: LayoutBuilder(
          builder: (context, constraints){
            return BaseScreen();
          },
        )
      ),
    );
  }
}
