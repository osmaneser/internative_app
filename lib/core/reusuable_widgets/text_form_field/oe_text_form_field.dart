import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';

class OeTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool isPrefixIcon;
  final IconData prefixIcon;
  final bool isObsecure;
  final Function(String?) validator;
  final bool autoFocus;
  final bool isDisable;
  final TextInputType keyboardType;
  final AutovalidateMode autoValidateMode;
  final bool isMargingBottom;
  final Color? fillColor;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;

  OeTextFormField({
    this.hintText,
    this.labelText,
    this.controller,
    this.isPrefixIcon = false,
    this.prefixIcon = Icons.ac_unit_sharp,
    this.isObsecure = false,
    required this.validator,
    this.autoFocus = false,
    this.isDisable = false,
    this.keyboardType = TextInputType.text,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.isMargingBottom = true,
    this.fillColor = Colors.red,
    this.textInputAction = TextInputAction.none,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? OeContentText(text: labelText ?? "Hata!") : SizedBox(),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: isMargingBottom ? EdgeInsets.only(bottom: 10) : null,
            child: TextFormField(
              autofocus: autoFocus,
              enabled: !isDisable,
              keyboardType: keyboardType,
              autovalidateMode: autoValidateMode,
              obscureText: isObsecure,
              maxLines: isObsecure ? 1 : 3,
              minLines: TextInputType.multiline == keyboardType ? 3 : 1,
              validator: (val) => validator(val),
              textInputAction: textInputAction,
              decoration: InputDecoration(
                isDense: true,
                //contentPadding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                fillColor: fillColor ?? null,
                filled: true,
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: isPrefixIcon
                    ? Icon(
                        prefixIcon,
                        color: themeData.colorScheme.background.withOpacity(0.7),
                      )
                    : null,
                suffixIcon: suffixIcon,
              ),
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        ],
      ),
    );
  }
}
