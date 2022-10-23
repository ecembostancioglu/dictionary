import 'package:dictionary/services/dictionary_service.dart';
import 'package:dictionary/view_models/meaning_view_model.dart';
import 'package:flutter/material.dart';

enum Status{initial, loading, notFound, success}

class MeaningListViewModel extends ChangeNotifier{
  MeaningViewModel meaningViewModel=MeaningViewModel(word: '', meanings: []);
  DictionaryService dictionaryService=DictionaryService();

  List<String>? meanings;
  Status status=Status.initial;
  Future<void> getMeanings(String word)async{
    status=Status.loading;
    notifyListeners();
    meanings=await dictionaryService.searchWord(word);
    meaningViewModel=MeaningViewModel(word: word, meanings: meanings!);
    status=meanings!.isNotEmpty
        ? Status.success
        : Status.notFound;
    notifyListeners();
  }
}