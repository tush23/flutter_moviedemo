import 'package:flutter_moviedemo/model/genre/genre_result.dart';

import 'movie_details_results.dart';

class MovieDetailsResponse {
  bool _adult;
  String _backdropPath;

  //Null _belongsToCollection;
  int _budget;
  List<GenresResults> _genres;
  String _homepage;
  int _id;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  List<ProductionCompanies> _productionCompanies;
  List<ProductionCountries> _productionCountries;
  String _releaseDate;
  int _revenue;
  int _runtime;
  List<SpokenLanguages> _spokenLanguages;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  MovieDetailsResponse(
      {bool adult,
      String backdropPath,
      //Null belongsToCollection,
      int budget,
      List<GenresResults> genres,
      String homepage,
      int id,
      String imdbId,
      String originalLanguage,
      String originalTitle,
      String overview,
      double popularity,
      String posterPath,
      List<ProductionCompanies> productionCompanies,
      List<ProductionCountries> productionCountries,
      String releaseDate,
      int revenue,
      int runtime,
      List<SpokenLanguages> spokenLanguages,
      String status,
      String tagline,
      String title,
      bool video,
      double voteAverage,
      int voteCount}) {
    this._adult = adult;
    this._backdropPath = backdropPath;
    //this._belongsToCollection = belongsToCollection;
    this._budget = budget;
    this._genres = genres;
    this._homepage = homepage;
    this._id = id;
    this._imdbId = imdbId;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    this._overview = overview;
    this._popularity = popularity;
    this._posterPath = posterPath;
    this._productionCompanies = productionCompanies;
    this._productionCountries = productionCountries;
    this._releaseDate = releaseDate;
    this._revenue = revenue;
    this._runtime = runtime;
    this._spokenLanguages = spokenLanguages;
    this._status = status;
    this._tagline = tagline;
    this._title = title;
    this._video = video;
    this._voteAverage = voteAverage;
    this._voteCount = voteCount;
  }

  bool get adult => _adult;

  set adult(bool adult) => _adult = adult;

  String get backdropPath => _backdropPath;

  set backdropPath(String backdropPath) => _backdropPath = backdropPath;

  // Null get belongsToCollection => _belongsToCollection;
  // set belongsToCollection(Null belongsToCollection) =>
  //     _belongsToCollection = belongsToCollection;
  int get budget => _budget;

  set budget(int budget) => _budget = budget;

  List<GenresResults> get genres => _genres;

  set genres(List<GenresResults> genres) => _genres = genres;

  String get homepage => _homepage;

  set homepage(String homepage) => _homepage = homepage;

  int get id => _id;

  set id(int id) => _id = id;

  String get imdbId => _imdbId;

  set imdbId(String imdbId) => _imdbId = imdbId;

  String get originalLanguage => _originalLanguage;

  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;

  String get originalTitle => _originalTitle;

  set originalTitle(String originalTitle) => _originalTitle = originalTitle;

  String get overview => _overview;

  set overview(String overview) => _overview = overview;

  double get popularity => _popularity;

  set popularity(double popularity) => _popularity = popularity;

  String get posterPath => _posterPath;

  set posterPath(String posterPath) => _posterPath = posterPath;

  List<ProductionCompanies> get productionCompanies => _productionCompanies;

  set productionCompanies(List<ProductionCompanies> productionCompanies) =>
      _productionCompanies = productionCompanies;

  List<ProductionCountries> get productionCountries => _productionCountries;

  set productionCountries(List<ProductionCountries> productionCountries) =>
      _productionCountries = productionCountries;

  String get releaseDate => _releaseDate;

  set releaseDate(String releaseDate) => _releaseDate = releaseDate;

  int get revenue => _revenue;

  set revenue(int revenue) => _revenue = revenue;

  int get runtime => _runtime;

  set runtime(int runtime) => _runtime = runtime;

  List<SpokenLanguages> get spokenLanguages => _spokenLanguages;

  set spokenLanguages(List<SpokenLanguages> spokenLanguages) =>
      _spokenLanguages = spokenLanguages;

  String get status => _status;

  set status(String status) => _status = status;

  String get tagline => _tagline;

  set tagline(String tagline) => _tagline = tagline;

  String get title => _title;

  set title(String title) => _title = title;

  bool get video => _video;

  set video(bool video) => _video = video;

  double get voteAverage => _voteAverage;

  set voteAverage(double voteAverage) => _voteAverage = voteAverage;

  int get voteCount => _voteCount;

  set voteCount(int voteCount) => _voteCount = voteCount;

  MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    //_belongsToCollection = json['belongs_to_collection'];
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = new List<GenresResults>();
      json['genres'].forEach((v) {
        _genres.add(new GenresResults.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = new List<ProductionCompanies>();
      json['production_companies'].forEach((v) {
        _productionCompanies.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = new List<ProductionCountries>();
      json['production_countries'].forEach((v) {
        _productionCountries.add(new ProductionCountries.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      _spokenLanguages = new List<SpokenLanguages>();
      json['spoken_languages'].forEach((v) {
        _spokenLanguages.add(new SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    //data['belongs_to_collection'] = this._belongsToCollection;
    data['budget'] = this._budget;
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this._homepage;
    data['id'] = this._id;
    data['imdb_id'] = this._imdbId;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['popularity'] = this._popularity;
    data['poster_path'] = this._posterPath;
    if (this._productionCompanies != null) {
      data['production_companies'] =
          this._productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this._productionCountries != null) {
      data['production_countries'] =
          this._productionCountries.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this._releaseDate;
    data['revenue'] = this._revenue;
    data['runtime'] = this._runtime;
    if (this._spokenLanguages != null) {
      data['spoken_languages'] =
          this._spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    data['tagline'] = this._tagline;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }

  static Future<MovieDetailsResponse> withError(String string) {}
}
