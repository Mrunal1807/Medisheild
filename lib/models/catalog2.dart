import 'dart:core';

import 'catalog.dart';

class Item {

  final int id;
  final String name;
  //final String Hospital_name;
  final String speciality;
  final int contact;
  final String email;
  final String Location;
  final int price;

  Item({ required this.id,  required this.name,   required this.speciality,  required this.contact,  required this.email,
    required this.Location,required this.price
  });
 factory Item.fromMap(Map<String,dynamic> map){
    return Item(
     id: map["id"],
     name: map["name"],
    // Hospital_name: map["Hospital_name"],
     speciality: map["speciality"],
     contact: map["contact"],
     email: map["email"],
      Location: map["Location"],
      price:map["price"],
   );
 }
   toMap()=>{
     "id":id,
     "name":name,
     //"Hospital_name":Hospital_name,
     "speciality":speciality,
     "contact":contact,
     "email":email,
     "Location":Location,
     "price":price,



  };

  }

/*class CatalogModel {
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
}*/