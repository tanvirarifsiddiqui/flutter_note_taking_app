/*
 * Title: Main File
 * Description: Main File of the App
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 9:35 AM
 */

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/data/models/note.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapters
  Hive.registerAdapter(NoteAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Note App MVVM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Note App MVVM')),
        body: Center(child: Text('Welcome to Flutter Note App MVVM')),
      ),
    );
  }
}
