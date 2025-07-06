/*
 * Title: Note Controller
 * Description: Controller that manages the state for Note objects
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 9:25 PM
 */

import 'package:get/get.dart';
import 'package:note_taking_app/data/models/note.dart';
import 'package:note_taking_app/data/repositories/note_repository.dart';

class NoteController extends GetxController with StateMixin<List<Note>>{
  //observable list of notes
  RxList<Note> notes = <Note>[].obs;

  //currently selected note (nullable0
  Rx<Note?> selectedNote = Rx<Note?>(null);

  //Repository instance injected via DI
  final NoteRepository repository;

  NoteController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    // Initial load of notes
    loadNotes();

    //Reactive Worker: Automatically save when notes list updates
    ever(notes, (_){
      //Assuming repository has a saveAll method for batch saving
      repository.saveAll(notes);
    });
  }

  //Loads Notes from Repository using StateMixin
  Future<void> loadNotes() async {
    try{
      change(null, status: RxStatus.loading());
      final loadedNotes = await repository.fetchAll();
      notes.assignAll(loadedNotes);
      change(loadedNotes, status: RxStatus.success());
    }catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  //Adds a new note and updates State
  Future<void> addNote(Note note) async {
    try{
      await repository.add(note);
      notes.add(note);
    }catch (e) {
      Get.snackbar('Error', 'Failed to add note: \n$e');
    }
  }

  //Updates an existing note and refreshes the observable list
  Future<void> updateNote(Note note) async {
    try{
      await repository.update(note);
      int index = notes.indexWhere((n) => n.id == note.id);
      if(index != -1){
        notes[index] = note;
        notes.refresh();
      }
    }catch (e) {
      Get.snackbar('Error', 'Failed to update note: \n$e');
    }
  }

  //Deletes a note and removes it from the observable list
  Future<void> deleteNote(int id) async {
    try{
      await repository.delete(id);
      notes.removeWhere((n) => n.id == id);
    }catch (e){
      Get.snackbar('Error', 'Failed to delete note:\n$e');
    }
  }
}