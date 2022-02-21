import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/ui/widget/item_category.dart';
import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showDialogBottomFrave(BuildContext context) {
  showBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
    builder: (context) => Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 4, 6, 7),
                blurRadius: 10,
                spreadRadius: -5.0)
          ]),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          TextFrave(text: 'Select Category', fontSize: 20),
          SizedBox(height: 5.0),
          Divider(),
          SizedBox(height: 20.0),
          ItemCategory(
            color: Colors.blue,
            text: 'Personal',
            onPressed: () => BlocProvider.of<NoteBloc>(context).add(
                const SelectedCategoryEvent(
                    category: 'Personal', colorCategory: Colors.blue)),
          ),
          ItemCategory(
            color: Colors.green,
            text: 'Friends',
            onPressed: () => BlocProvider.of<NoteBloc>(context).add(
                const SelectedCategoryEvent(
                    category: 'Friends', colorCategory: Colors.green)),
          ),
          ItemCategory(
            color: Colors.purple,
            text: 'Work',
            onPressed: () => BlocProvider.of<NoteBloc>(context).add(
                SelectedCategoryEvent(
                    category: 'Work', colorCategory: Colors.purple)),
          ),
          ItemCategory(
            color: Colors.orange,
            text: 'Erands',
            onPressed: () => BlocProvider.of<NoteBloc>(context).add(
                SelectedCategoryEvent(
                    category: 'Erands', colorCategory: Colors.orange)),
          ),
          ItemCategory(
              color: Colors.grey,
              text: 'No list',
              onPressed: () => BlocProvider.of<NoteBloc>(context).add(
                  SelectedCategoryEvent(
                      category: 'No list', colorCategory: Colors.grey))),
        ],
      ),
    ),
  );
}
