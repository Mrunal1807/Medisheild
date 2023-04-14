


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:schedule/ui/widget/details2.dart';
import 'package:mailer/smtp_server.dart';
import 'package:schedule/ui/widget/ScreenArgumentdoctor.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
import '../../services/theme_services.dart';
import '../../theme.dart';
import'package:mailer/mailer.dart';
import 'package:schedule/ui/widget/item_widget.dart';
import 'package:schedule/widget/doctor.dart';
import '../../util/route.dart';
import '../add_task_bar.dart';
import 'package:schedule/ui/widget/edit2.dart';

class details2 extends StatefulWidget{
details2({Key,key,required this.document,required this.id}):super(key:key);
final Map<String,dynamic>document;
final String id;


  @override
  State<details2> createState() => _details2State();
}

class _details2State extends State<details2> {
 /* String name="";
  String speciality="";
  String email="";
  String Contact_number="";
  String Location="";
  String fees="";*/

  @override
  Widget build(BuildContext context) {
   /* final argsAp = ModalRoute.of(context)!.settings.arguments
    as ScreenArgumentsdoctor;
    name = argsAp.name;
    speciality = argsAp.speciality;
    email = argsAp.email;
    Contact_number= argsAp.Contact_number;
    Location = argsAp.location;
    fees=argsAp.fees;*/
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [

          TaskBar(),

        ],
      ),
    );
  }
  _appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size:20,
            color: Colors.white
        ),
      ),
      //title: Icon(Icons.edit,),

      actions: [
       Row(
         children: [
           IconButton(
             onPressed: () async {
               await Future.delayed(Duration(seconds: 0));
               await Navigator.push(context,MaterialPageRoute(builder: (builder)=>EditTaskPage2(
                 name:widget.document["doctor's name"],
                 speciality:widget.document["speciality"],
                 Contact_number:widget.document["Contact number"],
                 Location:widget.document["Location"],
                 email:widget.document["Email id"],
                 fees:widget.document["fees"],
                 id:widget.id,
               )));
             },
             icon: Icon(Icons.edit,size: 40,),
             color:Colors.white,),
           SizedBox(width: 20,),
           IconButton(
             onPressed: (){
               FirebaseFirestore.instance.collection("doctor").doc(widget.id).delete().then((value){
                 Navigator.pop(context);
               });



               Get.back();
             },
             icon: Icon(Icons.delete,size: 40,),
             color:Colors.white,),
          // Icon(Icons.delete,size: 40,),
         ],
       )
      ],
    );
  }
  TaskBar(){

    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:220 ,
              width:380,

              margin: EdgeInsets.only(top:25.0),
              padding:EdgeInsets.only(left:50.0,right: 50.0),
              //color: Colors.grey,

              decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),
                //border: Border.all(width: 2.0),
                boxShadow:[BoxShadow(
                  color: Colors.black12,
                  // blurRadius: 2.0,
                  offset: const Offset(5.0, 5.0),
                  // spreadRadius: 0.25,


                )],),
              child:Row(
                  children: [
                    Image.asset('images/doctor.png',scale: 4,),
                      SizedBox(width:30),
                    Flexible(child:
                    Column(
                      children: [
                        SizedBox(height: 90,),
                        Text(widget.document["doctor's name"],style: titleHeadingStyle3,),
                        Text(widget.document["speciality"],style: subTitleStyle5,),
                      ],
                    )
            ),
                  ],
                ),


            ),
           SizedBox(height: 10,),
           GestureDetector(
             onTap: ()async{
              print("calling...");
              // num;

              final Uri url=Uri(
              scheme: 'tel',
              path: widget.document["Contact number"],
              );
             if(await UrlLauncher.canLaunchUrl(url)) {
              await UrlLauncher.launchUrl(url);
                }else{
               print("call can not be connected");
             }
             },
             child: Container(

               height: 70,
                 width: 380,
              // color: Colors.grey,
               margin: EdgeInsets.only(top:25.0),
               padding:EdgeInsets.only(left:50.0,right: 50.0),
               decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),
                //border: Border.all(width: 10),
               boxShadow:[BoxShadow(
                color: Colors.white10,
                // blurRadius: 2.0,
                 offset: const Offset(5.0, 5.0),
                // spreadRadius: 0.25,


        )],
             ),
               child: Row(

                 children: [
                   Icon(Icons.call,size: 35,),
                   SizedBox(width: 30,height: 100,),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("\n"+widget.document["Contact number"],style: subTitleStyle6,),
                       Text("Mobile",style:subTitleStyle),
                     ],
                   )
                 ],
               )
             ),
           ),
            //SizedBox(height: 10,),
            GestureDetector(
              onTap: ()async{
               String Email=Uri.encodeComponent(widget.document["Email id"]);
               String Subject=Uri.encodeComponent("");
               String body=Uri.encodeComponent("");
               Uri mail=Uri.parse("mailto:$Email?subject=$Subject&body=$body");
               if(await UrlLauncher.canLaunchUrl(mail)){
                 UrlLauncher.launchUrl(mail);
               }else{
                 print("mail not sent");
               }
              },
              child: Container(

                  height: 70,
                  width: 380,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top:25.0),
                  padding:EdgeInsets.only(left:50.0,right: 50.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),
                    //border: Border.all(width: 10),
                    boxShadow:[BoxShadow(
                      color: Colors.white10,
                      // blurRadius: 2.0,
                      offset: const Offset(5.0, 5.0),
                      // spreadRadius: 0.25,


                    )],
                  ),
                  child: Row(

                    children: [
                      Icon(Icons.mail,size: 35,),
                      SizedBox(width: 30,height: 100,),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("\n"+widget.document["Email id"],style: subTitleStyle6,),
                            Text("Email",style:subTitleStyle),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                //callingfeature(),
                print("Location");
              },
              
                child: Container(

                    height: 90,
                    width: 380,
                    // color: Colors.grey,
                    margin: EdgeInsets.only(top:25.0),
                    padding:EdgeInsets.only(left:50.0,right: 50.0),
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),
                      //border: Border.all(width: 10),
                      boxShadow:[BoxShadow(
                        color: Colors.white10,
                        // blurRadius: 2.0,
                        offset: const Offset(5.0, 5.0),
                        // spreadRadius: 0.25,


                      )],
                    ),
                    child: Row(

                      children: [
                        Icon(Icons.location_on_rounded,size: 35,),
                        SizedBox(width: 30,height: 100,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                                Text("\n"+widget.document["Location"],style: subTitleStyle6,
                                textAlign:TextAlign.left,),
                              Text("Address",style:subTitleStyle),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              
            ),
            GestureDetector(
              onTap: (){
                //callingfeature(),
                //print("Location");
                moveToview(context);

              },
              child: Container(

                  height: 80,
                  width: 380,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top:25.0),
                  padding:EdgeInsets.only(left:50.0,right: 50.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),
                    //border: Border.all(width: 10),
                    boxShadow:[BoxShadow(
                      color: Colors.white10,
                      // blurRadius: 2.0,
                      offset: const Offset(5.0, 5.0),
                      // spreadRadius: 0.25,


                    )],
                  ),
                  child: Row(

                    children: [
                      Icon(Icons.push_pin,size: 35,),
                      SizedBox(width: 30,height: 100,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("\n"+"View Appointment",style: subTitleStyle6,),
                          Text("upcoming",style:subTitleStyle),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ],
        );





  }
  moveToedit2(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.edit2);
    setState(() {

    });
  }
  moveToview(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.viewapproute );
    setState(() {

    });
  }

}