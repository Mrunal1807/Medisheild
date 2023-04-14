import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/models/catalog.dart';
import '../../services/theme_services.dart';
import '../../theme.dart';
import 'package:schedule/ui/widget/item_widget.dart';

import '../../util/route.dart';
import '../add_task_bar.dart';
import 'details2.dart';

class details extends StatefulWidget{
  details({Key,key,required this.document,required this.id}):super(key:key);
  final Map<String,dynamic>document;

  final String id;


  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
 /* moveTodetails2(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.details2route );
    setState(() {

    });
  }*/

  @override
  Widget build(BuildContext context) {
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
            color: Colors.white,
        ),
      ),

      actions: [
        Row(
          children: [
            IconButton(
              onPressed: ()=>moveToedit(context),
              icon: Icon(Icons.edit,size: 40,),
              color:Colors.white,),
            SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                //deletedetails();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:180 ,
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
              Image.asset('images/detail.png',height: 500,width: 100,),
              SizedBox(width:30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 75,),
                  Text(widget.document["title"],style: titleHeadingStyle3,),
                  Text("remind before"+"\n"+widget.document["remind"].toString()+" min",style: subTitleStyle5,),
                ],
              )
            ],
          ),

        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: () async {
            await Navigator.push(context,MaterialPageRoute(builder: (builder)=>details2(
              document: widget.document,
              id: widget.id,
            )
            )



            );
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
                  Icon(Icons.health_and_safety,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+widget.document["doctor name"],style: subTitleStyle6,),
                      Text("Doctor's name",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),
        ),
        //SizedBox(height: 10,),
        Container(

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
                  Icon(Icons.calendar_today,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+widget.document["Date"],style: subTitleStyle6,),
                      Text("Appointment date",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),

        Container(

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
                  Icon(Icons.access_time,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+widget.document["start time"]+" to "+widget.document["end time"],style: subTitleStyle6,),
                      Text("Appointment time",style:subTitleStyle),
                    ],
                  )
                ],
              )
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
                  Icon(Icons.location_on,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+widget.document["location"],style: subTitleStyle6,),
                      Text("Address",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),
        ),

      ],
    );




  }
  moveToedit(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.addtaskroute );
    setState(() {

    });
  }

}