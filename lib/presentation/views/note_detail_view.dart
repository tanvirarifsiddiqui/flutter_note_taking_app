/*
 * Title: Note Detail View
 * Description: Shows the full content of the note along with edit and delete options.
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/6/2025
 * Time: 10:43 AM
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/data/models/note.dart';
import 'package:note_taking_app/presentation/controllers/note_controller.dart';

class NoteDetailView extends StatelessWidget {
  NoteDetailView({super.key});
  final Note note = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              note.content,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    // Navigate to edit screen and pass note as argument
                    Get.toNamed('/addEditNote', arguments: note);
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: (){
                    // todo Call delete method, then go back
                    // Get.find<NoteController>().deleteNote(note.id);
                    Get.back();
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
