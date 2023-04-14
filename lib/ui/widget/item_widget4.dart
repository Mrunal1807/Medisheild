import 'package:schedule/models/catalog3.dart';
import'package:flutter/material.dart';

import '../../util/route.dart';
class ItemWidget4 extends StatefulWidget{
  final Item item;

  const ItemWidget4({Key? key, required this.item})
      : assert(item!=null),
        super(key: key);

  @override
  State<ItemWidget4> createState() => _ItemWidget4State();
}

class _ItemWidget4State extends State<ItemWidget4> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
          tileColor: Colors.black12,

          //shape:  RoundedRectangleBorder(),
          onTap: (){
            //moveToaddtask2(context);
            moveTodetails3(context);

          },
          leading: Image.asset('images/img_4.png',scale: 10,),
          title: Text(widget.item.pills_name),
          subtitle: Text("${widget.item.Pills_Amount}"+widget.item.Type),
          trailing: Text(widget.item.Time,
              textScaleFactor: 1.5,
              style:TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.w400,
              ))

      ),
    );
  }
  moveTodetails3(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.details3route );
    setState(() {

    });
  }
}