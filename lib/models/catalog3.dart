import 'catalog3.dart';
import 'dart:core';
class Item {

  final int id;
  final String pills_name;
  final int Pills_Amount ;
  final String Type;
  final String Starting_date;
  final int How_long;
  final String Time;
  final int remind;


  Item({ required this.id,  required this.pills_name,  required this.Pills_Amount,  required this.Type,  required this.Starting_date,  required this.How_long,
    required this.Time, required this.remind
  });
  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      pills_name: map["pills_name"],
      Pills_Amount: map["Pills_Amount"],
      Type: map["Type"],
      Starting_date: map["Starting_date"],
      How_long: map["How_long"],
      Time: map["Time"],
      remind: map["remind"],

    );
  }
  toMap()=>{
    "id":id,
    "pills_name":pills_name,
    "Pills_Amount":Pills_Amount,
    "Type":Type,
    "Starting_date":Starting_date,
    "How_long":How_long,
    "Time":Time,
    "remind":remind,




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