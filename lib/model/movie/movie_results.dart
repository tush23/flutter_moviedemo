class MovieResults {
  String _originalName;
  int _id;
  String _name;
  int _voteCount;
  double _voteAverage;
  String _firstAirDate;
  String _posterPath;
  List<int> _genreIds;
  String _originalLanguage;
  String _backdropPath;
  String _overview;
  List<String> _originCountry;
  double _popularity;
  String _mediaType;
  bool _video;
  String _title;
  String _releaseDate;
  String _originalTitle;
  bool _adult;

  MovieResults(
      {String originalName,
      int id,
      String name,
      int voteCount,
      double voteAverage,
      String firstAirDate,
      String posterPath,
      List<int> genreIds,
      String originalLanguage,
      String backdropPath,
      String overview,
      List<String> originCountry,
      double popularity,
      String mediaType,
      bool video,
      String title,
      String releaseDate,
      String originalTitle,
      bool adult}) {
    this._originalName = originalName;
    this._id = id;
    this._name = name;
    this._voteCount = voteCount;
    this._voteAverage = voteAverage;
    this._firstAirDate = firstAirDate;
    this._posterPath = posterPath;
    this._genreIds = genreIds;
    this._originalLanguage = originalLanguage;
    this._backdropPath = backdropPath;
    this._overview = overview;
    this._originCountry = originCountry;
    this._popularity = popularity;
    this._mediaType = mediaType;
    this._video = video;
    this._title = title;
    this._releaseDate = releaseDate;
    this._originalTitle = originalTitle;
    this._adult = adult;
  }

  String get originalName => _originalName;
  set originalName(String originalName) => _originalName = originalName;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;
  double get voteAverage => _voteAverage;
  set voteAverage(double voteAverage) => _voteAverage = voteAverage;
  String get firstAirDate => _firstAirDate;
  set firstAirDate(String firstAirDate) => _firstAirDate = firstAirDate;
  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  List<int> get genreIds => _genreIds;
  set genreIds(List<int> genreIds) => _genreIds = genreIds;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  List<String> get originCountry => _originCountry;
  set originCountry(List<String> originCountry) =>
      _originCountry = originCountry;
  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  String get mediaType => _mediaType;
  set mediaType(String mediaType) => _mediaType = mediaType;
  bool get video => _video;
  set video(bool video) => _video = video;
  String get title => _title;
  set title(String title) => _title = title;
  String get releaseDate => _releaseDate;
  set releaseDate(String releaseDate) => _releaseDate = releaseDate;
  String get originalTitle => _originalTitle;
  set originalTitle(String originalTitle) => _originalTitle = originalTitle;
  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;

  MovieResults.fromJson(Map<String, dynamic> json) {
    _originalName = json['original_name'];
    _id = json['id'];
    _name = json['name'];
    _voteCount = json['vote_count'];
    _voteAverage = json['vote_average'];
    _firstAirDate = json['first_air_date'];
    _posterPath = json['poster_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _originalLanguage = json['original_language'];
    _backdropPath = json['backdrop_path'];
    _overview = json['overview'];
    _originCountry = json['origin_country'].cast<String>();
    _popularity = json['popularity'];
    _mediaType = json['media_type'];
    _video = json['video'];
    _title = json['title'];
    _releaseDate = json['release_date'];
    _originalTitle = json['original_title'];
    _adult = json['adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this._originalName;
    data['id'] = this._id;
    data['name'] = this._name;
    data['vote_count'] = this._voteCount;
    data['vote_average'] = this._voteAverage;
    data['first_air_date'] = this._firstAirDate;
    data['poster_path'] = this._posterPath;
    data['genre_ids'] = this._genreIds;
    data['original_language'] = this._originalLanguage;
    data['backdrop_path'] = this._backdropPath;
    data['overview'] = this._overview;
    data['origin_country'] = this._originCountry;
    data['popularity'] = this._popularity;
    data['media_type'] = this._mediaType;
    data['video'] = this._video;
    data['title'] = this._title;
    data['release_date'] = this._releaseDate;
    data['original_title'] = this._originalTitle;
    data['adult'] = this._adult;
    return data;
  }
}