import 'dart:convert';

ReqUserDetail reqUserDetailFromJson(String str) => ReqUserDetail.fromJson(json.decode(str));

String reqUserDetailToJson(ReqUserDetail data) => json.encode(data.toJson());

class ReqUserDetail {
    ReqUserDetail({
        required this.id,
    });

    String id;

    factory ReqUserDetail.fromJson(Map<String, dynamic> json) => ReqUserDetail(
        id: json["Id"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
    };
}
