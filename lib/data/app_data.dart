import 'package:note/model/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as cv;

class AppData {
  static const _keyNoteList = "listNotes";

  static Future<void> setNoteList(List<NoteModel> list) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(_keyNoteList, cv.jsonEncode(noteListToJson(list)));
  }

  static Future<List<NoteModel>> getNoteList() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final data = sharedPref.getString(_keyNoteList);
    if (data == null) {
      return [];
    }
    return noteListFromJsonList(cv.jsonDecode(data));
  }
}
