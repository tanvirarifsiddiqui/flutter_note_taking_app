/*
 * Title: Add or Edit Note View
 * Description: Form for adding and editing a note with proper validations.
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/6/2025
 * Time: 11:08 AM
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/presentation/controllers/note_controller.dart';
import 'package:note_taking_app/presentation/widgets/app_button.dart';
import 'package:note_taking_app/presentation/widgets/app_text_field.dart';
import '../../data/models/note.dart';

class AddEditNoteView extends StatefulWidget {
  const AddEditNoteView({super.key});

  @override
  State<AddEditNoteView> createState() => _AddEditNoteViewState();
}

class _AddEditNoteViewState extends State<AddEditNoteView> {
  final NoteController controller = Get.find<NoteController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  Note? editingNote;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null && Get.arguments is Note) {
      editingNote = Get.arguments as Note;
      titleController.text = editingNote!.title;
      contentController.text = editingNote!.content;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _saveNote() async {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Both Title and content are required',
        snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // If editing an existing note, update it; otherwise, add a new note.
    if (editingNote != null) {
      Note updatedNote = Note(
        id: editingNote!.id,
        title: title,
        content: content,
        timestamp: DateTime.now(), // update timestamp on saving
        isArchived: editingNote!.isArchived,
      );
      await controller.updateNote(updatedNote);
      Get.snackbar('Success', 'Note updated successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      // Generate a unique id, here we use timestamp in milliseconds
      int newId = DateTime.now().millisecondsSinceEpoch;
      Note newNote = Note(
        id: newId,
        title: title,
        content: content,
        timestamp: DateTime.now(),
        isArchived: false,
      );
      await controller.addNote(newNote).then((e) => Get.snackbar('Success', 'Note added successfu',
          snackPosition: SnackPosition.BOTTOM));
    }
    // Return to previous screen after saving
    Get.back();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add / Edit Note')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              AppTextField(hintText: 'Title', controller: titleController),
              SizedBox(height: 16),
              AppTextField(hintText: 'Content', controller: contentController),
              SizedBox(height: 16),
              AppButton(
                label: 'Save',
                onPressed: () {
                  _saveNote();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
