import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/util/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/drawer.dart';
import 'package:schedule/theme.dart';


class home_page1 extends StatefulWidget {
  @override
  State<home_page1> createState() => _home_page1State();
}
class _home_page1State extends State<home_page1> {
  get borderRadius => BorderRadius.circular(8.0);
  moveToappointment(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.appointmentRoute );
    setState(() {

    });
  }
  moveTodoctor(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.doctorroute );
    setState(() {

    });
  }
  moveTomedicine(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    await Navigator.pushNamed(context,MyRoutes.medicineroute );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: 
           AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light,), //<-- For iOS SEE HERE (dark icons)
             backgroundColor: Colors.brown,
             title: Text("Schedule",style: titleHeadingStyle,
        textScaleFactor: 1.2,),
      ),
      body:Material(
        child:SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(
                  height:0.0,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 64.0),
                  child: Column(children:[
                    SizedBox(
                      height:15.0,
                    ),
                    Column(
                        children: [
                              Material(
                                child:InkWell(
                                  onTap:() =>moveTomedicine(context),
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 0),
                                    alignment: Alignment.center,
                                    height: 280,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.blueGrey,
                                      boxShadow:[
                                        BoxShadow(color: Colors.grey,
                                            spreadRadius: 3,
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: Image.asset('images/img_1.png',scale: 4.5,),
                                  ),
                                ),
                              ),
                          SizedBox(
                            height: 12,
                          ),
                              Text("  Meditrack",style:subHeadingStyle,
                                ),
                          SizedBox(
                            height:15,
                          ),
                              Material(
                                child:InkWell(
                                  onTap:() =>moveToappointment(context),
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    alignment: Alignment.center,
                                    height: 280,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.blueGrey,
                                      boxShadow:[
                                        BoxShadow(color: Colors.grey,
                                            spreadRadius: 3,
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: Image.asset('images/img_2.png',scale: 2,),
                                  ),
                                ),
                              ),
                          SizedBox(
                            height: 12,
                          ),
                              Text(" Appointments",
                                  style:subHeadingStyle,),
                          SizedBox(
                            height:18,
                          ),
                          Material(
                            child:InkWell(
                              onTap:() =>moveTodoctor(context),
                              child: AnimatedContainer(

                                duration: Duration(seconds: 1),
                                alignment: Alignment.center,
                                height: 280,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.blueGrey,
                                  boxShadow:[
                                    BoxShadow(color: Colors.grey,
                                        spreadRadius: 3,
                                        blurRadius: 5)
                                  ],
                                ),
                                child: Image.asset('images/img3.png',scale: 3.5,),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text("    Health care""\n""      Provider",
                            style:subHeadingStyle),
                        ]
                    ),
                  ],
                  ),
                )
              ]),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}