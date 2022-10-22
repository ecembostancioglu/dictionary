import 'dart:convert';

import 'package:dictionary/models/words.dart';
import 'package:http/http.dart' as http;
class DictionaryService{

  Future<List<String>> searchWord(String word)async{
    Uri url=Uri.parse('https://sozluk.gov.tr/gts?ara=$word');
    final response=await http.get(url);

    if(response.statusCode == 200) {
      final result=json.decode(response.body);
      List<String> means=[];

      if(result[0] != null){
        Words words=Words.fromJson(result[0]);
        for(MeansList mean in words.meansList!){
           means.add(mean.mean!);
        }
      }
      return means;
    }
    throw Exception('Bad Request');
    }
  }
