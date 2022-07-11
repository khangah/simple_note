import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_list_controller.dart';
import 'package:note/dialog/ask_approve_remove_dialog.dart';
import 'package:note/dialog/edit_note_dialog.dart';
import 'package:note/widget/datetime_text_widget.dart';

class DetailsNoteDialog extends StatelessWidget {
  final int index;

  const DetailsNoteDialog({required this.index, Key? key}) : super(key: key);

  static void show(int index) {
    Get.dialog(DetailsNoteDialog(index: index));
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;

    return Dialog(
      insetPadding: const EdgeInsets.only(left: 20, right: 20),
      child: GetBuilder<NoteListController>(
        builder: (ct) {

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: sizeH / 2,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        ct.list[index].text,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 18),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                    top: 5
                ),
                child: Row(
                  children: [
                    const Text('create: '),
                    DateTimeTextWidget(time: ct.list[index].createTime),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                child: Row(
                  children: [
                    const Text('last edit: '),
                    DateTimeTextWidget(time: ct.list[index].editTime),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        EditNoteDialog.edit(index: index);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await AskApproveRemoveDialog.ask(index)) {
                          Get.back();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
