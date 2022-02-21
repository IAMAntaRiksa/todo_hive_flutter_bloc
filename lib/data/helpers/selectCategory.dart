import 'package:app_notes/ui/widget/item_category.dart';
import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';

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
          const TextFrave(text: 'Select Category', fontSize: 20),
          const SizedBox(height: 5.0),
          const Divider(),
          const SizedBox(height: 20.0),
          ItemCategory(
            color: Colors.blue,
            text: 'Personal',
            onPressed: () {},
          ),
          ItemCategory(
            color: Colors.green,
            text: 'Friends',
            onPressed: () {},
          ),
          ItemCategory(
            color: Colors.purple,
            text: 'Work',
            onPressed: () {},
          ),
          ItemCategory(
            color: Colors.orange,
            text: 'Erands',
            onPressed: () {},
          ),
          ItemCategory(
            color: Colors.grey,
            text: 'No list',
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}
