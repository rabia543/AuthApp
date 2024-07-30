import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth_firebase/splashpage.dart';
import 'package:flutter/material.dart';

import 'Authentication/Authenicationpage.dart';


void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp  ());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splashscreen(),
    );
  }
}
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Authenticationpage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPage(),
    );
  }
}
