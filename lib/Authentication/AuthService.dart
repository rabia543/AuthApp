import 'package:auth_firebase/Authentication/Authenicationpage.dart';
import 'package:auth_firebase/Authentication/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future <void>signUp({
    required String email,
    required String password,
})async{
  try{
await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    String errorMessage="";
    if(e.code=='weak-password'){
     errorMessage="your password is weak, enter 6 digits";
    }
    else if( e.code=='email-already-in-use'){
      errorMessage="This emailed already in use,try another account";
    }
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  catch(e){}
}
  // Sign In with Email and Password
  Future <void>login({
    required String email,
    required String password,
  })async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      String errorMessage="";
      if(e.code=='user-not-found'){
        errorMessage="no user found of that email";
      }
      else if( e.code=='wrong password'){
        errorMessage="The password is incorrect";
      }
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    catch(e){}
  }
Future<void>logout({required BuildContext context
})async{
 await FirebaseAuth.instance.signOut();
 await Future.delayed(const Duration(seconds: 1));
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Authenticationpage()));
}
}
