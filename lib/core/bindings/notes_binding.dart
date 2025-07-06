/*
 * Title: Notes Binding
 * Description: Create a new binding class (e.g., NotesBinding) that injects the NoteController and its dependencies (repository binding).
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/6/2025
 * Time: 11:44 AM
 */

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:note_taking_app/data/models/note.dart';
import 'package:note_taking_app/data/repositories/note_repository.dart';
import 'package:note_taking_app/data/repositories/note_repository_impl.dart';
import 'package:note_taking_app/presentation/controllers/note_controller.dart';

class NotesBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure the Hive box is opened. Adjust error handling as needed.
    final Box<Note> noteBox = Hive.box<Note>('noteBox');
    Get.lazyPut<NoteRepository>(() => HiveNoteRepository(noteBox));
    Get.lazyPut<NoteController>(
      () => NoteController(repository: Get.find<NoteRepository>()),
    );
  }
}
