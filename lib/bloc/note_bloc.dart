import 'dart:async';

import 'package:app_notes/data/models/note.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<AddNoteEvent>(_onAddNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
    on<UpdateNoteEvent>(_onUpdateNoteEvent);
    on<SelectedColorEvent>(_onSelectedColorEvent);
  }

  FutureOr<void> _onAddNoteEvent(
      AddNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final box = await Hive.openBox<NoteModels>('rrrrr');
      final NoteModels noteModel = NoteModels(
        title: event.title,
        body: event.body,
        created: DateTime.now(),
      );

      box.add(noteModel);
    } catch (e) {
      emit(const NoteError(message: 'gagal add Data'));
    }
  }

  FutureOr<void> _onDeleteNoteEvent(
      DeleteNoteEvent event, Emitter<NoteState> emit) async {
    var box = await Hive.openBox<NoteModels>('rrrrr');

    box.deleteAt(event.index);
  }

  FutureOr<void> _onUpdateNoteEvent(
      UpdateNoteEvent event, Emitter<NoteState> emit) async {
    try {
      var box = await Hive.openBox<NoteModels>('rrrrr');

      var noteModel = NoteModels(
        title: event.title,
        body: event.body,
        created: DateTime.now(),
      );

      box.putAt(event.index, noteModel);
    } catch (e) {
      emit(const NoteError(message: 'gagal update Data'));
    }
  }

  FutureOr<void> _onSelectedColorEvent(
      SelectedColorEvent event, Emitter<NoteState> emit) {
    NoteLoaded states = state as NoteLoaded;
    emit(states.copyWith(color: event.color));
  }
}
