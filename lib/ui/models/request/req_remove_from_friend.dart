import 'dart:convert';

ReqRemoveFromFriend reqRemoveFromFriendFromJson(String str) => ReqRemoveFromFriend.fromJson(json.decode(str));

String reqRemoveFromFriendToJson(ReqRemoveFromFriend data) => json.encode(data.toJson());

class ReqRemoveFromFriend {
    ReqRemoveFromFriend({
        required this.userId,
    });

    String userId;

    factory ReqRemoveFromFriend.fromJson(Map<String, dynamic> json) => ReqRemoveFromFriend(
        userId: json["UserId"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
    };
}
