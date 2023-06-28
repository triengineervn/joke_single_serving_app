import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class isLikedProvider extends ChangeNotifier {
  List<String> _jokes = [];
  List<String> get jokes => _jokes;

  void addItem(String joke) {
    _jokes.add(joke);
    notifyListeners();
  }

  void toggleIsLiked(String joke) {
    final isExist = _jokes.contains(joke);
    if (isExist) {
      _jokes.remove(joke);
    } else {
      _jokes.add(joke);
    }
    notifyListeners();
  }

  bool isExist(String joke) {
    final isExist = _jokes.contains(joke);
    return isExist;
  }

  void clearIsLiked() {
    _jokes = [];
    notifyListeners();
  }

  static isLikedProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<isLikedProvider>(
      context,
      listen: listen,
    );
  }
}
