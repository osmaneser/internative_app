import 'dart:convert';

ResUserDetail resUserDetailFromJson(String str) => ResUserDetail.fromJson(json.decode(str));

String resUserDetailToJson(ResUserDetail data) => json.encode(data.toJson());

class ResUserDetail {
    ResUserDetail({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.fullName,
        required this.email,
        required this.birthDate,
        required this.profilePhoto,
        required this.friendIds,
    });

    String id;
    String firstName;
    String lastName;
    String fullName;
    String email;
    DateTime birthDate;
    String profilePhoto;
    List<String> friendIds;

    factory ResUserDetail.fromJson(Map<String, dynamic> json) => ResUserDetail(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        fullName: json["FullName"],
        email: json["Email"],
        birthDate: DateTime.parse(json["BirthDate"]),
        profilePhoto: json["ProfilePhoto"],
        friendIds: List<String>.from(json["FriendIds"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "FullName": fullName,
        "Email": email,
        "BirthDate": birthDate.toIso8601String(),
        "ProfilePhoto": profilePhoto,
        "FriendIds": List<dynamic>.from(friendIds.map((x) => x)),
    };
}
