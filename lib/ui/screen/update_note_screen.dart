import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/data/helpers/selectCategory.dart';
import 'package:app_notes/data/models/note.dart';
import 'package:app_notes/ui/widget/selectedColor.dart';
import 'package:app_notes/ui/widget/textFieldBody.dart';
import 'package:app_notes/ui/widget/textFieldTitle.dart';
import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowNotePage extends StatefulWidget {
  final NoteModels note;
  final int index;

  const ShowNotePage({Key? key, required this.note, required this.index})
      : super(key: key);

  @override
  _ShowNotePageState createState() => _ShowNotePageState();
}

class _ShowNotePageState extends State<ShowNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note.title);
    _noteController = TextEditingController(text: widget.note.body);

    // BlocProvider.of<NoteBloc>(context)
    //     .add(SelectedColorEvent(color: widget.note.color!));
    // BlocProvider.of<NoteBloc>(context).add(SelectedCategoryEvent(
    //     category: widget.note.category!, colorCategory: Colors.black));

    super.initState();
  }

  @override
  void dispose() {
    clearText();
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void clearText() {
    _titleController.clear();
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: TextFrave(
            text: widget.note.title!,
            fontWeight: FontWeight.w500,
            fontSize: 17),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Center(
                child: TextFrave(
              text: 'Cancel',
              fontSize: 15,
              color: Color(0xff0C6CF2),
            ))),
        actions: [
          BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<NoteBloc>(context).add(UpdateNoteEvent(
                      title: _titleController.text,
                      body: _noteController.text,
                      created: DateTime.now(),
                      index: widget.index));

                  clearText();

                  Navigator.pop(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: const TextFrave(
                      text: 'Save',
                      fontSize: 15,
                      color: Color(0xff0C6CF2),
                    )),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextTitle(
                  controller: _titleController,
                ),
                const SizedBox(height: 20.0),
                TextWriteNote(controller: _noteController),
                const SizedBox(height: 20.0),
                _Category(),
                const SizedBox(height: 30.0),
                const SelectedColors(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xffF6F8F9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(5),
            child: TextFrave(text: 'Coming soon', color: Colors.red),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: TextFrave(text: 'Category'),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                alignment: Alignment.center,
                height: 40,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 7, spreadRadius: -5.0)
                    ]),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () => showDialogBottomFrave(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<NoteBloc, NoteState>(
                          builder: (_, state) => Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 4.0),
                                borderRadius: BorderRadius.circular(7.0)),
                          ),
                        ),
                        BlocBuilder<NoteBloc, NoteState>(
                            builder: (_, state) => const TextFrave(
                                text: 'Work', fontWeight: FontWeight.w600)),
                        const Icon(Icons.expand_more)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
