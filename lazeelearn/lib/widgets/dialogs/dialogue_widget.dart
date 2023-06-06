import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Sorry but...",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text("Please log in before you take some quiz")
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: const Text("Confirm"))],
    );
  }
}
