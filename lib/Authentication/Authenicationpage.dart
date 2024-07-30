import 'package:auth_firebase/Authentication/loginpage.dart';
import 'package:auth_firebase/Authentication/signuppage.dart';
import 'package:flutter/material.dart';

class Authenticationpage extends StatefulWidget {
  const Authenticationpage({super.key});

  @override
  State<Authenticationpage> createState() => _AuthenticationpageState();
}

class _AuthenticationpageState extends State<Authenticationpage> {
  @override
  bool issignin=false;
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[800],
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 10),
            width: issignin? _size.width*0.88:_size.width*0.18,
            height: _size.height,
            child:GestureDetector(
              onTap: (){
                setState(() {
                  issignin=true;
                });
              },
              child: Container(
                  color: Colors.grey[800],
                  child:loginpage()
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 10),
            height:_size.height ,
            width: _size.width*0.89,
            left: issignin?_size.width*0.88:_size.width*0.14,
            child:GestureDetector(
              onTap: (){
                setState(() {
                  issignin=false;
                });
              },
              child: Container(
                color: Colors.brown[800],
                child:signinpage(),
              ),
            ),
          ),
          Positioned(
            //  height:_size.height ,
            //  width: _size.width,
            left: _size.width*0.85,
            top: 430,
            child: Transform.rotate(
              angle: 90 * 3.141592653589793 / 180, // 90,
              child: Text("Sigin",
                style: TextStyle(color: issignin? Colors.white:Colors.brown[800],
                    fontSize: 40),),
            ),
          ),
          Positioned(
            //  height:_size.height ,
            //  width: _size.width,
            right: _size.width*0.82,
            top: 430,
            child: Transform.rotate(
              angle: 90 * 3.141592653589793 / 180, // 90,
              child: Text("Login",
                style: TextStyle(color:
                issignin?Colors.brown[700]:Colors.white,
                    fontSize: 40),),
            ),
          ),
        ],
      ),
    );
  }
}