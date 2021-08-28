import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internative_app/core/configs/path_config.dart';
import 'package:internative_app/core/enums/error_page_type.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_title_text.dart';

class OeErrorPage extends StatelessWidget {
  final ErrorPageType pageType;
  const OeErrorPage({Key? key, required this.pageType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_getErrorImageByType(pageType), SizedBox(height: 8,),_getErrorMessage(pageType)],
        ),
      ),
    );
  }

  _getErrorMessage(ErrorPageType pageType) {
    switch (pageType) {
      case ErrorPageType.BadRequest:
        return OeTitleText(text:"Kötü İstek");
      case ErrorPageType.Unauthorized:
        return OeTitleText(text:"Yetkisiz İşlem");
      case ErrorPageType.NotFound:
        return OeTitleText(text:"Gidilmek istenen adres bulunamadı");
      default:
        return OeTitleText(text:"Beklenmedik bir hata oluştu!");
    }
  }

  _getErrorImageByType(pageType) {
    switch (pageType) {
      case ErrorPageType.BadRequest:
        return SvgPicture.asset("${PathConfig.svgPath}400.svg",width: 150,height: 150,);
      case ErrorPageType.Unauthorized:
        return SvgPicture.asset("${PathConfig.svgPath}unauthorized-person.svg",width: 150,height: 150,);
      case ErrorPageType.NotFound:
        return SvgPicture.asset("${PathConfig.svgPath}404.svg",width: 150,height: 150,);
      default:
      return SvgPicture.asset("${PathConfig.svgPath}no-entry.svg",width: 150,height: 150,);
    }
  }
}
