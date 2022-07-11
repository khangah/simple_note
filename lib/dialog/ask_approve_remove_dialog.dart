import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_list_controller.dart';
import 'package:note/widget/note_item_widget.dart';

class AskApproveRemoveDialog extends StatelessWidget {
  static Future<bool> ask(int index) async {
    return await Get.dialog(AskApproveRemoveDialog(index)) ?? false;
  }

  final int index;

  const AskApproveRemoveDialog(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ct = Get.find<NoteListController>();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Do you want to delete this Note?'),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back(result: true);
                        ct.remove(index);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                  TextButton(
                      onPressed: Get.back,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
