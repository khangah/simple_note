import 'package:flutter/material.dart';

class DateTimeTextWidget extends StatelessWidget {
  final int time;
  const DateTimeTextWidget({required this.time, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(time);
    return Text(
      '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}  ${date.hour}:${date.minute}',
      style: const TextStyle(fontSize: 10, color: Colors.grey),
    );
  }
}
