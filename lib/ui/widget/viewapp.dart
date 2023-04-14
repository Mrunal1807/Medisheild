import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schedule/models/catalog.dart';
import '../../services/theme_services.dart';
import '../../theme.dart';
import 'package:schedule/ui/widget/item_widget.dart';

import '../../util/route.dart';
import '../add_task_bar.dart';
import 'item_widget2.dart';
import 'item_widget3.dart';

class viewapp extends StatefulWidget{
  //final Item item;


  @override
  State<viewapp> createState() => _viewappState();
}

class _viewappState extends State<viewapp> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 0));
    final catalogjson=await rootBundle.loadString("files/catalog.json");
    //print(catalogjson);
    final decodedata=jsonDecode(catalogjson);
    //print(decodedata);
    var productdata=decodedata["product"];
    CatalogModel.item=List.from(productdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),

      body: Column(
        children: [
          //SizedBox(height: 10,),
          TaskBar(),
          SizedBox(height: 30,),
          Expanded(
            child: ListView.builder(
              itemCount: CatalogModel.item.length,
              itemBuilder: (context, index) {
                return ItemWidget3(item: CatalogModel.item[index]);
              },

            ),
          )
        ],
      ),

    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white
        ),
      ),
      actions: [
        IconButton(icon:Icon(Icons.add,size: 35,),
          onPressed: ()=>moveToaddtask(context),
        ),
        SizedBox(width: 20,),
      ],
      //title: Icon(Icons.edit,),


    );
  }

  TaskBar() {

       return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: 360,

              margin: EdgeInsets.only(top: 25.0),
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              //color: Colors.grey,

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
                //border: Border.all(width: 2.0),
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  // blurRadius: 2.0,
                  offset: const Offset(5.0, 5.0),
                  // spreadRadius: 0.25,


                )
                ],),
              child: Row(
                children: [
                  Image.asset('images/doctor.png', scale: 4,),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      SizedBox(height: 90,),
                      Text("Doctor name", style: titleHeadingStyle3,),
                      Text("Speciality", style: subTitleStyle5,),
                    ],
                  )
                ],
              ),

            ),


          ],
        );

  }


  moveToedit2(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context, MyRoutes.addtask2route);
    setState(() {

    });
  }
  moveToaddtask(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.addtaskroute );
    setState(() {

    });
  }

}