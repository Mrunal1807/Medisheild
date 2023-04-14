import 'dart:convert';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/models/catalog3.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:schedule/ui/widget/item_widget4.dart';
import '../util/route.dart';
import 'drawer.dart';

class medicine extends StatefulWidget {
  const medicine({Key? key}):super(key:key);
  @override
  medicineState createState() => medicineState();
}

class medicineState extends State<medicine> {

  DateTime _selectedDate =DateTime.now();

  void initState(){
    super.initState();

    loadData();
  }
  Widget build(BuildContext context){

    return Scaffold(

      appBar:_appBar(),
       backgroundColor:context.theme.backgroundColor,

      body:Column(
        children:[
          _addTaskBar(),
          _addDateBar(),
          Padding(
              padding: const EdgeInsets.all(16.0),

                  child: Container(
                    height: 400,
                    width:380,
                   // color: Colors.black12,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:Expanded(
                      child:(CatalogModel.item!=null && CatalogModel.item.isNotEmpty)
                          ?  ListView.builder(
                        itemBuilder:(context, index) {
                              return ItemWidget4(item: CatalogModel.item[index]);
                        },
                        itemCount:CatalogModel.item.length,
                      )


                          :Center(
                        child: CircularProgressIndicator(color: Colors.black54,),
                      ),),),


              ),


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

              Mydrawer();
            },
            child: Icon(Icons.view_headline,
              size:20,
              color: Colors.white,
            ),
          ),
          title:
              Text(
                "Meditrack",
                style: titleHeadingStyle_2,
              ),



          actions: [
          IconButton(onPressed:()=>moveToaddtask3(context), icon: Icon(Icons.add),iconSize: 35,),
          ],
        );

  }
  _addTaskBar(){

    return Container(
     // color: Colors.blueGrey,
      height: 150,
      width: 400,
      decoration:BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
      color:    Colors.blueGrey),
          child:Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: 40,),
                Text("Hello,Mrunal !!!",style:subTitleStyle2),
                Text("We will remind you of the medicines you need to take today.",style:subTitleStyle4),
              ],
            ),
          ),
          //IconButton(onPressed: , icon: Icons.notifications_active)


    );


  }
  _addDateBar(){

    return Container(
      margin: const EdgeInsets.only(top:20,bottom: 5),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width:80,
        initialSelectedDate: DateTime.now(),
        selectionColor:Colors.black54,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.abel(textStyle:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color:Colors.grey,
        ),
        ),
        monthTextStyle: GoogleFonts.abel(textStyle:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color:Colors.grey,
        ),
        ),
        dayTextStyle: GoogleFonts.abel(textStyle:TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color:Colors.grey,
        ),
        ),
        onDateChange: (date){
          _selectedDate=date;
        },



      ),
    );
  }
  _notifybellact(){
    return IconButton(onPressed:_notifybellinact, icon: Icon(Icons.notifications_active,size: 40,color: Colors.black54,));
  }
  _notifybellinact(){
    return IconButton(onPressed: _notifybellact, icon: Icon(Icons.notifications_off));
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 0));
    final catalogjson=await rootBundle.loadString("files/catalog3.json");
    final decodedata=jsonDecode(catalogjson);
    var productdata=decodedata["product"];
    CatalogModel.item=List.from(productdata)
        .map<Item>((item)=>Item.fromMap(item))
        .toList();
    setState(() {});


  }
  moveToaddtask3(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.addtask3route );
    setState(() {

    });
  }
}