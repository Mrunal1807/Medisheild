import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:schedule/home_page.dart';
import 'package:schedule/services/theme_services.dart';
import 'package:schedule/ui/widget/edit2.dart';
import 'package:schedule/theme.dart';
import 'package:schedule/ui/add_task_bar.dart';
import 'package:schedule/ui/widget/add_task_bar2.dart';
import 'package:schedule/ui/widget/add_task_bar3.dart';
import 'package:schedule/ui/widget/detail3.dart';
import 'package:schedule/ui/widget/details.dart';
import 'package:schedule/ui/widget/details2.dart';
import 'package:schedule/ui/widget/edit2.dart';
import 'package:schedule/ui/widget/viewapp.dart';
import 'package:schedule/util/route.dart';
import 'package:schedule/Home_page1.dart';
import 'package:schedule/widget/doctor.dart';
import 'package:schedule/widget/medicine.dart';
import 'package:schedule/widget/register.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   final Future<FirebaseApp>_initialization=Firebase.initializeApp();
   final Stream<QuerySnapshot>_stream=FirebaseFirestore.instance.collection("doctor").snapshots();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future:_initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("Something went wrong");
          }
          if(snapshot.connectionState==ConnectionState.done){
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: theme.light,
              darkTheme: theme.dark,
             // themeMode: ThemeService().theme,

              routes: {
                "/": (context) =>home_page1(),
                MyRoutes.appointmentRoute: (context) => Home_Page(),
                //MyRoutes.loginRoute:(context)=>login_page(),

                MyRoutes.homeRoute: (context) => home_page1(),
                MyRoutes.appointmentRoute: (context) => Home_Page(),
              //  MyRoutes.detailsroute: (context) => details(),
                MyRoutes.addtaskroute: (context) => AddTaskPage(),
                MyRoutes.doctorroute: (context) => doctor(),
                MyRoutes.addtask2route: (context) => AddTaskPage2(),
                //MyRoutes.details2route: (context) => details2(),
                MyRoutes.viewapproute: (context) => viewapp(),
                MyRoutes.medicineroute: (context) => medicine(),
                MyRoutes.addtask3route: (context) => AddTaskPage3(),
                MyRoutes.details3route:(context)=>details3(),
                MyRoutes.registor:(context)=>registor_page(),
                //MyRoutes.edit2:(context)=>EditTaskPage2(),

              },

            );
          }
          return CircularProgressIndicator();
        }
        );
  }
}

