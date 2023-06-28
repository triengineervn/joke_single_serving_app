import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jokee_single_serving_app/models/jokes_model.dart';

class JokeController extends ChangeNotifier {
  final List<int> _displayedIndexes = [];

  Future<JokesModel> getData(index) async {
    final collectionRef = FirebaseFirestore.instance.collection('items');

    // ignore: prefer_typing_uninitialized_variables
    var modelData;
    try {
      final querySnapshot = await collectionRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        final randomDoc = querySnapshot.docs[index];
        _displayedIndexes.add(index);
        final data = randomDoc.data();
        modelData = JokesModel.fromJson(data);
      } else {
        debugPrint("No data found");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return modelData; // Return an empty JokesModel if no data found
  }
}
