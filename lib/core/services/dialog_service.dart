import 'package:flutter/material.dart';
import 'package:internative_app/core/enums/aler_type_enum.dart';
import 'package:internative_app/core/extensions/alert_type_extension.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';

class DialogService {
  static IconData _getAlertIconByType(AlertType type) {
    switch (type) {
      case AlertType.Error:
        return Icons.cancel;
      case AlertType.Success:
        return Icons.check;
      case AlertType.Warning:
        return Icons.warning;
      case AlertType.Question:
        return Icons.help;
      case AlertType.Info:
        return Icons.info;
      default:
        return Icons.circle;
    }
  }

  static Future<void> durationDialog(
      {required BuildContext context, Function? whenComplate, required String message, required AlertType alertType}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_getAlertIconByType(alertType)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    alertType.getTitleByAlertType,
                  ),
                ],
              ),
              Divider()
            ],
          ),
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
    String confirmText = "Evet",
    String cancelText = "Hayır",
    Function? onConfirm,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(alertType.getTitleByAlertType),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 200,
            child: content,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showCancelBtn)
                  Expanded(
                    flex: 45,
                    child: Row(
                      children: [
                        Expanded(flex: 45, child: OeButton(onTap: () => Navigator.pop(context), text: cancelText)),
                        Spacer(
                          flex: 10,
                        )
                      ],
                    ),
                  ),
                Expanded(flex: 45, child: OeButton(onTap: () => onConfirm!(), text: confirmText)),
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
