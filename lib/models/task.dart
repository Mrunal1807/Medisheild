class Task{
  String? title;
  String? location;
  String? doctor_name;
  String? Date;
  String? start_time;
  String? end_time;
  int? remind;
  String? repeat;



  Task({
   this.title,
   this.location,
    this.doctor_name,
    this.Date,
    this.start_time,
    this.end_time,
    this.remind,
    this.repeat,
});

  Task.fromJson(Map<String,dynamic> json){
    title=json['title'];
    location=json['location'];
    doctor_name=json['doctor name'];
    Date=json['Date'];
    start_time=json['start time'];
    end_time=json['end time'];
    remind=json['remind'];
    repeat=json['repeat'];
  }


  Map<String,dynamic> toJson(){
    final Map<String,dynamic>data=new Map<String,dynamic>();
    data['title']=this.title;
    data['location']=this.location;
    data['doctor name']=this.doctor_name;
    data['Date']=this.Date;
    data['start time']=this.start_time;
    data['end time']=this.end_time;
    data['remind']=this.remind;
    data['repeat']=this.repeat;
    return data;

  }
}