/*
 * Title: Implement Hive Based Repository
 * Description: Implement the repository using Hive to store and retrieve Note objects, taking into account migrations and box versioning when needed.
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 7:57 PM
 */

import 'package:hive/hive.dart';
import 'package:note_taking_app/data/models/note.dart';

import 'note_repository.dart';

class HiveNoteRepository implements NoteRepository {

  final Box<Note> noteBox;
  HiveNoteRepository(this.noteBox);

  @override
  Future<List<Note>> fetchAll() async {
    return noteBox.values.toList();
  }
  
  @override
  Future<void> saveAll(List<Note> notes) async {
    final Map<dynamic, Note> noteMap = {
      for (var note in notes) note.id: note,
  };
    await noteBox.putAll(noteMap);
  }

  @override
  Future<void> add(Note note) async {
    await noteBox.put(note.id, note);
  }

  @override
  Future<void> update(Note note) async {
    await noteBox.put(note.id, note);
  }

  @override
  Future<void> delete(int id) async {
    await noteBox.delete(id);
  }
}