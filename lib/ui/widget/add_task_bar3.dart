import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schedule/theme.dart';
import 'package:schedule/ui/widget/button.dart';
import 'package:schedule/ui/widget/input_feild.dart';
import 'package:intl/intl.dart';

import 'package:schedule/models/task.dart';
import 'package:schedule/ui/widget/input_feild2.dart';
class AddTaskPage3 extends StatefulWidget {
  const AddTaskPage3({Key? key}) : super(key: key);

  @override
  State<AddTaskPage3> createState() => _AddTaskPage2State();
}

class _AddTaskPage2State extends State<AddTaskPage3> {
 // final TaskController _taskController=Get.put(TaskController());
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _noteController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _timeController=TextEditingController();
  DateTime _selectedDate=DateTime.now();
  String _endTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _startTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _selectedType="pills";
  List<String>Typelist=[
   "pills",
    "ml",
    "mg",
  ];
  String _selectedRepeate="None";
  List<String>rangeList=[
    "only for this day",
    "Week",
    "Month",
    "Year",
    "Daily",
  ];
  int _selectedRemind=5;
  List<int>remindList=[
    5,
    10,
    15,
    20,
  ];
  int _selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _appBar(context),
        body:Container(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Add Pills",
                  style:subHeadingStyle,
                ),

                MyInputFeild(title: "Pills Name", hint: "Enter your pill's name",controller: _noteController, ),
                MyInputFeild2(title: "Pills Amount", hint: "Enter amount of pills you will take at a time",controller: _nameController,Text:""),


                   MyInputFeild(
                          title: "Type" ,hint: "$_selectedType",
                          widget:DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                                  color:Colors.grey),
                              iconSize:32,
                              elevation: 4,
                              style: subTitleStyle,
                              underline: Container(height: 0,),
                              onChanged: (String? newValue){
                                setState(() {
                                  _selectedType=newValue!;
                                });
                              },
                              items:Typelist.map<DropdownMenuItem<String>>((String? value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!,style:TextStyle(color: Colors.grey)),
                                );
                              }
                              ).toList()

                          ),
                        ),
                MyInputFeild(title: "Starting Date", hint: DateFormat.yMd().format(_selectedDate),

                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined,
                        color: Colors.grey),

                    onPressed: (){
                      _getDateFromUser();
                    },),),
                    SizedBox(width: 12),

                          
                           MyInputFeild2(
                                title: "How Long??", hint: "Enter no of days",controller:_timeController ,Text:"days"
                            ),
                //SizedBox(height: 18,),
                MyInputFeild(title: "Remind", hint: "$_selectedRemind minutes early",
                  widget:DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down,
                          color:Colors.grey),
                      iconSize:32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(height: 0,),
                      onChanged: (String? newValue){
                        setState(() {
                          _selectedRemind=int.parse(newValue!);
                        });
                      },
                      items:remindList.map<DropdownMenuItem<String>>((int value){
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }
                      ).toList()

                  ),
                ),
                MyInputFeild(
                  title: "Time To Take It",
                  hint:_startTime,
                  widget: IconButton(
                      onPressed: (){
                        _getTimeFromUser(isStartTime:true);
                      },
                      icon:Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      )
                  ),
                ),
                SizedBox(height: 18,),


                Row(
                  children: [
                    SizedBox(width:230),
                    MyButton(label: "Add To   Reminder",
                      onTap:_validateDate,

                    ),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
  _validateDate(){
    if(_timeController.text.isNotEmpty && _noteController.text.isNotEmpty && _nameController.text.isNotEmpty){
      //_addTaskToDb();
      // Get.back();
      //_nameController.clear();
      //_noteController.clear();
      // _titleController.clear();
      Get.back();
    }else if(_timeController.text.isEmpty || _noteController.text.isEmpty || _nameController.text.isEmpty){
      Get.snackbar("Required","All feilds are required!");
      snackPosition:SnackPosition.BOTTOM;
      backgroundColor:Colors.white;
      colorText:pinkClr;
      icon:Icon(Icons.warning_amber_rounded);
    }
  }



  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size:20,
            color: Colors.white,
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

  _getDateFromUser()async{
    DateTime? _pickerDate=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015), lastDate: DateTime(2121));
    if(_pickerDate!=null){
      setState((){
        _selectedDate=_pickerDate;
        print(_selectedDate);
      });
    }else{
      print("it is null or something is wrong");
    }
  }
  _getTimeFromUser({required bool isStartTime})async{
    var pickedTime=await _showTimepicker();
    String formatedTime=pickedTime.format(context);
    if(pickedTime==null){
      print("Time canceld");
    }else if(isStartTime==true){
      setState(() {
        _startTime = formatedTime;
      });
    }else if(isStartTime==false){
      setState(() {
        _endTime=formatedTime;
      });


    }
  }
  _showTimepicker(){
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        )
    );
  }
}
