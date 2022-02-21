import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/data/models/note.dart';
import 'package:app_notes/ui/screen/add_note_screen.dart';
import 'package:app_notes/ui/screen/update_note_screen.dart';
import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final box = Hive.box<NoteModels>('rrrrr');

  @override
  void initState() {
    BlocProvider.of<NoteBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: const TextFrave(
            text: 'Note', fontWeight: FontWeight.w500, fontSize: 21),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (_, Box box, __) {
            if (box.values.isEmpty) {
              return const Center(
                child: TextFrave(text: 'Without Note', color: Colors.blue),
              );
            }
            return BlocBuilder<NoteBloc, NoteState>(
              builder: (context, state) => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemCount: box.values.length,
                itemBuilder: (_, i) {
                  NoteModels notes = box.getAt(i);
                  return listNotes(context, notes, i);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddNoteScreen()));
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 156, 25, 243),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.blue, blurRadius: 10, spreadRadius: -5.0)
              ]),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Widget listNotes(BuildContext context, NoteModels note, int index) {
  String getTimeString(date) {
    final dateTime = DateTime.parse(date);
    final format = DateFormat('d-MM-y - HH:mm');

    return format.format(dateTime);
  }

  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ShowNotePage(note: note, index: index)));
    },
    child: Dismissible(
      key: Key(note.title!),
      background: Container(),
      direction: DismissDirection.endToStart,
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 35.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        child: const Icon(Icons.delete_sweep_rounded,
            color: Colors.white, size: 40),
      ),
      onDismissed: (direction) =>
          BlocProvider.of<NoteBloc>(context).add(DeleteNoteEvent(index: index)),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        height: 110,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFrave(
                    text: note.title.toString(), fontWeight: FontWeight.w600),
                const TextFrave(
                    text: 'Work', fontSize: 16, color: Colors.blueGrey),
              ],
            ),
            const SizedBox(height: 10.0),
            Wrap(
              children: [
                TextFrave(
                  text: note.body.toString(),
                  fontSize: 16,
                  color: Colors.grey,
                  textOverflow: TextOverflow.ellipsis,
                )
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFrave(
                    text: getTimeString(note.created.toString()),
                    fontSize: 16,
                    color: Colors.grey),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.circle, color: Colors.black, size: 15)),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
