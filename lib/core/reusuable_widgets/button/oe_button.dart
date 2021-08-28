import 'package:flutter/material.dart';
import 'package:internative_app/core/configs/global_constants.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';

class OeButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color? color;
  final Color textColor;
  final bool isDisabled;
  final bool hasBorder;
  final bool isLoading;

  const OeButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor = Colors.white,
    this.isDisabled = false,
    this.hasBorder = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (isDisabled || isLoading) ? null : onTap,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color != null ? color: GlobalConstant.alternativeColor)),
      child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor: Colors.white,
                  ),
                )
              : Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),//TODO: dirty code
                child: OeContentText(text: text, ),
              )
    );
  }
}
