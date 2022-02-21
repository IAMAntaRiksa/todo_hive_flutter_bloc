import 'package:app_notes/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Circle extends StatelessWidget {
  final int color;
  final VoidCallback onPressed;

  const Circle({required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onPressed,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(color)),
        child: BlocBuilder<NoteBloc, NoteState>(
          builder: (_, state) {
            if (state is NoteLoaded) {
              return state.color == color
                  ? const Icon(Icons.check, color: Colors.white)
                  : Container();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
