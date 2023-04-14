import 'package:schedule/models/catalog.dart';
import'package:flutter/material.dart';

import '../../theme.dart';
import '../../util/route.dart';
class ItemWidget extends StatefulWidget{
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item!=null),
        super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  moveTodetails(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.detailsroute );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.0,
        child: ListTile(
            tileColor: Colors.black12,
            shape:  RoundedRectangleBorder(
             // borderRadius:BorderRadius.circular(12.0),
            ),
            onTap: ()=>
              moveTodetails(context),

            //leading: Image.network(item.image),
            title: Text("\n"+widget.item.title ,style: subHeadingStyle2,),

            subtitle:
                Column(
                  children: [
                    SizedBox(height:10),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined,color: Colors.black,),
                      SizedBox(
                        width:10,
        ),
                     Text(widget.item.startTime +" to "+widget.item.endTime,style: subTitleStyle7,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.health_and_safety_outlined,color:Colors.black),
                        SizedBox(width:10),
                        Text(widget.item.Doctor,style: subTitleStyle7,),
                      ],
                    ),
                    //SizedBox(height: 20,),

                  ],
                )


        ),
      );

  }
}