/*
 * Title: Note Model
 * Description: a Dart class for the note with the fields
 * Author: Md. Tanvir Arif Siddiqui
 * Date: 7/5/2025
 * Time: 7:05 PM
 */


import 'package:hive/hive.dart';

part 'note.g.dart'; // Generated file for Hive adapter

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime timestamp;

  @HiveField(4)
  final bool isArchived;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
    this.isArchived = false,
  });
  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? timestamp,
    bool? isArchived,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}