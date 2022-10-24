import 'package:dictionary/widgets/sign_language.dart';
import 'package:flutter/material.dart';

import '../view_models/meaning_list_view_model.dart';
import 'mean_list.dart';

getWidgetByStatus(MeaningListViewModel vm){
  switch(vm.status.index){
    case 0:
      return Padding(
        padding: const EdgeInsets.all(50.0),
        child: Opacity(
            opacity:0.1,
            child: Image.asset('assets/images/tdk.png')),
      );
    case 1:
      return Center(
          child: CircularProgressIndicator());
    case 2:
      return const Center(
          child: Text('No results found.',
        style: TextStyle(fontSize: 18),));
    case 3:
      return MeanList(
          meaningViewModel: vm.meaningViewModel,
          signLanguage:SignLanguage(word: vm.meaningViewModel.word));
  }
}