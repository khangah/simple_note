import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note/controller/note_list_controller.dart';
import 'package:note/widget/note_item_widget.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteListController>(builder: (ct) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
        ),
        body: ct.list.isEmpty
            ? const Center(
                child: Text(
                  'Note List is Empty',
                  style: TextStyle(fontSize: 22),
                ),
              )
            : ListView.builder(
                itemCount: ct.list.length,
                itemBuilder: (context, i) {
                  return NoteItemWidget(
                    ct.list[i],
                    onTap: () {},
                  );
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
