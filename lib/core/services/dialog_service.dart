import 'package:flutter/material.dart';

class DialogService {
  static Future<void> durationDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Title"),
          content: Text("Content"),
          actions: [
            TextButton(onPressed: (){}, child: Text("Evet")),
            TextButton(onPressed: (){}, child: Text("Hayır"))
          ],
        );
      },
    );
  }
}
