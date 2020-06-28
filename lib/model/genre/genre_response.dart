import 'package:flutter_moviedemo/model/genre/genre_result.dart';

class GenreResponse {
  List<GenresResults> _genres;
  String _error;

  Genre({List<GenresResults> genres,String error}) {
    this._genres = genres;
    this._error=_error;
  }

  List<GenresResults> get genres => _genres;
  set genres(List<GenresResults> genres) => _genres = genres;

  GenreResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      _genres = new List<GenresResults>();
      json['genres'].forEach((v) {
        _genres.add(new GenresResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
  GenreResponse.withError(String errorMsg):_genres=List(),_error=errorMsg;
}