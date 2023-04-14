import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/theme.dart';
import 'package:schedule/ui/widget/button.dart';
import 'package:schedule/ui/widget/input_feild.dart';
import 'package:intl/intl.dart';
import 'package:schedule/widget/doctor.dart';
import 'ScreenArgumentdoctor.dart';
import 'input_feild2.dart';
import 'package:schedule/ui/widget/ScreenArgumentdoctor.dart';
class EditTaskPage2 extends StatefulWidget {
  EditTaskPage2({Key,key,required this.name,required this.speciality,required this.email,
    required this.Contact_number,required this.Location,required this.fees,required this.id}):super(key:key);
  final String name;
  final String speciality;
  final String email;
  final String Contact_number;
  final String Location;
  final String fees;
  final String id;


  @override
  State<EditTaskPage2> createState() => _EditTaskPage2State();
}

class _EditTaskPage2State extends State<EditTaskPage2> {



   late final TextEditingController _titleController;
   late final TextEditingController _noteController;
   late final TextEditingController _nameController;
   late final TextEditingController _emailController;
   late final TextEditingController _feesController;
   late final TextEditingController _addressController;


  DateTime _selectedDate=DateTime.now();
  String _endTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _startTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
  int _selectedRemind=5;
  List<int>remindList=[
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeate="None";
  List<String>repeateList=[
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor=0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    _titleController=TextEditingController(text:widget.name);
    _noteController=TextEditingController(text:widget.speciality);
    _nameController=TextEditingController(text:widget.Contact_number);
    _emailController=TextEditingController(text:widget.email);
    _feesController=TextEditingController(text:widget.fees);
    _addressController=TextEditingController(text:widget.Location);

    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _appBar(context),
        body:Container(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Edit Doctor's details",
                  style:subHeadingStyle,
                ),
                MyInputFeild(title:  "Doctor's name", hint: "Enter Doctor's name",controller:_titleController,),
                MyInputFeild(title:"Speciality", hint: "Enter Doctor's Speciality",controller: _noteController),
                MyInputFeild2(title: "Contact number", hint: "Phone Number",controller:_nameController, Text: "",),
                MyInputFeild(title:"Email Id", hint: "Email",controller: _emailController,),
                MyInputFeild2(title: "Fees", hint: "Fees per appointment",Text:"Rs" ,controller:_feesController,),
                MyInputFeild(title: "Location", hint: "Enter address",controller: _addressController,),
                SizedBox(height: 30,),




    Row(
                  children: [
                    SizedBox(
                      width: 230,
                    ),
                    MyButton(label: "Edit"+"\n"+"Details",
                        onTap:() async {
                          if(_titleController.text.isNotEmpty ){

                            FirebaseFirestore.instance.collection("doctor").doc(widget.id).update({
                              "doctor's name":_titleController.text,
                              "speciality":_noteController.text,
                              "Contact number":_nameController.text,
                              "Email id":_emailController.text,
                              "fees":_feesController.text,
                              "Location":_addressController.text,

                            });
                            await Navigator.push(context,MaterialPageRoute(builder: (builder)=>doctor(),));
                          }
                          else if(_titleController.text.isEmpty && _nameController.text.isEmpty){
                            Get.snackbar("Required"," Doctor's name is required!");
                            snackPosition:SnackPosition.BOTTOM;
                            backgroundColor:Colors.white;
                            colorText:pinkClr;
                            icon:Icon(Icons.warning_amber_rounded);
                          }


                        }
                    ),

                  ],
                ),

              ],


            ),
          ),
        )
    );
  }
  /*_validateDate(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty && _nameController.text.isNotEmpty){
      //_addTaskToDb();
     // Get.back();
      //_nameController.clear();
      //_noteController.clear();
     // _titleController.clear();
      Get.back();
    }else if(_titleController.text.isEmpty || _noteController.text.isEmpty || _nameController.text.isEmpty){
      Get.snackbar("Required","All feilds are required!");
      snackPosition:SnackPosition.BOTTOM;
      backgroundColor:Colors.white;
      colorText:pinkClr;
      icon:Icon(Icons.warning_amber_rounded);
    }
  }*/



  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size:20,
            color: Get.isDarkMode? Colors.white:Colors.black
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
              "images/img.png"
          ),
        ),
        SizedBox(width:20 ,),
      ],
    );
  }




}
