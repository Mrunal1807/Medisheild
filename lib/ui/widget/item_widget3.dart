import 'package:schedule/models/catalog.dart';
import'package:flutter/material.dart';

import '../../theme.dart';
import '../../util/route.dart';
class ItemWidget3 extends StatefulWidget{
  final Item item;

  const ItemWidget3({Key? key, required this.item})
      : assert(item!=null),
        super(key: key);

  @override
  State<ItemWidget3> createState() => _ItemWidget3State();
}

class _ItemWidget3State extends State<ItemWidget3> {

  moveTodetails(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.detailsroute );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Card(

          elevation: 0.0,
              child: ListTile(
                  tileColor: Colors.black12,
                  shape:  RoundedRectangleBorder(
                  ),
                  onTap: ()=>
                      moveTodetails(context),
                  title: Text("\n"+widget.item.title,style: titleHeadingStyle4,),

                  subtitle:
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width:10),
                          Text(widget.item.date,style: subTitleStyle7,),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(
                            width:10,
                          ),
                          Text(widget.item.startTime +" to "+widget.item.endTime,style: subTitleStyle7,),
                        ],
                      ),

                    ],
                  )


              ),

          );



  }
}