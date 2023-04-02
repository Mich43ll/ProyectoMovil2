import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/theme_services.dart';

class paginainicio extends StatefulWidget {
  const paginainicio({Key? key}) : super(key: key);

  @override
  State<paginainicio> createState() => _paginainicioState();
}

class _paginainicioState extends State<paginainicio> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: Column (
        children: [
          Text("Prueba",
          style: TextStyle(
          fontSize: 30
      ),
          ),
        ],
      ),
    );
  }
  _appBar (){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
        },
        child: const Icon(Icons.nightlight_round,
          size: 20,),
      ),
      actions: const [
        Icon(Icons.person,
          size: 20,),
        SizedBox(width: 20,),
      ],
    );
}
}

