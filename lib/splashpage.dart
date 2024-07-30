import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 30),
        child: Container(
            color: Colors.brown[900],
            child: Center(
              child: Column(
                children: [
                  SizedBox(height:300),
                  Image.asset(
                      "assets/images/logo.png"
                  ),
                  Text('𝖌𝖗𝖔𝖜',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 45,
                      decoration:TextDecoration.none
                  ),)
                ],
              ),
            )
        )
    );
  }
}
