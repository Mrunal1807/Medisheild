import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:schedule/models/catalog.dart';
import 'package:schedule/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:schedule/ui/widget/button.dart';
import 'package:schedule/ui/add_task_bar.dart';
import 'package:schedule/ui/widget/details.dart';
import 'package:schedule/ui/widget/details2.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}):super(key:key);
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Stream<QuerySnapshot>_stream=FirebaseFirestore.instance.collection("appointment").snapshots();
  DateTime _selectedDate =DateTime.now();


  void initState(){
    super.initState();
    loadData();
  }
  Widget build(BuildContext context){

    return Scaffold(

          appBar:_appBar(),

          backgroundColor: context.theme.backgroundColor,
          body:Column(
            children:[
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),

                ],
              ),
             _addTaskBar(),
             _addDateBar(),
      ],
          ),
                );
  }

_appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,
              size:20,
              color:Colors.black,
          ),
        ),
      title: Text(
        "Appointments",
            style: titleHeadingStyle2,
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/img.png",
          ),
        )
      ],
    );
}
_addTaskBar(){
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
              style:subHeadingStyle,
              ),
              Text("Today",
              style:HeadingStyle,)
            ],
          ),
        ),
        SizedBox(
          width: 90,
        ),

        MyButton(label: "Add""\n" "Appointment", onTap:()async{
          await Get.to(()=>AddTaskPage());
         // _taskController.getTasks();
  },
        ),
      ],
    );

}
_addDateBar(){

    return GestureDetector(
      onTap:(){
        print("schedule");

      },
      child: Container(
        margin: const EdgeInsets.only(top:20,bottom: 20),
          child: Column(
            children: [
              DatePicker(
                DateTime.now(),
                height: 100,
                  width:80,
                  initialSelectedDate: DateTime.now(),
                selectionColor: Colors.blueGrey,
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),

                child: Container(
                  height: 430,
                  width:380,
                  // color: Colors.black12,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: StreamBuilder(
                    stream: _stream,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(child:CircularProgressIndicator());
                      }
                      return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                            itemBuilder:(context, index) {
                              Map<String,dynamic> document=snapshot.data?.docs[index].data() as Map<String,dynamic>;

                              return Card(

                                elevation: 0.0,
                                child: ListTile(

                                    tileColor: Colors.black12,
                                    shape:  RoundedRectangleBorder(),

                                    onTap: () async {

                                      await Future.delayed(Duration(seconds: 0));
                                      await Navigator.push(context,MaterialPageRoute(builder: (builder)=>details(
                                        document: document,
                                        id: snapshot.data!.docs[index].id,
                                      )
                                      )



                                      );
                                      setState(() {

                                      });

                                    },

                                    leading: Image.asset('images/detail.png',scale: 10,),
                                    title: Text(document["title"]),
                                    subtitle:
                                        Text(document["start time"]+"-"+document["end time"]),



                                ),
                              );
                            },
                            itemCount:snapshot.data?.docs.length,
                          )

                      );
                    }
                ),
                  ),


              ),
            ],
          ),


      ),
    );
}
loadData()async{
  //await Future.delayed(Duration(seconds: 2));
  final catalogjson=await rootBundle.loadString("files/catalog.json");
  final decodedata=jsonDecode(catalogjson);
  var productdata=decodedata["product"];
  CatalogModel.item=List.from(productdata)
  .map<Item>((item)=>Item.fromMap(item))
  .toList();
  setState(() {});


}
}