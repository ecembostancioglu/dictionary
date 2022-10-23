class Words{
  List<MeansList>? anlamlarListe;

  Words({required this.anlamlarListe});

  Words.fromJson(Map<String,dynamic> json){
    if(json['anlamlarListe'] != null){
      anlamlarListe=<MeansList>[];
      json['anlamlarListe'].forEach((a)
      =>anlamlarListe!.add(MeansList.fromJson(a)));
    }
  }
}

class MeansList{
  String? anlam;

  MeansList({required this.anlam});

  MeansList.fromJson(Map<String,dynamic>json){
    anlam=json['anlam'];
  }

}