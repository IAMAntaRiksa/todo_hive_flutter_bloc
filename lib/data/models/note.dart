import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class NoteModels {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? body;

  @HiveField(2)
  bool? isComplete;

  @HiveField(3)
  int? color;

  @HiveField(4)
  String? category;

  @HiveField(5)
  DateTime? created;

  NoteModels({
    required this.title,
    required this.body,
    required this.isComplete,
    required this.color,
    required this.category,
    required this.created,
  });
}
