import 'package:flutter/material.dart';
import '../CustomWidgets/custometextfield.dart';
import '../FrontPage.dart';
import 'AuthService.dart';
class signinpage extends StatefulWidget {

  signinpage({super.key});

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  final emailcontroller= TextEditingController();

  final phonenumbercontroller=TextEditingController();

  final passwordcontroller=TextEditingController();

  final confirmPasswordcontroller=TextEditingController();

  final Authservice _authservice=Authservice();
  void dispose() {
    emailcontroller.dispose();
    phonenumbercontroller.dispose();
    passwordcontroller.dispose();
    confirmPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Column(
            children: [
              SizedBox(height: 130),
              Icon(Icons.lock, color: Colors.white),
              SizedBox(height:10),
              Text("Sigup",
                style: TextStyle(color: Colors.white,fontSize: 30),),
              SizedBox(height: 70),
              CustomTextField(hinttext: "Enter Your Email", controller: emailcontroller),
              SizedBox(height: 20,),
              CustomTextField(hinttext: "Enter Your Phone Number", controller: phonenumbercontroller),
              SizedBox(height: 20,),
              CustomTextField(hinttext: "Enter Your Password", controller: passwordcontroller),
              SizedBox(height: 20,),
              CustomTextField(hinttext: "Confirm Password", controller: confirmPasswordcontroller),
              SizedBox(height:4),
              Align(
                alignment: Alignment.centerRight,
                child:  Text("Already have account?",style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 60,),
              ElevatedButton(
                onPressed: () async {
                  if(passwordcontroller.text==confirmPasswordcontroller.text) {
                    await Authservice().signUp(email: emailcontroller.text,
                        password: passwordcontroller.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>frontPage()));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter same password')),
                    );
                  }
                  },
        child:
              Text("Signup",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
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