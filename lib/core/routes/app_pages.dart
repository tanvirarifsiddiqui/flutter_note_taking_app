/*
 * Title: App Pages
 * Description: Map route names to views and their corresponding Bindings.
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/6/2025
 * Time: 11:36 AM
 */

import 'package:get/get.dart';
import 'package:note_taking_app/core/bindings/notes_binding.dart';
import 'package:note_taking_app/presentation/views/add_edit_note_view.dart';
import 'package:note_taking_app/presentation/views/note_detail_view.dart';
import 'package:note_taking_app/presentation/views/notes_list_view.dart';

class Routes {
  static const HOME = '/';
  static const ADD_NOTE = '/addEditNote';
  static const NOTE_DETAIL = '/noteDetail';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => NotesListView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: Routes.ADD_NOTE,
      page: () => AddEditNoteView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: Routes.NOTE_DETAIL,
      page: () => NoteDetailView(),
      binding: NotesBinding(),
    ),
  ];
}
