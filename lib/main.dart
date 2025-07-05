/*
 * Title: Main File
 * Description: Main File of the App
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 9:35 AM
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Hive
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Note Taking App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
            useMaterial3: true,
      ),
      initialRoute: '/notes', //will be defined in routes
      getPages: [],
    );
  }
}
