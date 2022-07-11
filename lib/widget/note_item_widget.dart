import 'package:flutter/material.dart';
import 'package:note/model/note_model.dart';
import 'package:note/widget/datetime_text_widget.dart';

class NoteItemWidget extends StatelessWidget {
  final NoteModel item;
  final GestureTapCallback? onTap;
  final int maxLineShow;

  const NoteItemWidget(this.item, {this.onTap, this.maxLineShow = 5 , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 4, left: 8, right: 8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: const Offset(0, 4))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.text,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  maxLines: maxLineShow,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DateTimeTextWidget(time: item.createTime)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
