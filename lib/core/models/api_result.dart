// // To parse this JSON data, do
// //
// //     final apiResult = apiResultFromJson(jsonString);

// import 'dart:convert';

// ApiResult apiResultFromJson(String str) => ApiResult.fromJson(json.decode(str));

// String apiResultToJson(ApiResult data) => json.encode(data.toJson());

// class ApiResult<T,R> {
//     ApiResult({
//        required this.validationErrors,
//        required this.hasError,
//        required this.message,
//        required this.data,
//     });

//     List<R> validationErrors;
//     bool hasError;
//     dynamic message;
//     T data;

//     factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
//         validationErrors: List<R>.from(json["ValidationErrors"].map((x) => x)),
//         hasError: json["HasError"],
//         message: json["Message"],
//         data: T.fromJson(json["Data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "ValidationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
//         "HasError": hasError,
//         "Message": message,
//         "Data": data.toJson(),
//     };
// }