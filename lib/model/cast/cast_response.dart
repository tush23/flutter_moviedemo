import 'cast_results.dart';

class CastResponse {
  int _id;
  List<Cast> _cast;
  List<Crew> _crew;

  CastResponse({int id, List<Cast> cast, List<Crew> crew}) {
    this._id = id;
    this._cast = cast;
    this._crew = crew;
  }

  int get id => _id;

  set id(int id) => _id = id;

  List<Cast> get cast => _cast;

  set cast(List<Cast> cast) => _cast = cast;

  List<Crew> get crew => _crew;

  set crew(List<Crew> crew) => _crew = crew;

  CastResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['cast'] != null) {
      _cast = new List<Cast>();
      json['cast'].forEach((v) {
        _cast.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      _crew = new List<Crew>();
      json['crew'].forEach((v) {
        _crew.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._cast != null) {
      data['cast'] = this._cast.map((v) => v.toJson()).toList();
    }
    if (this._crew != null) {
      data['crew'] = this._crew.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<CastResponse> withError(String string) {}
}
