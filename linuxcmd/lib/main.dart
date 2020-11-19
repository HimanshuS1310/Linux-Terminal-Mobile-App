import 'package:flutter/material.dart';
import 'package:linuxcmd/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linux Terminal',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/linux128.png'),
        backgroundColor: Colors.deepPurple,
        title: Text("Linux Terminal", textAlign: TextAlign.center),
             
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text("LINUX",
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 3
              ),
              
              ),
              Expanded(
                child: HeroCard()
              ),
            ],
          ),
        ),
                ),
              );
            }
          }

