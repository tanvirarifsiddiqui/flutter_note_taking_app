/*
 * Title: Test Script
 * Description: Testing for Data CRUD
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 9:22 PM
 */


import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:note_taking_app/data/models/note.dart';
import 'package:note_taking_app/data/repositories/note_repository_impl.dart';
import 'package:note_taking_app/data/repositories/note_repository.dart';

void main() async {
  // Initialize Hive for tests
  final dir = await getApplicationDocumentsDirectory();
  Hive..init(dir.path)
    ..registerAdapter(NoteAdapter());

  // Open a test box
  final box = await Hive.openBox<Note>('testNotesBox');
  final NoteRepository repository = HiveNoteRepository(box);

  test('Add and fetch note', () async {
    final note = Note(
      id: 1,
      title: 'Test Note',
      content: 'This is a test note',
      timestamp: DateTime.now(),
      isArchived: false,
    );

    await repository.add(note);
    final notes = await repository.fetchAll();
    expect(notes.length, 1);
    expect(notes.first.title, 'Test Note');
  });

  test('Update note', () async {
    final note = repository.fetchAll().then((notes) => notes.first);
    final updatedNote = (await note).copyWith(title: 'Updated Note');
    await repository.update(updatedNote);
    final notes = await repository.fetchAll();
    expect(notes.first.title, 'Updated Note');
  });

  test('Delete note', () async {
    await repository.delete(1);
    final notes = await repository.fetchAll();
    expect(notes.isEmpty, true);
  });

  // Clean up
  await box.clear();
  await box.close();
}