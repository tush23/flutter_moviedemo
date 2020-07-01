class PersonResults {
  double _popularity;
  String _knownForDepartment;
  String _name;
  int _id;
  String _profilePath;
  bool _adult;
  List<KnownFor> _knownFor;
  int _gender;

  PersonResults(
      {double popularity,
      String knownForDepartment,
      String name,
      int id,
      String profilePath,
      bool adult,
      List<KnownFor> knownFor,
      int gender}) {
    this._popularity = popularity;
    this._knownForDepartment = knownForDepartment;
    this._name = name;
    this._id = id;
    this._profilePath = profilePath;
    this._adult = adult;
    this._knownFor = knownFor;
    this._gender = gender;
  }

  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  String get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String get name => _name;
  set name(String name) => _name = name;
  int get id => _id;
  set id(int id) => _id = id;
  String get profilePath => _profilePath;
  set profilePath(String profilePath) => _profilePath = profilePath;
  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;
  List<KnownFor> get knownFor => _knownFor;
  set knownFor(List<KnownFor> knownFor) => _knownFor = knownFor;
  int get gender => _gender;
  set gender(int gender) => _gender = gender;

  PersonResults.fromJson(Map<String, dynamic> json) {
    _popularity = json['popularity'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _id = json['id'];
    _profilePath = json['profile_path'];
    _adult = json['adult'];
    if (json['known_for'] != null) {
      _knownFor = new List<KnownFor>();
      json['known_for'].forEach((v) {
        _knownFor.add(new KnownFor.fromJson(v));
      });
    }
    _gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this._popularity;
    data['known_for_department'] = this._knownForDepartment;
    data['name'] = this._name;
    data['id'] = this._id;
    data['profile_path'] = this._profilePath;
    data['adult'] = this._adult;
    if (this._knownFor != null) {
      data['known_for'] = this._knownFor.map((v) => v.toJson()).toList();
    }
    data['gender'] = this._gender;
    return data;
  }
}

class KnownFor {
  String _originalName;
  List<int> _genreIds;
  String _mediaType;
  String _name;
  List<String> _originCountry;
  int _voteCount;
  String _firstAirDate;
  String _backdropPath;
  String _originalLanguage;
  int _id;

  //double _voteAverage;
  String _overview;
  String _posterPath;
  bool _video;
  bool _adult;
  String _originalTitle;
  String _title;
  String _releaseDate;

  KnownFor(
      {String originalName,
      List<int> genreIds,
      String mediaType,
      String name,
        //List<String> originCountry,
      int voteCount,
      String firstAirDate,
      String backdropPath,
      String originalLanguage,
      int id,
      double voteAverage,
      String overview,
      String posterPath,
      bool video,
      bool adult,
      String originalTitle,
      String title,
      String releaseDate}) {
    this._originalName = originalName;
    this._genreIds = genreIds;
    this._mediaType = mediaType;
    this._name = name;
    //this._originCountry = originCountry;
    this._voteCount = voteCount;
    this._firstAirDate = firstAirDate;
    this._backdropPath = backdropPath;
    this._originalLanguage = originalLanguage;
    this._id = id;
    //this._voteAverage = voteAverage;
    this._overview = overview;
    this._posterPath = posterPath;
    this._video = video;
    this._adult = adult;
    this._originalTitle = originalTitle;
    this._title = title;
    this._releaseDate = releaseDate;
  }

  String get originalName => _originalName;
  set originalName(String originalName) => _originalName = originalName;
  List<int> get genreIds => _genreIds;
  set genreIds(List<int> genreIds) => _genreIds = genreIds;
  String get mediaType => _mediaType;
  set mediaType(String mediaType) => _mediaType = mediaType;
  String get name => _name;
  set name(String name) => _name = name;

  // List<String> get originCountry => _originCountry;
  // set originCountry(List<String> originCountry) =>
  //     _originCountry = originCountry;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;
  String get firstAirDate => _firstAirDate;
  set firstAirDate(String firstAirDate) => _firstAirDate = firstAirDate;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  int get id => _id;
  set id(int id) => _id = id;

  // double get voteAverage => _voteAverage;
  // set voteAverage(double voteAverage) => _voteAverage = voteAverage;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  bool get video => _video;
  set video(bool video) => _video = video;
  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;
  String get originalTitle => _originalTitle;
  set originalTitle(String originalTitle) => _originalTitle = originalTitle;
  String get title => _title;
  set title(String title) => _title = title;
  String get releaseDate => _releaseDate;
  set releaseDate(String releaseDate) => _releaseDate = releaseDate;

  KnownFor.fromJson(Map<String, dynamic> json) {
    _originalName = json['original_name'];
    _genreIds = json['genre_ids'].cast<int>();
    _mediaType = json['media_type'];
    _name = json['name'];
    //_originCountry = json['origin_country'].cast<String>();
    _voteCount = json['vote_count'];
    _firstAirDate = json['first_air_date'];
    _backdropPath = json['backdrop_path'];
    _originalLanguage = json['original_language'];
    _id = json['id'];
    //_voteAverage = json['vote_average'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _video = json['video'];
    _adult = json['adult'];
    _originalTitle = json['original_title'];
    _title = json['title'];
    _releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this._originalName;
    data['genre_ids'] = this._genreIds;
    data['media_type'] = this._mediaType;
    data['name'] = this._name;
    //data['origin_country'] = this._originCountry;
    data['vote_count'] = this._voteCount;
    data['first_air_date'] = this._firstAirDate;
    data['backdrop_path'] = this._backdropPath;
    data['original_language'] = this._originalLanguage;
    data['id'] = this._id;
    //data['vote_average'] = this._voteAverage;
    data['overview'] = this._overview;
    data['poster_path'] = this._posterPath;
    data['video'] = this._video;
    data['adult'] = this._adult;
    data['original_title'] = this._originalTitle;
    data['title'] = this._title;
    data['release_date'] = this._releaseDate;
    return data;
  }
}
