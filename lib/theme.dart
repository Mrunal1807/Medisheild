import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
const Color bluishClr=Color(0xFF4E5AE8);
const Color yellowClr=Color(0xFFFF8746);
const Color pinkClr=Color(0xFFff4667);
const primaryClr=bluishClr;
const Color navyblue=Color(0xFF01579B);
const Color dullblue= Color(0xFF263238);
const Color darkGreyClr=Color(0xFF121212);
Color darkHeaderClr=Color(0xFF424242);
const Color brown=Color(0xFF8D6E63);
const Color dullwhite=Color(0xFFEFEBE9);

class theme{
  static final light=ThemeData(
      backgroundColor: Colors.white,
      primaryColor:Colors.red,
      brightness:Brightness.light,
      );

  static final dark= ThemeData(
  primaryColor: darkGreyClr,
  brightness: Brightness.dark,
  );
}
TextStyle get subHeadingStyle{
  return GoogleFonts.abhayaLibre(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
        color: Colors.black,
    )
  );
}

TextStyle get HeadingStyle{
  return GoogleFonts.abhayaLibre(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
      )
  );
}
TextStyle get titleHeadingStyle{
  return GoogleFonts.actor(
      textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
      )
  );
}
TextStyle get titleHeadingStyle2{
  return GoogleFonts.actor(
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );
}
TextStyle get titleHeadingStyle_2{
  return GoogleFonts.actor(
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
  );
}
TextStyle get subTitleStyle2{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
      )
  );
}
TextStyle get subTitleStyle3{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
      )
  );
}
TextStyle get subTitleStyle4{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
      )
  );
}
TextStyle get titleHeadingStyle3{
  return GoogleFonts.actor(
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )
  );
}
TextStyle get subTitleStyle5{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 17,
         // fontWeight: FontWeight.w800,
          color: Colors.black,
      )
  );
}
TextStyle get subTitleStyle8{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      )
  );
}
TextStyle get subTitleStyle6{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 19,
        //fontWeight: FontWeight.w400,
        color: Colors.black,
      )
  );
}
TextStyle get subTitleStyle7{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14,
        //fontWeight: FontWeight.w400,
        color: Colors.black,
      )
  );
}
TextStyle get titleHeadingStyle4{
  return GoogleFonts.actor(
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w200,
        color: Colors.black,
      )
  );
}
TextStyle get subHeadingStyle2{
  return GoogleFonts.abhayaLibre(
      textStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.grey[400]:Colors.black
      )
  );
}


