import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_list_controller.dart';
import 'package:note/page/note_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NoteListController());
    return GetMaterialApp(
      title: 'Simple Note',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoteListPage(),
    );
  }
}
