import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> fetchJokesAsJson() async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('items').get();

  final List<Map<String, dynamic>> jokesJson = [];
  for (final DocumentSnapshot doc in snapshot.docs) {
    final Map<String, dynamic> jokeJson = doc.data() as Map<String, dynamic>;
    jokesJson.add(jokeJson);
  }

  final temp = json.encode(jokesJson);
  return temp;
}
