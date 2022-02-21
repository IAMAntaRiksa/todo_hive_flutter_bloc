import 'package:app_notes/bloc/note_bloc.dart';
import 'package:app_notes/data/models/note.dart';
import 'package:app_notes/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelsAdapter());
  await Hive.openBox<NoteModels>('rrrrr');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (create) => NoteBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(backgroundColor: Color.fromARGB(255, 139, 197, 255)),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
      ),
    );
  }
}
