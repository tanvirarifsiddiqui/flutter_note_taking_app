/*
 * Title: Abstract Repository
 * Description: Abstract Repository that declares the necessary methods for managing Note Objects
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 7:55 PM
 */

import '../models/note.dart';

abstract class NoteRepository{
  Future<List<Note>> fetchAll();
  Future<void> saveAll(List<Note> notes);
  Future<void> add(Note note);
  Future<void> update(Note note);
  Future<void> delete(int id);
}