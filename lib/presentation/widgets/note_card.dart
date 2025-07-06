/*
 * Title: Note Card Custom widget
 * Description: A widget to display note title, a snippet of content, and the creation/updated date
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 10:36 PM
 */
import 'package:flutter/material.dart';
import 'package:note_taking_app/data/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const NoteCard({super.key, required this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(note.title, style: TextStyle(
          fontWeight: FontWeight.bold)),
        subtitle: Text(
          '${note.timestamp.day}/${note.timestamp.month}/${note.timestamp.year}',
          style: TextStyle(fontSize: 12, color: Colors.grey)),
        onTap: onTap,
      ),
    );
  }
}