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
          onPressed: () {},
        ),
        Circle(
          color: 0xffF44235,
          onPressed: () {},
        ),
        Circle(
          color: 0xff4CAF50,
          onPressed: () {},
        ),
        Circle(
          color: 0xff0A557F,
          onPressed: () {},
        ),
        Circle(
          color: 0xff9C27B0,
          onPressed: () {},
        ),
        Circle(
          color: 0xffE91C63,
          onPressed: () {},
        ),
        Circle(
          color: 0xff000000,
          onPressed: () {},
        ),
        Circle(
          color: 0xff009688,
          onPressed: () {},
        ),
      ],
    );
  }
}
