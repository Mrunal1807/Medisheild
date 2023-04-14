import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/models/catalog.dart';
import '../../services/theme_services.dart';
import '../../theme.dart';
import 'package:schedule/ui/widget/item_widget.dart';

import '../../util/route.dart';
import '../add_task_bar.dart';

class details3 extends StatefulWidget{
  //final Item item;


  @override
  State<details3> createState() => _details3State();
}

class _details3State extends State<details3> {
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
            color: Colors.white
        ),
      ),
      //title: Icon(Icons.edit,),

      actions: [
        Row(
          children: [
            IconButton(
              onPressed: ()=>print("notification on/off"),
              icon: Icon(Icons.notifications_none_outlined,size: 40,),
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
              Image.asset('images/img_4.png',scale: 4,),
              SizedBox(width:30),
              Column(
                children: [
                  SizedBox(height: 90,),
                  Text("Paracetemol",style: titleHeadingStyle3,),
                  Text("remind before"+ "\n"+"10 min ",style: subTitleStyle5,),
                ],
              )
            ],
          ),

        ),
        SizedBox(height: 10,),

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
                  Icon(Icons.alarm,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+"11.28 PM",style: subTitleStyle6,),
                      Text("Time to take it",style:subTitleStyle),
                    ],
                  )
                ],
              )
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
                  Icon(Icons.enhanced_encryption_outlined,size: 35,),
                  SizedBox(width: 30,height: 100,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+"1 pill",style: subTitleStyle6,),
                      Text("Prescribed amount to take",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),

        Container(

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
                  Icon(Icons.calendar_month_outlined,size: 35,),
                  SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+"31/1/2003",style: subTitleStyle6,),
                      Text("medication started at",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),

        GestureDetector(
          onTap: (){
            //callingfeature(),
            moveToedit3(context);
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
                  Icon(Icons.edit,size: 35,),
                  SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("\n"+"Edit",style: subTitleStyle6,),
                      Text("for required changes",style:subTitleStyle),
                    ],
                  )
                ],
              )
          ),
        ),
      ],
    );




  }
  moveToedit3(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.addtask3route );
    setState(() {

    });
  }


}