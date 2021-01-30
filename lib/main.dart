import 'package:deteccionplagas/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:dotenv/dotenv.dart' show load;
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  MyApp(){
    load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen()
    );
  }
}