import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/theme.dart';
import 'package:get/get.dart';

import '../../util/route.dart';

class MyInputFeild2 extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final String Text;


  const MyInputFeild2({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    required this.Text,


  }) : super(key: key);

  @override
  State<MyInputFeild2> createState() => _MyInputFeild2State();
}

class _MyInputFeild2State extends State<MyInputFeild2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

              Text(
              widget.title,
                style:titleStyle
              ),

          Container(
            height:52 ,
            margin: EdgeInsets.only(top:8.0),
            padding:EdgeInsets.only(left: 14),
           // color: Colors.grey,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
            child: Container(
              color: Colors.white,
              child: Row(
              children:[
                Expanded(
                    child:TextFormField(
                      readOnly: widget.widget==null?false:true,
                  autofocus: true,
                  cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                  controller: widget.controller,
                  keyboardType: TextInputType.number,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText:widget.hint,
                    hintStyle: subTitleStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width:0,

                      )
                    )
                  ),
                )
                ),
                widget.widget==null?Container():Container(child:widget.widget),
              ]
          ),
            )
          ),
        ],

      ),
    );
  }

}
