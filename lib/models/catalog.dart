import 'dart:core';

import 'catalog.dart';

class Item {

  int id;
  String title;
  String Hospital;
  String Doctor;
  bool isCompleted;
  String date;
  String startTime;
  String endTime;
  String color;
  int remind;
  String repeat;

  Item({ required this.id,  required this.title,  required this.Hospital,  required this.Doctor,  required this.isCompleted,  required this.date,required this.startTime,
  required this.endTime,required this.color,required this.remind,required this.repeat});
 factory Item.fromMap(Map<String,dynamic> map){
    return Item(
     id: map["id"],
     title: map["title"],
     Hospital: map["Hospital"],
     Doctor: map["Doctor"],
     isCompleted: map["isCompleted"],
     date: map["date"],
      startTime: map["startTime"],
      endTime: map["endTime"],
      color:map["color"],
      remind:map["remind"],
      repeat: map["repeat"],
   );
 }
   toMap()=>{
     "id":id,
     "name":title,
     "Hospital":Hospital,
     "Doctor":Doctor,
     "isCompleted":isCompleted,
     "date":date,
     "startTime":startTime,
     "endTime":endTime,
     "color":color,
     "remind":remind,
     "repeat":repeat,




  };

  }

class CatalogModel {
 static  List<Item> item=[
    /*Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")*/
  ];
}