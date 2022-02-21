part of 'note_bloc.dart';

class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNoteEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final String title;
  final String body;
  final DateTime created;

  const AddNoteEvent({
    required this.title,
    required this.body,
    required this.created,
  });

  @override
  List<Object> get props => [
        title,
        body,
        created,
      ];
}

class SelectedColorEvent extends NoteEvent {
  final int color;
  const SelectedColorEvent({
    required this.color,
  });

  @override
  List<Object> get props => [color];
}

class SelectedCategoryEvent extends NoteEvent {
  final String category;
  final Color colorCategory;

  const SelectedCategoryEvent({
    required this.category,
    required this.colorCategory,
  });
  @override
  List<Object> get props => [category, colorCategory];
}

class UpdateNoteEvent extends NoteEvent {
  final String title;
  final String body;
  final DateTime created;

  final int index;

  const UpdateNoteEvent({
    required this.title,
    required this.body,
    required this.created,
    required this.index,
  });
  @override
  List<Object> get props => [title, body, created, index];
}

class DeleteNoteEvent extends NoteEvent {
  final int index;
  const DeleteNoteEvent({
    required this.index,
  });
  @override
  List<Object> get props => [index];
}
