class PersonDetails {
  String _birthday;
  String _knownForDepartment;

  //Null _deathday;
  int _id;
  String _name;

  //List<Null> _alsoKnownAs;
  int _gender;
  String _biography;
  double _popularity;
  String _placeOfBirth;
  String _profilePath;
  bool _adult;
  String _imdbId;

  //Null _homepage;

  PersonDetails({
    String birthday,
    String knownForDepartment,
    //Null deathday,
    int id,
    String name,
    //List<Null> alsoKnownAs,
    int gender,
    String biography,
    double popularity,
    String placeOfBirth,
    String profilePath,
    bool adult,
    String imdbId,
    //Null homepage
  }) {
    this._birthday = birthday;
    this._knownForDepartment = knownForDepartment;
    //this._deathday = deathday;
    this._id = id;
    this._name = name;
    //this._alsoKnownAs = alsoKnownAs;
    this._gender = gender;
    this._biography = biography;
    this._popularity = popularity;
    this._placeOfBirth = placeOfBirth;
    this._profilePath = profilePath;
    this._adult = adult;
    this._imdbId = imdbId;
    //this._homepage = homepage;
  }

  String get birthday => _birthday;

  set birthday(String birthday) => _birthday = birthday;

  String get knownForDepartment => _knownForDepartment;

  set knownForDepartment(String knownForDepartment) =>
      _knownForDepartment = knownForDepartment;

  int get id => _id;

  set id(int id) => _id = id;

  String get name => _name;

  set name(String name) => _name = name;

  int get gender => _gender;

  set gender(int gender) => _gender = gender;

  String get biography => _biography;

  set biography(String biography) => _biography = biography;

  double get popularity => _popularity;

  set popularity(double popularity) => _popularity = popularity;

  String get placeOfBirth => _placeOfBirth;

  set placeOfBirth(String placeOfBirth) => _placeOfBirth = placeOfBirth;

  String get profilePath => _profilePath;

  set profilePath(String profilePath) => _profilePath = profilePath;

  bool get adult => _adult;

  set adult(bool adult) => _adult = adult;

  String get imdbId => _imdbId;

  set imdbId(String imdbId) => _imdbId = imdbId;

  PersonDetails.fromJson(Map<String, dynamic> json) {
    _birthday = json['birthday'];
    _knownForDepartment = json['known_for_department'];
    _id = json['id'];
    _name = json['name'];

    _gender = json['gender'];
    _biography = json['biography'];
    _popularity = json['popularity'];
    _placeOfBirth = json['place_of_birth'];
    _profilePath = json['profile_path'];
    _adult = json['adult'];
    _imdbId = json['imdb_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this._birthday;
    data['known_for_department'] = this._knownForDepartment;
    data['id'] = this._id;
    data['name'] = this._name;

    data['gender'] = this._gender;
    data['biography'] = this._biography;
    data['popularity'] = this._popularity;
    data['place_of_birth'] = this._placeOfBirth;
    data['profile_path'] = this._profilePath;
    data['adult'] = this._adult;
    data['imdb_id'] = this._imdbId;
    return data;
  }

  static Future<PersonDetails> withError(String string) {}
}
