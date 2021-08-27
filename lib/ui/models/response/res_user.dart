
import 'dart:convert';

ResUser resUserFromJson(String str) => ResUser.fromJson(json.decode(str));

String resUserToJson(ResUser data) => json.encode(data.toJson());

class ResUser {
    ResUser({
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

    factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
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
