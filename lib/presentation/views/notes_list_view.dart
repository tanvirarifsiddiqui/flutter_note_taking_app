/*
 * Title: Note List View
 * Description: Displays a list of NoteCards wrapped with Obx to reflect reactive changes from the NoteController.
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/6/2025
 * Time: 10:16 AM
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/core/routes/app_pages.dart';
import 'package:note_taking_app/presentation/controllers/note_controller.dart';
import 'package:note_taking_app/presentation/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
   NotesListView({super.key});
  final NoteController controller = Get.find<NoteController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      body: controller.obx(
          (notes) => ListView.builder(
            itemCount: notes!.length,
            itemBuilder: (_, index) {
              final note = notes[index];
              return NoteCard(
                note: note,
                onTap: () => Get.toNamed('/noteDetail', arguments: note)
              );
            },
          ),
        onEmpty: Center(child: Text('No Notes Available')),
        onError: (error) => Center(child: Text('Error: $error')),
        onLoading: Center(child: CircularProgressIndicator())
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
