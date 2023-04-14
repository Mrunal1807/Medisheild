import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:schedule/widget/login_page.dart'
class Mydrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final image='assets/images/acc.no.png';
    return Drawer(

      child:Container(
        color: Colors.black12,
        child: ListView(
          padding:EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.brown),
                margin:EdgeInsets.zero,

                accountName: Text("mrunal"),
                accountEmail: Text("mgraskar99@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:AssetImage(image),
                ),

              ),
            ),






            ListTile(
              leading: Icon(CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text("Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
                color: Colors.black,
              ),
              title: Text("E-mail",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.black,
                ),),
            )
          ],
        ),
      ),
    );



  }

}