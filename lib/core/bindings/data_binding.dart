/*
 * Title: Integrate Repository Dependency Injection
 * Description: Use GetX to inject the repository into the dependency management system
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 8:16 PM
 * no need right now
 */

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_taking_app/data/models/note.dart';
import 'package:note_taking_app/data/repositories/note_repository_impl.dart';
import 'package:note_taking_app/data/repositories/note_repository.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure the Hive box in open before injecting the repository
    final Box<Note> noteBox = Hive.box<Note>('noteBox');
    Get.lazyPut<NoteRepository>(() => HiveNoteRepository(noteBox));
  }
}