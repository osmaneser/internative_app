import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internative_app/core/enums/image_type_enum.dart';

class OeProfileImageAvatar extends StatelessWidget {
  final String imgUrl;
  final ImageType imageType;
  const OeProfileImageAvatar({Key? key, required this.imgUrl, required this.imageType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.grey.shade200,
        child: _getImageByImageType(imgUrl, imageType),
      ),
    );
  }

  _getImageByImageType(imgUrl, imageType) {
    switch (imageType) {
      case ImageType.Asset:
        return Image.asset("$imgUrl");
      case ImageType.Network:
        return Image.network("$imgUrl");
      case ImageType.Svg:
        return SvgPicture.asset("$imgUrl");
      default:
    }
  }
}
