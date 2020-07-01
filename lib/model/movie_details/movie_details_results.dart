class ProductionCompanies {
  int _id;
  String _logoPath;
  String _name;
  String _originCountry;

  ProductionCompanies(
      {int id, String logoPath, String name, String originCountry}) {
    this._id = id;
    this._logoPath = logoPath;
    this._name = name;
    this._originCountry = originCountry;
  }

  int get id => _id;

  set id(int id) => _id = id;

  String get logoPath => _logoPath;

  set logoPath(String logoPath) => _logoPath = logoPath;

  String get name => _name;

  set name(String name) => _name = name;

  String get originCountry => _originCountry;

  set originCountry(String originCountry) => _originCountry = originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['logo_path'] = this._logoPath;
    data['name'] = this._name;
    data['origin_country'] = this._originCountry;
    return data;
  }
}

class ProductionCountries {
  String _iso31661;
  String _name;

  ProductionCountries({String iso31661, String name}) {
    this._iso31661 = iso31661;
    this._name = name;
  }

  String get iso31661 => _iso31661;

  set iso31661(String iso31661) => _iso31661 = iso31661;

  String get name => _name;

  set name(String name) => _name = name;

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this._iso31661;
    data['name'] = this._name;
    return data;
  }
}

class SpokenLanguages {
  String _iso6391;
  String _name;

  SpokenLanguages({String iso6391, String name}) {
    this._iso6391 = iso6391;
    this._name = name;
  }

  String get iso6391 => _iso6391;

  set iso6391(String iso6391) => _iso6391 = iso6391;

  String get name => _name;

  set name(String name) => _name = name;

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this._iso6391;
    data['name'] = this._name;
    return data;
  }
}
