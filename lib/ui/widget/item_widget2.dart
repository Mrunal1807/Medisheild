

//import 'dart:html';

import 'package:schedule/models/catalog2.dart';
import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../util/route.dart';
import 'ScreenArgumentdoctor.dart';
class ItemWidget2 extends StatefulWidget{
 // final Item item;
  final   name;
  final speciality;
  final fees;
  final contact_number;
  final email;
  final location;

  const ItemWidget2({Key? key, required this.name,required this.speciality,required this.fees,required this.contact_number,required this.email,required this.location})
      : assert(name !=null),
        super(key: key);

  @override
  State<ItemWidget2> createState() => _ItemWidget2State();
}

class _ItemWidget2State extends State<ItemWidget2> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        tileColor: Colors.black12,

        shape:  RoundedRectangleBorder(),
        onTap: (){
            //moveToaddtask2(context);
          moveTodetails2(context);

        },
        leading: Image.asset('images/doctor.png',scale: 10,),
        title: Text(widget.name),
        subtitle: Text(widget.speciality),
        trailing: Text("\$${widget.fees}",
        textScaleFactor: 1.5,
        style:TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.w400,
        ))

      ),
    );
  }
  moveTodetails2(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.details2route, );
    setState(() {

    });
  }
}