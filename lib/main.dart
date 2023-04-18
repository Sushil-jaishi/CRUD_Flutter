import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CRUD',
            theme: ThemeData(primarySwatch: Colors.blueGrey),
            home: HomePage(),
          );
        });
  }
}
