part of 'note_bloc.dart';

class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final int color;
  final String category;
  final Color colorCategory;
  final bool isList;

  const NoteLoaded({
    this.color = 0xff1977F3,
    this.category = 'No list',
    this.colorCategory = Colors.grey,
    this.isList = true,
  });
  NoteLoaded copyWith(
          {int? color,
          String? category,
          Color? colorCategory,
          bool? isList,
          NoteModels? note}) =>
      NoteLoaded(
        color: color ?? this.color,
        category: category ?? this.category,
        colorCategory: colorCategory ?? this.colorCategory,
        isList: isList ?? this.isList,
      );
}

class NoteError extends NoteState {
  final String message;
  const NoteError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
