
class wallPaperModel {
  String photographer;

  String Photographer_url;
  int Photographer_id;
  srcModel src;
  wallPaperModel(
      {this.src,
      this.photographer,
      this.Photographer_id,

      this.Photographer_url});
  factory wallPaperModel.fromMap(Map<String,dynamic> jsonData){
    return wallPaperModel(
      src: srcModel.fromMap(jsonData["src"]) ,
      photographer: jsonData["photographer"],
      Photographer_id: jsonData["photographer_id"],
      Photographer_url: jsonData["photographer_url"],

    );
  }
}

class srcModel {
  String small;
  String portrait;
  String original;
  srcModel({this.original,this.portrait,this.small});
  factory srcModel.fromMap(Map<String, dynamic> jsonData){
    return srcModel(
      portrait:jsonData["portrait"],
      small: jsonData["small"],
      original: jsonData["original"],
    );
  }
}
