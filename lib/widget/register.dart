import 'dart:async';
import 'dart:ui';
import 'dart:core';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schedule/theme.dart';
import 'package:schedule/widget/login_page.dart';
import '../methods.dart';
import '../util/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class registor_page extends StatefulWidget {
  const registor_page({Key? key}):super(key:key);
  @override
  State<registor_page> createState() => _registor_pageState();
}

class _registor_pageState extends State<registor_page> {

  final TextEditingController _pass=TextEditingController();
  final TextEditingController _confirmpass=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _username=TextEditingController();
  final TextEditingController _mobile=TextEditingController();
 bool isLoading=false;


  final _formkey=GlobalKey<FormState>();
  moveTologin(BuildContext context) async {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {

      });
    }
  @override
  Widget build(BuildContext context) {
    bool obs_text=true;
    final size=MediaQuery.of(context).size;
    // TODO: implement build
    return MaterialApp(
        home:Material(
        color: Colors.white,
        child:SingleChildScrollView(
        child: Form(
        key:_formkey,
        child: Column(
        children: [
          Image.asset('images/registor.png',
            fit:BoxFit.fitHeight,
            height: 350,
          ),
           SizedBox(
    height:20.0,
    ),
             Text(
    "Sign Up",
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
    hintText:"enter email id",
    labelText:"Email",
    labelStyle: TextStyle(color: Colors.black87),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54)
    ),
    ),

    ),
                   TextFormField(
                     controller: _mobile,
                     cursorColor: Colors.green,
                     decoration: InputDecoration(
                       hintText:"enter mobile no",
                       labelText:"Contact number",
                       labelStyle: TextStyle(color: Colors.black87),
                       focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black54)
                       ),
                     ),

                   ),
                   TextFormField(
                     controller: _username,
                     cursorColor: Colors.green,
                     decoration: InputDecoration(
                       hintText:"enter username",
                       labelText:"Username",
                       labelStyle: TextStyle(color: Colors.black87),
                       focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black54)
                       ),
                     ),

                   ),


                   SizedBox(
                     height:10.0,
                   ),
                   TextFormField(
                     controller: _pass,
                     cursorColor: Colors.green,
                     obscureText: true,
                     decoration: InputDecoration(
                       hintText:"enter password",
                       labelText:"password",
                       labelStyle: TextStyle(color: Colors.black87),
                       focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black54)
                       ),
                     ),



                   ),
                    SizedBox(height: 10,),
                   TextFormField(
                     cursorColor: Colors.red,
                     obscureText: true,
                     controller: _confirmpass,
                     decoration: InputDecoration(

                       hintText:"Confirm password",
                       labelText:"enter password",
                       labelStyle: TextStyle(color: Colors.black87),
                       focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black54)
                       ),
                     ),

                   ),

                    SizedBox(
                    height:60.0,
                  ),

                       Material(
                        color: dullblue,
                     borderRadius:
                     BorderRadius.circular(35.35),
                               child: InkWell(
                         onTap:()=> {
                         if(_email.text.isNotEmpty&&
                             _mobile.text.isNotEmpty&&
                             _username.text.isNotEmpty&&
                         _pass.text.isNotEmpty&&
                         _confirmpass.text.isNotEmpty
                         ){
                                   setState(() {
                       isLoading=true;
                       }),

                dSignUp(
                  _email.text,
                _mobile.text,
                _username.text,
                _pass.text,
                _confirmpass.text,


            )
                .then((user){
              if(user!=null){
                setState(() {
                  isLoading=false;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(_)=>login_page()));
              }else{
                setState(() {
                  isLoading=false;
                });
              }
            }),
            }else {
        print("please fill the form correctly"),
        }
                         },
                                 child: AnimatedContainer(
                                   duration: Duration(seconds: 1),
                                  height: 50,
                                   width: 120,

            alignment: Alignment.center,
            child:
            Text(
              "Sign up",
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

      Text("Already have an account?"),
      GestureDetector(
        onTap: ()=>
            Get.back(),
        child: Container(
          color: Colors.white,
          child:Text("Log in",style:subTitleStyle8),
        ),
      )
    ]
    )
    ),
        ]),
        ),
         // primary: _form.currentState?.validate()
        ),

        ),
    );
  }

}
