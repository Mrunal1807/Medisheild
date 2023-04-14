import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedule/widget/login_page.dart';




Future<User?>dSignUp(String email,String mobile,String username,String password,
    String confirmpassword) async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  try{
    UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("Account Created Successfully");
    userCredential.user!.updateDisplayName(username);


    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "email":email,
      "contact no":mobile,
      "username":username,
      "password":password,
      "confirmpassword":confirmpassword,
    });
    return userCredential.user;
  }catch(e){
    print(e);
    return null;
  }
}
Future<User?>dLogIn(String email,String password)async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  try{
    UserCredential userCredential=await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print("Log in successfully");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
    .then((value){
      userCredential.user!.updateDisplayName(value['username']);
    });
    return userCredential.user;
  }catch(e){
    print(e);
    return null;
  }
}
Future dLogOut(BuildContext context)async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  try{
    await _auth.signOut().then((value){
      Navigator.push(context,MaterialPageRoute(builder:(_)=>login_page()));
    }
    );
  }catch(e){
    print(e);
  }
}