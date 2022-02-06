import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/top_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var DefaultFirebaseConfig;
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(title: 'Flutter Demo Home Page'),
    );
  }
}