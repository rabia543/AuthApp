import 'package:auth_firebase/Authentication/AuthService.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/custometextfield.dart';
import '../FrontPage.dart';
class loginpage extends StatelessWidget {
  final  emailcontroller= TextEditingController();
  final passwordcontroller=TextEditingController();
  final Authservice _authService=Authservice();
  loginpage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
            children: [
              SizedBox(height: 130),
              Icon(Icons.lock, color: Colors.white),
              SizedBox(height:10),
              Text("Login",
                style: TextStyle(color: Colors.white,fontSize: 30),),
              SizedBox(height: 70),
              CustomTextField(hinttext: "Enter Your Email", controller: emailcontroller),
              SizedBox(height: 20,),
              CustomTextField(hinttext: "Enter password", controller: passwordcontroller),
              SizedBox(height:4),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    await Authservice().logout(context: context);

                  },
                  child: Text(
                    "Log Out?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              ElevatedButton(onPressed: ()async{
          await Authservice().login(
              email: emailcontroller.text,
              password: passwordcontroller.text);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>frontPage()));
              }, child:
              Text("Login",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[900],
                    minimumSize: Size(250,50)
                )
                ,)

            ]
        ),
      ),);
  }
}



