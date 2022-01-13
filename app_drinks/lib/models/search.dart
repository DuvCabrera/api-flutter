import 'package:flutter/material.dart';

class Search extends ChangeNotifier{
  late String _word = '';

  set word(String value) {
    _word = value;
  }

  String get word => _word;

  void newWord(String value){
    word = value;
    notifyListeners();
  }
}