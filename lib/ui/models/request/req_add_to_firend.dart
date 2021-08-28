import 'dart:convert';

ReqAddToFriend reqAddToFriendFromJson(String str) => ReqAddToFriend.fromJson(json.decode(str));

String reqAddToFriendToJson(ReqAddToFriend data) => json.encode(data.toJson());

class ReqAddToFriend {
    ReqAddToFriend({
        required this.userId,
    });

    String userId;

    factory ReqAddToFriend.fromJson(Map<String, dynamic> json) => ReqAddToFriend(
        userId: json["UserId"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
    };
}
