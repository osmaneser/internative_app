import 'package:flutter/material.dart';
import 'package:internative_app/core/enums/aler_type_enum.dart';
import 'package:internative_app/core/extensions/alert_type_extension.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';

class DialogService {
  static Future<void> durationDialog({required BuildContext context, Function? whenComplate, required String message}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert Type"),
          content: OeContentText(text: message),
        );
      },
    ).then((value) => whenComplate!());
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Future<void> alertDialog({
    required BuildContext context,
    Function? whenComplate,
    required Widget content,
    required AlertType alertType,
    bool showCancelBtn = true,
    Function? onConfirm,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(alertType.getTitleByAlertType),
          content: content,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showCancelBtn) Expanded(
                  flex: 45,
                  child: Row(
                    children: [
                      Expanded(flex: 45,child: OeButton(onTap: () => Navigator.pop(context), text: "Cancel")),
                      Spacer(flex: 10,)
                    ],
                  ),
                ),
                Expanded(flex:45, child: OeButton(onTap: () => onConfirm!(), text: "Button2")),
              ],
            )
          ],
        );
      },
    ).then((value) {
      return whenComplate;
    });
  }
}
