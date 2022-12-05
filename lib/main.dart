import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:keep_files/Model/models.dart';
import 'package:path_provider/path_provider.dart';

import 'homescreen.dart';

late Box _mybox;
void main() async {
WidgetsFlutterBinding.ensureInitialized();


Directory document = await getApplicationDocumentsDirectory();
await Hive.initFlutter(document.path);

Hive.registerAdapter<notesModel>( notesModelAdapter() );
_mybox =  await Hive.openBox<notesModel>("keepnotes");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.1),
      ),
      home: Homescreen( ),
    );
  }
}