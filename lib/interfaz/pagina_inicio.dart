import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pryectomovil2/interfaz/a%C3%B1adir_tarea.dart';
import 'package:pryectomovil2/interfaz/theme.dart';
import 'package:pryectomovil2/interfaz/widgets/boton.dart';
import 'package:pryectomovil2/services/notification_services.dart';

import '../services/theme_services.dart';

class paginainicio extends StatefulWidget {
  const paginainicio({Key? key}) : super(key: key);


  @override
  State<paginainicio> createState() => _paginainicioState();
}

class _paginainicioState extends State<paginainicio> {
  DateTime _selectedDate=DateTime.now();
  var notifyHelper;
  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestAndroidPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: Column (
        children: [
          _addTaskBar(),
          _addDateBar()
        ],
      ),
    );
  }


  _addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),

        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),

        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),

        ),
        onDateChange: (date){
          _selectedDate = date;
        },
      ),
    );
  }
  _addTaskBar(){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle,
                  ),
                  Text("Hoy",
                    style: headingStyle,)
                ],
              )
          ),
          MyButton(label: "+ Add Task", onTap: ()=>Get.to(AddTaskPage()))
        ],
      ),
    );
  }
  _appBar (){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Tema cambiado",
            body: Get.isDarkMode?"Modo Oscuro activado":"Modo Claro activado"
          );

        },
        child: Icon(Get.isDarkMode ?Icons.wb_sunny_outlined:Icons.nightlight_round,
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
}

