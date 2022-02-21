// ignore_for_file: use_key_in_widget_constructors

import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategory extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ItemCategory(
      {required this.color, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(color: color, width: 4.0),
                      borderRadius: BorderRadius.circular(7.0)),
                ),
                const SizedBox(width: 10.0),
                TextFrave(text: text, fontSize: 19),
              ],
            ),
            Row(
              children: [
                BlocBuilder<NoteBloc, NoteState>(
                  builder: (_, state) {
                    if (state is NoteLoaded) {
                      return state.category == text
                          ? const Icon(Icons.check)
                          : Container();
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
