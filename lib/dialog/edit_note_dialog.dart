import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_list_controller.dart';

class EditNoteDialog extends StatelessWidget {
  final int index;

  const EditNoteDialog({Key? key, this.index = -1}) : super(key: key);

  static Future<bool> edit({int index = -1}) async {
    final ct = Get.find<NoteListController>();
    if (index != -1) {
      ct.editingText = ct.list[index].text;
    } else {
      ct.editingText = '';
    }
    return await Get.dialog(EditNoteDialog(index: index),
            barrierDismissible: false) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final ct = Get.find<NoteListController>();

    final sizeH = MediaQuery.of(context).size.height;

    return Dialog(
      insetPadding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 0
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: sizeH * 0.6
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
                top: 0
              ),
              child: TextFormField(
                autofocus: true,
                initialValue: ct.editingText,
                minLines: 2,
                maxLines: sizeH~/40,
                onChanged: (v) {
                  ct.editingText = v;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        if (ct.editingText.trim().isEmpty) {
                          return;
                        }
                        if (index == -1) {
                          ct.add(ct.editingText);
                        } else {
                          ct.edit(index, ct.editingText.trim());
                        }
                        Get.back(result: true);
                      },
                      child: Text(index != -1 ? 'Save Change' : 'Add')),
                  TextButton(
                      onPressed: Get.back,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
