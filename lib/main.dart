import "package:flutter/material.dart";
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pryectomovil2/interfaz/pagina_inicio.dart';
import 'package:pryectomovil2/interfaz/theme.dart';
import 'package:pryectomovil2/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:Themes.ligth,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      home:const paginainicio()
    );
  }
}
