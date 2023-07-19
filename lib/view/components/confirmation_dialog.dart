import 'package:flutter/material.dart';

Future<dynamic> confirmationDialog({required BuildContext context, String title = '', String content = ''}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('no'),
        ),
      ],
    ),
  );
}
