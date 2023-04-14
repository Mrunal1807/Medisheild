import 'dart:async';
import 'dart:ui';
import 'dart:core';
import 'package:schedule/Home_page1.dart';
import 'package:schedule/theme.dart';

import '../util/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:schedule/methods.dart';


class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String name="";
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  bool isLoading=false;
  final _formkey=GlobalKey<FormState>();

  moveToHome(BuildContext context) async {

    if (_formkey.currentState!.validate()) {
      setState(() {

      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {

      });
    }
  }
  moveToregistor(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.registor );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    bool obs_text=true;
    final size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
      color:Colors.black54,

      home:Material(
        color: Colors.white,
        child:SingleChildScrollView(
          child:
          Form(
            key:_formkey,

              child: Column(
                  children: [
                    Image.asset('images/login_img.png',
                        fit:BoxFit.fitHeight,
                      height: 400,
                    ),
                    SizedBox(
                      height:20.0,
                    ),

                 Text("  Sign in",
                textDirection: TextDirection.ltr,
                style:  TextStyle(
                  fontSize:28,
                  fontWeight:FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                 ),

                    SizedBox(
                      height:10.0,
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                        child: Column(children:[
                          TextFormField(
                            controller: _email,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              hintText:"enter email",
                              labelText:"Email",
                              labelStyle: TextStyle(color: Colors.black87),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)
                              ),
                            ),
                           /* validator:(value) {
                              if(value!=null && value.isEmpty){
                                return  "Email can not be empty";
                              }
                              else if(value!=null && value.length<6){
                                return "6 character is mandantory for login";
                              }

                              return null;
                            },*/
                        ),



                             SizedBox(
                               height:10.0,
                            ),
                           TextFormField(
                             controller: _password,
                        cursorColor: Colors.green,
                                 obscureText: true,
                                 decoration: InputDecoration(
                                   hintText:"enter password",
                                labelText:"password",
                                labelStyle: TextStyle(color: Colors.black87),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54)
                                ),
                                 ),

                             /* validator:(value) {
                                if(value!=null && value.isEmpty){
                                  return  "Password can not be empty";
                                }
                                else if(value!=null && value.length<6){
                                  return "6 character is mandantory for login";
                                }

                                return null;
                              },*/
                          ),
                           
                          SizedBox(
                            height:40.0,
                          ),

                          Material(
                            color: dullblue,
                            child: InkWell(
                              onTap:(){
                                if (_email.text.isNotEmpty &&
                                    _password.text.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  dLogIn(_email.text, _password.text)
                                      .then((user) {
                                    if (user != null) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => home_page1())
                                    );
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                } else {
                                  print("please fill the form correctly");
                                }
                              },
                              child: Container(

                                height: 50,
                                width: 120,
                                //color:Colors.d5eepPurple,
                                alignment: Alignment.center,
                                /*child: changebutton
                                    ?  Icon(
                                    Icons.done,
                                    color: Colors.white
                                ):*/
                               child: Text(
                                  "Login",
                                  style:TextStyle(
                                    color: Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                              ),
                            ),

                          ),
                          SizedBox(height: 20,),

                              Text("Don't have an account?"),
                              GestureDetector(
                                onTap: ()=>
                                moveToregistor(context),
                                child: Container(
                                  color: Colors.white,
                                  child:Text("Sign Up",style:subTitleStyle8),
                                ),
                              )
                        ]
                        )
                    ),
                  ]),
            ),
          ),


      ),
    );
  }

}
