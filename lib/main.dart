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
import 'package:note_taking_app/core/routes/app_pages.dart';
import 'package:note_taking_app/data/models/note.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive with Flutter support
  await Hive.initFlutter();

  // Register Hive Adapters
  Hive.registerAdapter(NoteAdapter());

  // Open the box for storing notes
  await Hive.openBox<Note>('noteBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Note App MVVM",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      // Optional: Global middleware can be added here
      // For example: middleware: [AuthGuardMiddleware()],
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // home: Scaffold(
      //   appBar: AppBar(title: Text('Note App MVVM')),
      //   body: Center(child: Text('Welcome to Flutter Note App MVVM')),
      // ),
    );
  }
}
