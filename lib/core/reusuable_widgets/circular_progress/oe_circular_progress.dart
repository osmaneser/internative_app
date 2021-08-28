import 'package:flutter/material.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';

class OeCircularProgress extends StatelessWidget {
  final String text;
  const OeCircularProgress({Key? key, this.text = "Lüften Bekleyiniz"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          OeContentText(text: text)
        ],
      ),
    );
  }
}
