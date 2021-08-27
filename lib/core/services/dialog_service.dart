import 'package:flutter/material.dart';

class DialogService {
  static void durationDialog(
    BuildContext context,
  ) async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Title"),
          content: Text("Content"),
        );
      },
    );
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
  }
}
