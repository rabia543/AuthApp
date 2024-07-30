import 'package:auth_firebase/Authentication/Authenicationpage.dart';
import 'package:flutter/material.dart';
class frontPage extends StatelessWidget {
  const frontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 400,

        child: ElevatedButton(
        onPressed: ()  {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Authenticationpage()));
    },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[900],
                minimumSize: Size(250,50)
            ),
          child: Text("back"),
      ),),
    );
  }
}
