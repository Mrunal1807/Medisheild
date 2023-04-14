import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule/models/catalog2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule/ui/widget/details2.dart';
//import 'package:schedule/ui/widget/item_widget2.dart';
import '../ui/widget/ScreenArgumentdoctor.dart';
import '../util/route.dart';
import '../widget/drawer.dart';
import 'package:schedule/ui/widget/item_widget.dart';
import 'package:schedule/ui/widget/add_task_bar2.dart';

class doctor extends StatefulWidget{
  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  //final int day=30;
final Stream<QuerySnapshot>_stream=FirebaseFirestore.instance.collection("doctor").snapshots();
 // final String name="mrunal";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 0));

    setState(() {});


  }
  @override
  Widget build(BuildContext context) {
    //final dummyList=List.generate(50, (index) => CatalogModel.item[0]);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Health Care Provider"),
      ),
      body: StreamBuilder(
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
                        await Navigator.push(context,MaterialPageRoute(builder: (builder)=>details2(
                            document: document,
                            id: snapshot.data!.docs[index].id,
                        )
                        )



                        );
                        setState(() {

                        });

                      },
                      leading: Image.asset('images/doctor.png',scale: 10,),
                      title: Text(document["doctor's name"]),
                      subtitle: Text(document["speciality"]),
                      trailing: Text("\$${document["fees"]}",
                          textScaleFactor: 1.5,
                          style:TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w400,
                          ))

                  ),
                );
              },
                itemCount:snapshot.data?.docs.length,
            )

            );
        }
      ),

      drawer: Mydrawer(),
      floatingActionButton:
      Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor:  Colors.blueGrey,
          onPressed: ()=>moveToaddtask2(context),
            child:Icon(Icons.add,size: 35,),
        ),
      ),
    );

    //throw UnimplementedError();

  }
  moveToaddtask2(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.addtask2route );
    setState(() {

    });
  }

}