import 'dart:convert';

JokesModel jokesModelFromJson(String str) => JokesModel.fromJson(json.decode(str));

String jokesModelToJson(JokesModel data) => json.encode(data.toJson());

class JokesModel {
  JokesModel({
    required this.value,
  });

  String value;

  factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
