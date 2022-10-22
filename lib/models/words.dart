class Words{
  List<MeansList>? meansList;

  Words({required this.meansList});

  Words.fromJson(Map<String,dynamic> json){
    if(json['meansList'] != null){
      meansList=[];
      json['meansList'].forEach((a)=>meansList!.add(MeansList.fromJson(a)));
    }
  }
}

class MeansList{
  String? mean;

  MeansList({required this.mean});

  MeansList.fromJson(Map<String,dynamic>json){
    mean=json['anlam'];
  }

}