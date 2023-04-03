import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pryectomovil2/interfaz/theme.dart';
import 'package:pryectomovil2/interfaz/widgets/campo_ingresar.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime="9:30 PM";
  String _startTime= DateFormat('hh:mm a').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Añadir Tarea",
                style: headingStyle,
              ),
              MyInputField(title: "Titulo", hint: "Ingresa el titulo"),
              MyInputField(title: "Nota", hint: "Ingrese su nota aqui"),
              MyInputField(title: "Fecha", hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon:Icon(Icons.calendar_today_outlined,
                color: Colors.grey,),
                onPressed: (){
                  _getDateFromUser();
                },
              ),),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Fecha de inicio",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  SizedBox(width: 12,),
                  Expanded(
                      child: MyInputField(
                        title: "Fecha de finalización",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2013),
        lastDate: DateTime(2027)
    );
    
    if(_pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
      });
    }else{
      print("El valor es nulo o algo salio mal");
    }
  }

  _appBar (BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
              Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
              "images/usuario.png"
          ),
        ),
        SizedBox(width: 20,),
      ],
    );
  }

  _getTimeFromUser({required bool isStartTime}) async{

    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null){
      print("Time canceld");
    }else if(isStartTime==true){
        setState(() {
          _startTime = _formatedTime;
        });
    }else if(isStartTime==false){
        setState(() {
          _endTime = _formatedTime;
        });
    }
  }

  _showTimePicker(){
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

