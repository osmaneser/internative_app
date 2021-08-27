import 'package:flutter/material.dart';


class OeButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color color;
  final Color textColor;
  final bool isDisabled;
  final double customHeight;
  final bool hasBorder;
  final bool isLoading;

  const OeButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
    this.isDisabled = false,
    required this.customHeight,
    this.hasBorder = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      child: TextButton(
        onPressed: (isDisabled || isLoading) ? null :onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: Colors.white,
                    ),
                  )
                : Text("data")
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(style: BorderStyle.solid, color: themeData.primaryColor) : Border(),
      ),
    );
  }
}
