import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/ui/widget/cicrle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColors extends StatelessWidget {
  const SelectedColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Circle(
          color: 0xff1977F3,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff1977F3)),
        ),
        Circle(
          color: 0xffF44235,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xffF44235)),
        ),
        Circle(
          color: 0xff4CAF50,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff4CAF50)),
        ),
        Circle(
          color: 0xff0A557F,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff0A557F)),
        ),
        Circle(
          color: 0xff9C27B0,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff9C27B0)),
        ),
        Circle(
          color: 0xffE91C63,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xffE91C63)),
        ),
        Circle(
          color: 0xff000000,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff000000)),
        ),
        Circle(
          color: 0xff009688,
          onPressed: () => BlocProvider.of<NoteBloc>(context)
              .add(const SelectedColorEvent(color: 0xff009688)),
        ),
      ],
    );
  }
}
