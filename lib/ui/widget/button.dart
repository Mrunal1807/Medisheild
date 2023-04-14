import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/theme.dart';

class MyButton extends StatelessWidget{
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label,required this.onTap}):super(key:key);
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:dullblue,
        ),
        child: Align(
          alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color:Colors.white,
          ),
        ),
      ),
      ),
    );
  }
}