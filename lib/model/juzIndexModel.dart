class JuzList {
  final List<JuzIndexModel> juzList;

  JuzList({this.juzList});

  factory JuzList.fromJSON(Map<String, dynamic> json) {
    Iterable listJuz = json['juzs'];
    List<JuzIndexModel> juzs =
        listJuz.map((e) => JuzIndexModel.fromJSON(e)).toList();

    return JuzList(juzList: juzs);
  }
}

class JuzIndexModel {
  final int juzIndex;

  JuzIndexModel({this.juzIndex});

  factory JuzIndexModel.fromJSON(Map<String, dynamic> json) {
    return JuzIndexModel(juzIndex: json['juz_number']);
  }
}
