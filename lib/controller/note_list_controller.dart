import 'package:get/get.dart';
import 'package:note/data/app_data.dart';
import 'package:note/model/note_model.dart';

class NoteListController extends GetxController {
  List<NoteModel> list = [];

  String editingText = '';

  @override
  void onInit() {
    super.onInit();
    _loadNoteList();
  }

  void _loadNoteList() async {
    list = await AppData.getNoteList();
    update();
  }

  void add(String text) async  {
    final nowTime = DateTime.now().millisecondsSinceEpoch;
    list.add(NoteModel(text: text, createTime: nowTime, editTime: nowTime));
    /// this delay just for fun
    await Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  void edit(int i, String text) async {
    list[i].editTime = DateTime.now().millisecondsSinceEpoch;
    list[i].text = text;
    /// this delay just for fun
    await Future.delayed(const Duration(milliseconds: 200));
    update();
  }

  void remove(int i) async {
    list.removeAt(i);
    AppData.setNoteList(list);
    await Future.delayed(const Duration(milliseconds: 400));
    update();
  }


}
