// To parse this JSON data, do
//
//     final jokes = jokesFromJson(jsonString);

import 'dart:convert';

List<Jokes> jokesFromJson(String str) => List<Jokes>.from(json.decode(str).map((x) => Jokes.fromJson(x)));

String jokesToJson(List<Jokes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jokes {
  String jokeText;
  String id;
  bool disliked;
  bool liked;

  Jokes({
    required this.jokeText,
    required this.id,
    required this.disliked,
    required this.liked,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
        jokeText: json["jokeText"],
        id: json["id"],
        disliked: json["disliked"],
        liked: json["liked"],
      );

  Map<String, dynamic> toJson() => {
        "jokeText": jokeText,
        "id": id,
        "disliked": disliked,
        "liked": liked,
      };
}
